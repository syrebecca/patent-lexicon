#!/bin/sh
# index.html is the Claude artifact source (no doctype/head by design).
# This wraps it into a standalone page for GitHub Pages at docs/index.html.
set -e
cd "$(dirname "$0")"
mkdir -p docs
{
  cat <<'EOF'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="177 patent terms in English, Korean and Japanese, bound in twelve 3D volumes of flashcards.">
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 64 64'%3E%3Ccircle cx='32' cy='32' r='30' fill='%2316181B'/%3E%3Ctext x='32' y='44' font-family='Georgia,serif' font-style='italic' font-size='34' text-anchor='middle' fill='%23CFAE66'%3EP%3C/text%3E%3C/svg%3E">
<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px system-ui}img{max-width:100%}[hidden]{display:none!important}</style>
EOF
  sed '/<main id="app"/,$d' index.html
  printf '</head>\n<body>\n'
  sed -n '/<main id="app"/,$p' index.html
  printf '</body>\n</html>\n'
} > docs/index.html
echo "built docs/index.html"
