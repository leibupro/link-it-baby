#!/bin/bash
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <leiu@zhaw.ch> wrote this file.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.   P. Leibundgut
# ----------------------------------------------------------------------------
#

date_bin="/bin/date"
cat_bin="/bin/cat"
tar_bin="/bin/tar"

prog_name=${PWD##*/}
cur_date=$(${date_bin} +%s)
cur_version=$(${cat_bin} ./link-it-baby_version)
exclude_patterns_file="${prog_name}/.gitignore"


cd ..

${tar_bin} --exclude-vcs \
           --exclude-from=${exclude_patterns_file} \
           -cvJf "${prog_name}-${cur_version}-${cur_date}.tar.xz" "${prog_name}"

