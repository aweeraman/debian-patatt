#!/bin/sh

echo "Copying keys needed for tests..."
mkdir -p $HOME/.local/share/patatt/public/ || true
cp -r .keys/* $HOME/.local/share/patatt/public/

echo "Running positive test..."
patatt validate samples/ed25519-signed.txt

[ $? = 0 ] || exit 1

echo "Running negative test..."
patatt validate debian/tests/ed25519-sign-fail.txt

[ $? != 0 ] || exit 1

echo "Tests PASS"
