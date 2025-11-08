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
2. `Final Report.Rmd`: R markup file. Contains the
3. `data`: Folder that contains the novels that are used for this project. The files that correspond to the given novels are defined above.
4. `Data Processing`: This folder contains all scripts used to clean and summarize Japanese text data from the Aozora and Gutenberg collections. Together, these files handle library setup, text cleaning, and the generation of CSV summaries with character statistics. You should run the files in the following order: first, execute 00_requirements.R once to install and load all the required packages. Then, open and knit build_jp_novels.Rmd, which automatically sources both 00_requirements.R and functions.R. This will process all the .txt files from the Aozora and Gutenberg folders, apply the cleaning functions, and generate the two summary CSVs in the same directory
5. `00_requirements.R`: Loads all required R packages (readr, stringr, dplyr) needed for data cleaning, string handling, and summarization.
6. `functions.R`: Defines the custom functions that clean the Japanese text files, removing headers, footers, Aozora markup, and non-Japanese characters, and compute character counts (kanji, hiragana, katakana, non-Japanese, etc.).
7. `build_jp_novels.Rmd`: The main R Markdown file that sources the other scripts, processes all .txt files from the Aozora and Gutenberg folders, applies the cleaning functions, and produces two output CSVs (aozora_summary.csv and gutenberg_summary.csv) containing the cleaned text statistics.

