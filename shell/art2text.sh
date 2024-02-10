#!/usr/bin/env bash

direrr() {
    echo -e "\e[41m[ERROR] You should run me under \e[1;33mthe root of this repository.\e[0m"
    exit 1
}

[[ -d "art" ]] || direrr
[[ -d "text" ]] || direrr

for doc in art/*.md
do
    echo Converting "'${doc:4}'" ...
    cat > "text/${doc:4:-3}.html" <<EOF
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="咖喱窝群友们的日常">
    <link rel="icon" href="/static/favicon.ico">
    <title>群友的梗 | 咖喱窝群友们的日常</title>
    <link rel="stylesheet" href="https://cdn.staticfile.net/picocss/1.5.0/pico.min.css">
    <link rel="stylesheet" href="/static/style.css">
    <style>
        #view {
            text-align: left;
        }
    </style>
</head>

<body>
    <main class="container">
        <h1>咖喱窝群友们的日常 | <a href="/text">文字梗</a></h1>
        <article id="view">
            <github-md>
EOF
    cat "$doc" >> "text/${doc:4:-3}.html"
    cat >> "text/${doc:4:-3}.html" <<EOF
            </github-md>
        </article>

        <footer id="footer">
            <p>· 咖喱窝群友们的日常 · 欢迎品鉴 ·</p>
            <p><a href="https://github.dev/CALIBUR-Dx/MEME">看完了吗？感兴趣的话， 可以来 GitHub 投稿哦！</a></p>
        </footer>
    </main>
</body>
<script src="https://gcore.jsdelivr.net/gh/MarketingPipeline/Markdown-Tag/markdown-tag.js"></script> 

</html>
EOF
done
