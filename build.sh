#!/usr/bin/env bash
set -e

CC=${CC:-gcc}
CFLAGS=${CFLAGS:--Wall -Wextra}

SRC="src/db.c"
TARGET="db"

echo "Compiling ${SRC}..."
${CC} ${CFLAGS} ${SRC} -o ${TARGET}
echo "Build successful: ./${TARGET}"
