echo "running build_and_run.sh"
echo "Running npm install"
npm install
echo "Running grunt build"
grunt build
echo "Running bower install"
bower install --allow-root