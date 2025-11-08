##functions.R

# Count regex matches (Unicode-aware)
count_pat <- function(text, pat) {
  m <- gregexpr(pat, text, perl = TRUE)[[1]]
  if (m[1] == -1) 0 else length(m)
}

# ------------------------------
# Clean Aozora text
# ------------------------------
clean_aozora_text <- function(file_path, encoding = "CP932") {
  lines <- readLines(file_path, encoding = encoding, warn = FALSE)
  lines <- iconv(lines, from = encoding, to = "UTF-8", sub = "")
  lines <- lines[!is.na(lines)]
  
  # Aozora header/footer markers
  dash_idx   <- which(grepl("^-{5,}\\s*$", lines))
  footer_idx <- which(grepl("^底本：", lines))
  
  start <- if (length(dash_idx) >= 2) dash_idx[2] + 1 else 1
  end   <- if (length(footer_idx) >= 1) footer_idx[1] - 1 else length(lines)
  
  body_lines <- lines[start:end]
  
  removed_lines <- c()
  if (start > 1)           removed_lines <- c(removed_lines, lines[1:(start - 1)])
  if (end < length(lines)) removed_lines <- c(removed_lines, lines[(end + 1):length(lines)])
  
  body <- paste(body_lines, collapse = "\n")
  removed_text <- paste(removed_lines, collapse = "\n")
  
  # Remove Aozora inline markup
  body <- gsub("［＃.*?］", "", body, perl = TRUE)
  body <- gsub("《.*?》",  "", body, perl = TRUE)
  body <- gsub("｜",       "", body, perl = TRUE)
  
  list(body = body, removed_text = removed_text)
}

# ------------------------------
# Clean Gutenberg text (standard markers)
# ------------------------------
clean_gutenberg_text <- function(file_path, encoding = "UTF-8") {
  lines <- readLines(file_path, encoding = encoding, warn = FALSE)
  lines <- iconv(lines, from = encoding, to = "UTF-8", sub = "")
  lines <- lines[!is.na(lines)]
  
  start_marker <- grep("\\*\\*\\* START OF THIS PROJECT GUTENBERG EBOOK", lines)
  if (length(start_marker) == 0) {
    start_marker <- grep("\\*\\*\\*START OF THE PROJECT GUTENBERG EBOOK", lines)
  }
  
  end_marker <- grep("\\*\\*\\* END OF THIS PROJECT GUTENBERG EBOOK", lines)
  if (length(end_marker) == 0) {
    end_marker <- grep("\\*\\*\\*END OF THE PROJECT GUTENBERG EBOOK", lines)
  }
  
  start <- if (length(start_marker) >= 1) start_marker[1] + 1 else 1
  end   <- if (length(end_marker) >= 1)   end_marker[1] - 1 else length(lines)
  
  body_lines <- lines[start:end]
  
  removed_lines <- c()
  if (start > 1)           removed_lines <- c(removed_lines, lines[1:(start - 1)])
  if (end < length(lines)) removed_lines <- c(removed_lines, lines[(end + 1):length(lines)])
  
  body <- paste(body_lines, collapse = "\n")
  removed_text <- paste(removed_lines, collapse = "\n")
  
  list(body = body, removed_text = removed_text)
}

# ------------------------------
# Make one summary row for a cleaned text
# ------------------------------
make_row <- function(file_path, site, body, removed_text) {
  total_body_chars <- nchar(body, type = "chars")
  
  kanji    <- count_pat(body, "\\p{Han}")
  hiragana <- count_pat(body, "\\p{Hiragana}")
  katakana <- count_pat(body, "\\p{Katakana}")
  japanese_total <- kanji + hiragana + katakana
  
  non_japanese <- count_pat(body, "[^\\p{Han}\\p{Hiragana}\\p{Katakana}]")
  
  removed_total_chars   <- nchar(removed_text, type = "chars")
  removed_ascii_english <- count_pat(removed_text, "[A-Za-z]")
  
  data.frame(
    site = site,
    file = basename(file_path),
    body_chars_total = total_body_chars,
    kanji = kanji,
    hiragana = hiragana,
    katakana = katakana,
    japanese_total = japanese_total,
    non_japanese = non_japanese,
    removed_chars_header_footer = removed_total_chars,
    removed_ascii_english = removed_ascii_english,
    stringsAsFactors = FALSE
  )
}

# ------------------------------
# Add one text into an existing dataframe
# ------------------------------
add_text_to_df <- function(df, file_path, site) {
  if (site == "Aozora") {
    cleaned <- clean_aozora_text(file_path)
  } else if (site == "Gutenberg") {
    cleaned <- clean_gutenberg_text(file_path)
  } else {
    stop("site must be 'Aozora' or 'Gutenberg'")
  }
  
  row <- make_row(file_path, site, cleaned$body, cleaned$removed_text)
  dplyr::bind_rows(df, row)
}
