'use strict';

const path = require('path');
const webpack = require('webpack');

/*
 * SplitChunksPlugin is enabled by default and replaced
 * deprecated CommonsChunkPlugin. It automatically identifies modules which
 * should be splitted of chunk by heuristics using module duplication count and
 * module category (i. e. node_modules). And splits the chunks…
 *
 * It is safe to remove "splitChunks" from the generated configuration
 * and was added as an educational example.
 *
 * https://webpack.js.org/plugins/split-chunks-plugin/
 *
 */

// const HtmlWebpackPlugin = require('html-webpack-plugin');

/*
 * We've enabled HtmlWebpackPlugin for you! This generates a html
 * page for you when you compile webpack, which will make you start
 * developing and prototyping faster.
 *
 * https://github.com/jantimon/html-webpack-plugin
 *
 */

module.exports = {
	mode: 'development',

	entry: './src/App',

	output: {
		path: __dirname,
		pathinfo: true,
		filename: 'bundle.js',
		devtoolModuleFilenameTemplate: 'webpack:///[absolute-resource-path]',
	},

	// plugins: [new webpack.ProgressPlugin(), new HtmlWebpackPlugin()],

	module: {
		rules: [
		  {
			test: /\.purs$/,
			loader: 'purs-loader',
			exclude: /node_modules/,
			query: {
			  src: [
				'bower_components/purescript-*/src/**/*.purs',
				'src/**/*.purs'
			  ],
			  bundle: false,
			  psc: 'psa',
			  pscIde: false
			}
		  }
		]
	},
	
	resolve: {
		modules: [ 'node_modules', 'bower_components' ],
		extensions: [ '.purs', '.js']
	},


	devServer: {
		contentBase: '.',
		port: 4008,
		stats: 'errors-only'
	},

	plugins: [
		new webpack.LoaderOptionsPlugin({
		  debug: true
		})
	  ]
};



// const path = require('path');

// const webpack = require('webpack');

// const isWebpackDevServer = process.argv.some(a => path.basename(a) === 'webpack-dev-server');

// const isWatch = process.argv.some(a => a === '--watch');

// const plugins =
//   isWebpackDevServer || !isWatch ? [] : [
//     function(){
//       this.plugin('done', function(stats){
//         process.stderr.write(stats.toString('errors-only'));
//       });
//     }
//   ]
// ;

// module.exports = {
//   devtool: 'eval-source-map',

//   devServer: {
//     contentBase: '.',
//     port: 4008,
//     stats: 'errors-only'
//   },

//   entry: './src/Example.purs',

//   output: {
//     path: __dirname,
//     pathinfo: true,
//     filename: 'bundle.js'
//   },

//   module: {
//     rules: [
//       {
//         test: /\.purs$/,
//         use: [
//           {
//             loader: 'purs-loader',
//             options: {
//               src: [
//                 'bower_components/purescript-*/src/**/*.purs',
//                 'src/**/*.purs'
//               ],
//               bundle: false,
//               psc: 'psa',
//               watch: isWebpackDevServer || isWatch,
//               pscIde: false
//             }
//           }
//         ]
//       },
//     ]
//   },

//   resolve: {
//     modules: [ 'node_modules', 'bower_components' ],
//     extensions: [ '.purs', '.js']
//   },

// };