grep -lr --include \*.php --exclude \*id3v2.php "%x[0-9]" . | tee infected-files.txt
while read -r filename ; do
  cp -v "$filename" "$filename.dirty"
  sed -i "s/<?php \$\w\+ = '.*%x[0-9].*?>//g" "$filename"
done < infected-files.txt
