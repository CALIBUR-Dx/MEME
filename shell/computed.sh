#! /bin/bash
chmod +x reset.sh
echo 'export default {
  items: [
    "'"$(echo "$(ls -d meme/*)" | sed ':a;N;$!ba;s/\n/",\n    "/g')"'"
  ]
}' > ./static/scripts/config.js
