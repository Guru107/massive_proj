const path = require('path'),
	HtmlWebpackPlugin = require('html-webpack-plugin'),
	HtmlWebpackPluginConfig = new HtmlWebpackPlugin({
  template: './client/index.html',
  filename: 'index.html',
  inject: 'body'
}),
BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin,
webpack = require('webpack')

module.exports = {
  entry: {app:'./client/index.js'},
  output: {
	path: path.resolve('dist'),
	filename: '[name].js'
  },
	resolve: {
		modules: [path.join(__dirname,'node_modules'), "web_modules"]
	},
  module: {
	loaders: [
	  { test: /\.js$/, loader: 'babel-loader', exclude: /node_modules/ },
	  { test: /\.jsx$/, loader: 'babel-loader', exclude: /node_modules/},
		{ test: /\.less$/, loader: 'style-loader!css-loader!less-loader', exclude: /node_modules/ }
	]
  },
	stats:'verbose',
	plugins: [
		HtmlWebpackPluginConfig,
		new webpack.optimize.CommonsChunkPlugin({
			name:'vendor',
			minChunks: function(module){ 
				return module.context && module.context.indexOf("node_modules") !== -1 ;
			}
		}),
		new webpack.EnvironmentPlugin(['NODE_ENV'])
	]
}