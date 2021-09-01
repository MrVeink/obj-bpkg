#!/bin/sh

#  mkbpkg.sh
#  obj-bpkg
#
#  Created by Joona Holkko.
#  Copyright © 2021 Joona Holkko & Breadtard. All rights reserved.

shopt -s globstar
shopt -s extglob

echo "      ___.        __         ___.           __                  "
echo "  ____\\_ |__     |__|        \\_ |__ ______ |  | __  ____      "
echo " /  _ \\| __ \\    |  |  ______ | __ \\\\____ \\|  |/ / / ___\\ "
echo "(  <_> ) \\_\\ \\   |  | /_____/ | \\_\\ \\  |_> >    < / /_/  >"
echo " \\____/|___  /\\__|  |         |___  /   __/|__|_ \\\\___  /   "
echo "           \\/\\______|             \\/|__|        \\/_____/    "

cat main.m | sed -e "s/INTERNAL_OBJBPKG_REPLACEMENT_STRING_HOPEFULLY_THIS_WORKS/$1/g" | sed -e "s/INTERNAL_OBJBPKG_VERSION/v0.1/g" > tempmain.m
cc -framework Foundation tempmain.m -Os -o tempmain
rm tempmain.c
python3 mitra/mitra.py tempmain $2
rm P*-ELF*.*.tempmain.7z
mv S*-ELF-7Z.*.7z.tempmain $1.bpkg
chmod +x $1.bpkg
rm tempmain
