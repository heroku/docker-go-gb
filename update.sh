#!/bin/bash
set -e

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )

echo "${versions[@]}"

for version in "${versions[@]}"; do
   (
		 set -x
		 < Dockerfile sed -E 's|^(FROM heroku/go-base:).*|\1'"$version"'|' > $version/Dockerfile
  )
done
