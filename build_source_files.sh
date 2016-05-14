echo "running build_and_run.sh"
echo "Running npm install"
npm install
echo "Running bower install"
bower install --allow-root
echo "Running grunt build"
grunt build
