# STAT107_Final_Project
This is the repository for STAT 107 Group 11's Final Project. 

## Novels 
The novels used for this project (and their respective file names) are the following:

From Gutenberg:

| File Name | Novel Name | Author | Novel Source |
| --- | --- | --- | --- |
| "pg36358.txt" | お目出たき人 | Saneatsu Mushanokoji | https://www.gutenberg.org/ebooks/31757 |
| "pg37605.txt" | 羹 | Jun'ichiro Tanizaki | https://www.gutenberg.org/ebooks/36459 |
| "pg34084.txt" | 幽霊書店 | Christopher Morley | https://www.gutenberg.org/ebooks/41325 |
| "pg37626.txt" | 下宿人 | Marie Belloc Lowndes | https://www.gutenberg.org/ebooks/32978 |
| "pg31757.txt" | 友情 | Saneatsu Mushanokoji | https://www.gutenberg.org/ebooks/33307 |
| "pg36459.txt" | 刺靑 | Jun'ichiro Tanizaki | https://www.gutenberg.org/ebooks/31617 |
| "pg41325.txt" | 火星の記憶 | Raymond F. Jones | https://www.gutenberg.org/ebooks/36358 |
| "pg32978.txt" | 惡魔 | Jun'ichiro Tanizaki | https://www.gutenberg.org/ebooks/37605 |
| "pg33307.txt" | 法螺男爵旅土産 | Kuni Sasaki | https://www.gutenberg.org/ebooks/34084 | 
| "pg31617.txt" | 續惡魔 | Jun'ichiro Tanizaki | https://www.gutenberg.org/ebooks/37626 |

From Aozora:
| File Name | Novel Name | Author | Novel Source |
| --- | --- | --- | --- |
| "onnano_kao.txt" | 人間の本性 | Shin, Katakami | https://www.aozora.gr.jp/cards/000492/card42252.html |
| "ningenno_honsho.txt" | 化学改革の大略 | Shimizu, Usaburo | https://www.aozora.gr.jp/cards/001508/card51403.html |
| "kagaku_kaikakuno_tairyaku.txt" | 枯尾花 | Sekine, Mokuan | https://www.aozora.gr.jp/cards/001358/card49253.html |
| "kareobana.txt" | 将棋の話 | Shigeru, Tonomura | https://www.aozora.gr.jp/cards/001499/card52185.html |
| "shogino_hanashi.txt" | 色盲検査表の話 | Shinobu, Ishihara | https://www.aozora.gr.jp/cards/001742/card55751.html |
| "shikimo_kensahyo.txt" | 父八雲を語る | Iwao, Inagaki | https://www.aozora.gr.jp/cards/001961/card58832.html |
| "chichi_yakumoo_kataru.txt" | おくのほそ道 | Matsuo, Basho | https://www.aozora.gr.jp/cards/002240/card61619.html |
| "02okunohosomichi.txt" | 青バスの女 | Tatsuno, Kyushi | https://www.aozora.gr.jp/cards/001782/card56514.html |
| "ao_basuno_onna.txt" | 古事記物語 | Otomo, Yasumaro | https://www.aozora.gr.jp/cards/000107/card1530.html |
| "kojiki_monogatari.txt" | 女の顔 | Kuroda, Seiki | https://www.aozora.gr.jp/cards/000257/card1425.html |

## Files
1. `README.md`: This file. Provides a general overview of the project, as well as definitions for the files within this Repository.
2. `Final Report.Rmd`: R markup file. Contains the written report for this project. 
3. `data`: Folder that contains the novels that are used for this project. The files that correspond to the given novels are defined above, seperated by Host Website. 
4. `Data Processing`: This folder contains all scripts used to clean and summarize Japanese text data from the Aozora and Gutenberg collections. Together, these files handle library setup, text cleaning, and the generation of CSV summaries with character statistics.
    1. `00_requirements.R`: Loads all required R packages (readr, stringr, dplyr) needed for data cleaning, string handling, and summarization.
    2. `functions.R`: Defines the custom functions that clean the Japanese text files, removing headers, footers, Aozora markup, and non-Japanese characters, and compute character counts (kanji, hiragana, katakana, non-Japanese, etc.).
    3. `build_jp_novels.Rmd`: The main R Markdown file that sources the other scripts, processes all .txt files from the Aozora and Gutenberg folders, applies the cleaning functions, and produces three output CSVs (aozora_summary.csv, gutenberg_summary.csv, and jp_novels.csv) containing the cleaned text statistics.
5. `t-test`: Folder that contains the code necessary to run the T-Test
    1. `T-Test:Aozora vs Gutenberg(Writing Systems).Rmd`: This document performs three two-sample t-tests comparing the number of Hiragana, Katakana, and Kanji characters between novels from Aozora website and the Project Gutenberg website.
    2. `T-Test:Aozora vs Gutenberg(total characters).Rmd`: This document performs a two-sample t-test comparing the total number of characters in novels from Aozora website and the Project Gutenberg website. 
    3. `T-Test for Difference in Writing System Distributions.Rmd`: This document is meant to compute the Two Sample T-Tests between the number of Hiragana, Katakana, and Kanji characters in our dataset. This is to determine whether or not there is a difference in the mean of characters of these three writing systems within all of the gathered novels. 
6. `Graphs`: Folder that contains image versions of the graphs seen in the Final Report.
    1. `Images`: Folder with the actual graph images.
    2. `1. Graphs for Preliminary Analysis.Rmd`: File that generates Figures 1 through 5 in the Final Report. 

## Dataframe and Variable Descriptions
After cleaning the data and processing it (see "Reproducibility" section below), we end up with a file called `jp_novels.csv`. This data table contains the following variables:

1. `site`: factor. A variable describing which of the Host Website (Gutenberg or Aozora) the novel came from.
2. `body_chars_total`: numerical. Total number of characters in the actual text of the literature (excluding the characters found in the header/footer).
3. `kanji`: numerical. Total number of characters from the body that are in Kanji.
4. `hiragana`: numerical. Total number of characters from the body that are in Hiragana.
5. `katakana`: numerical. Total number of characters from the body that are in Katakana.
6. `japanese_total`: numerical. Total number of characters from the body that are in Japanese (`kanji` + `hiragana` + `katakana`).
7. `non_japanese`: numerical. Total number of characters from the body that are NOT in Japanese.
8. `removed_chars_header_footer`: numerical. Number of characters removed from the novel file as part of the header/footer.
9. `removed_ascii_english`: numerical. Number of Latin-script characters (ie, characters in English) that was removed from the novel file.

The files `aozora_summary.csv` and `gutenberg_summary.csv` contain the subset of `jp_novels.csv` that coorespond to its Host Website (obviously sans the variable "site"). 

## Reproducibility
In order to reproduce our results, please run the code from this repository in this order:
1. Verify that all of the files from this repository have been downloaded correctly. Additionally, ensure that none of the files have been renamed or moved from their original locations. 
2. Run the files in the `Data Processing` folder:
    1. First, execute `00_requirements.R` once to install and load all the required packages.
    2. Then, open and knit `build_jp_novels.Rmd`, which automatically sources both `00_requirements.R` and `functions.R`. This will process all the .txt files from the Aozora and Gutenberg folders, apply the cleaning functions, and generate the three summary CSVs in the same directory.
3. Run `1. Graphs for Preliminary Analysis.Rmd` in the `Graphs` folder.
4. Run all three files in the `t-test` folder in any order.

By doing this, one can generate the results and graphs seen in our Final Report. 
