set -e

echo ">>> installing meteor ..."
curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh
