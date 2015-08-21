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
		 < Dockerfile sed -E 's/^(ENV GOVERSION) .*/\1 '"$version"'/' > $version/Dockerfile
     cp go-gb-docker.sh $version/
  )
done
