#!/bin/sh
# Re-run this whenever you add new Tailwind utility classes to index.html
./tailwindcss-windows-x64.exe -i src/input.css -o style.css --minify
