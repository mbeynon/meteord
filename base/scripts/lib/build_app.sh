set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir

# sometimes, directly copied folder cause some wierd issues
# this fixes that
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH

if [ -e ./package.json ]; then
    echo ">>> installing local meteor npm deps ..."
    meteor npm install --production
fi

echo ">>> building app ..."
meteor build --directory $BUNDLE_DIR --server=http://localhost:3000

echo ">>> installing server npm deps ..."
cd $BUNDLE_DIR/bundle/programs/server/
npm i

mv $BUNDLE_DIR/bundle /built_app

echo ">>> cleanup ..."
# cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR
rm -rf ~/.meteor
rm /usr/local/bin/meteor