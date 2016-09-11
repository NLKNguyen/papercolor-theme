#!/bin/sh

set -e

framework_file=$1

# cat ${framework_file}

# Custom temporary runtime path for vim
custom_rtp=$(mktemp -d)

# Add color scheme to runtime part
mkdir -p "${custom_rtp}/colors"
cp "${framework_file}" "${custom_rtp}/colors"

# Minimum vimrc file
cat > "${custom_rtp}/.vimrc" <<- EOF

set rtp+=${custom_rtp}
syntax on
color PaperColor
EOF

# Go to temporary build directory
cd "$(mktemp -d)" || exit 1

printf "Check startup status... "
vim -Nu "$custom_rtp/.vimrc" +qa 1>log.txt 2>/dev/null
if grep -q Error log.txt
then
  echo "$framework_file caused starup error"
  sed 's/^.*Error/Error/' log.txt
  exit 1
fi
rm log.txt
echo "ok"


# Generate intermediate file
printf "Run unit test... "
vim -Nu "${custom_rtp}/.vimrc" -c 'call PaperColor#Test()' +qa 1>log.txt 2>/dev/null
# TODO: create better text marker
# sed 's/^.*\[TEST START\]/\[TEST START\]/' log.txt
if grep -q "FAILED" log.txt
then
  echo "$framework_file failed unit test"
  # sed 's/^.*==FAILED==/TEST BEGIN/' log.txt
  exit 1
fi
rm log.txt
echo "ok"
# cat log.txt

exit 0
