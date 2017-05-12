const path = require('path'),
	HtmlWebpackPlugin = require('html-webpack-plugin'),
	HtmlWebpackPluginConfig = new HtmlWebpackPlugin({
  template: './client/index.html',
  filename: 'index.html',
  inject: 'body'
})

module.exports = {
  entry: './client/index.js',
  output: {
	path: path.resolve('dist'),
	filename: 'index_bundle.js'
  },
	resolve: {
		modules: ["node_modules", "web_modules"]
	},
  module: {
	loaders: [
	  { test: /\.js$/, loader: 'babel-loader', exclude: /node_modules/ },
	  { test: /\.jsx$/, loader: 'babel-loader', exclude: /node_modules/},
		{ test: /\.css$/, loader: 'style-loader!css-loader', exclude: /node_modules/ }
	]
  },
	plugins: [HtmlWebpackPluginConfig]
}