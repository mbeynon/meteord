#!/bin/bash
set -e

echo "*** call lib/install_meteor.sh ..."
bash $METEORD_DIR/lib/install_meteor.sh

echo "*** call lib/build_app.sh ..."
bash $METEORD_DIR/lib/build_app.sh
