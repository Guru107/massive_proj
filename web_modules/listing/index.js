console.log(process.env)
if(process.env.NODE_ENV === 'development'){
	//require('babel-register')
	module.exports = require('./src/index.js')
}else{
	module.exports = require('./src/index.js')
}
