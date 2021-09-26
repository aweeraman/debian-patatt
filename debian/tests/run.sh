#!/bin/sh

echo "Copying keys needed for tests..."
mkdir -p $HOME/.local/share/patatt/public/ || true
cp -r .keys/* $HOME/.local/share/patatt/public/

echo "Running ed25519 positive test..."
patatt validate samples/ed25519-signed.txt

[ $? = 0 ] || exit 1

echo "Running ed25519 negative test..."
patatt validate debian/tests/ed25519-sign-fail.txt

echo "Running pgp positive test..."
patatt validate samples/pgp-signed.txt

[ $? = 0 ] || exit 1

echo "Running pgp negative test..."
patatt validate debian/tests/pgp-sign-fail.txt

[ $? != 0 ] || exit 1

echo "Tests PASS"
