#!/usr/bin/env sh
set -e

BDAT="$(date +"%Y%m%d-%H%M%S")"

cat > ./gambatte_sdl/builddate.h << EOF
#define BUILDDATE "${BDAT}"
EOF

scons -Q target=gcw0 -C libgambatte
scons -Q target=gcw0 -C gambatte_sdl

mkdir -p build
target="build/gambatte-rg350-r572u3-${BDAT}.opk"

mksquashfs \
    ./dist/gcw0/default.gcw0.desktop \
    ./gambatte_sdl/gambatte_sdl \
    ./dist/gcw0/gambatte.png \
    ./dist/gcw0/manual.txt \
    "$target" -all-root -no-xattrs -noappend -no-exports
