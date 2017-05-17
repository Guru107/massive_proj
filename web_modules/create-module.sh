#!/bin/bash

#Take module name as input
echo "Enter a name for the module\n";
read module_name;

if [ -z "${module_name}" ]; then
	echo '> Re-run the script and enter a valid module name\n';
	exit;
fi

#Create a directory with the module name
echo "\n> creating a module directory ${module_name}";
mkdir "${module_name}";



if ! foobar_loc="$(type -p jase)" || [ -z "$foobar_loc" ]; then
  # install jase here
  echo '\n> jase not installed > installing jase';
  sudo npm install jase -g;
fi


#Create skeleton module directory structure
#	module
#		src
#		lib
#		node_modules
#		.babelrc
#		package.json

echo "\n> creating a skeleton directory structure for ${module_name}\n
	${module_name}
	   | -- src/ - Place all your module code in this directory\n
	   | -- lib/ - This directory is used for storing transpiled code from src/ directory\n
	   | -- node_modules/ - This directory will have all the modules required for ${module_name} package\n
	   | -- .babelrc - This file is used by babel transpiler to transpile es6 code. Place in all plugins and presets in this file\n
	   | -- package.json - This lists all the run scripts and dependencies for ${module_name} package\n";

cd "${module_name}";

mkdir "src";
mkdir "lib";
mkdir "node_modules";
touch "package.json";
touch ".babelrc";
touch "src/index.js";

echo "
/**
 * This is the main file for this module. 
 * Export whatever components or functions that will be used in the app in this file itself.
 * This file should not be used to write all the logic for the module. This should be used purely for exporting purpose.
 *
 * Example
 * If you want to export a single component throughout the module. Then use default exports
 *
 * import SampleComponent from './SampleComponent'
 * 
 * export default SampleComponent
 *
 * If exporting multiple components or functions. Then export as object
 * 
 * import SampleComponent from './SampleComponent'
 * import SampleComponent2 from './SampleComponent2'
 *
 * export {SampleComponent, SampleComponent2}
 * 
 * P.S: Delete this comment and write a valid comment describing the purpose of the module
 */" > "src/index.js";

npm init -y;

#Modify package.json
echo $(cat "package.json" | jase author -s $(whoami) | jase license -d | jase main -s lib/index.js | jase private -s true | jase scripts -s {}| jase scripts.compile -s 'babel src --out-dir lib') > "package.json";

#Install devDepencencies
npm i babel-cli babel-preset-es2015 babel-preset-react react react-dom --save-dev --save-exact;

json='{\n\t"presets":["es2015","react"]\n}';

echo $json > ".babelrc";

echo "\n> package.json creation successfull";



