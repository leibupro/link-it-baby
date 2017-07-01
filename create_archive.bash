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
cur_version=$(${cat_bin} ./lib_roadmap_version)
exclude_patterns_file="${prog_name}/.gitignore"
exclude_file=${exclude_patterns_file}
exclude_git_folder="${prog_name}/.git"


cd ..

if [ -f ${exclude_patterns_file} ]; then
  ${tar_bin} cvJf "${prog_name}-${cur_version}-${cur_date}.tar.xz" "${prog_name}" \
             --exclude=${exclude_file} \
             --exclude=${exclude_git_folder} \
             --exclude-from=${exclude_patterns_file}
else
  ${tar_bin} cvJf "${prog_name}-${cur_version}-${cur_date}.tar.xz" "${prog_name}" \
             --exclude=${exclude_file} \
             --exclude=${exclude_git_folder}
fi

