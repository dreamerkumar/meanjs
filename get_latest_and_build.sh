echo "Changing current directory to Development"
cd Development
echo "Getting latest file from the repo"
git clone https://github.com/dreamerkumar/meanjs.git
echo "Navigating to the meanjs directory"
cd meanjs
echo "Running npm install"
npm install
echo "Running grunt build"
grunt build
