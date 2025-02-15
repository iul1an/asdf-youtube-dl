#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/ytdl-org/ytdl-nightly"
GH_RELEASES="https://api.github.com/repos/ytdl-org/ytdl-nightly/releases"
TOOL_NAME="youtube-dl"
TOOL_TEST="youtube-dl --help"

fail() {
  echo -e "asdf-${TOOL_NAME}: $*" >&2
  exit 1
}

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  curl "${curl_opts[@]}" --url "$GH_RELEASES" |
    grep -oE "tag_name\": *\".{1,15}\"," | sed -e 's/tag_name\": \"v*//' -e 's/\",//' || fail "Could not fetch versions"
}

download_release() {
  local version
  local filename
  version="$1"
  filename="$2"

  if [ "$(uname -s)" != "Linux" ]; then
    fail "This plugin only supports installing youtube-dl on Linux"
  fi

  local url
  url="${GH_REPO}/releases/download/${version}/youtube-dl"
  echo "* Downloading ${TOOL_NAME} release ${version}..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download ${url}"
}

install_version() {
  local install_type
  local version
  local install_path

  install_type="$1"
  version="$2"
  install_path="${3%/bin}/bin"

  if [ "$install_type" != "version" ]; then
    fail "asdf-${TOOL_NAME} supports release installs only"
  fi

  ( 
    mkdir -p "$install_path"
    install -m 755 "${ASDF_DOWNLOAD_PATH}/youtube-dl" "$install_path" || fail "Installation failed"
    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error occurred while installing $TOOL_NAME $version."
  )
}
