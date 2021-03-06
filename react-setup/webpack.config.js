const path = require('path');

module.exports = {
  context: __dirname,
  // entry file
  entry: './src/index.jsx',
  output: {
    path: path.resolve(__dirname, 'src'),
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['react', 'es2015']
        }
      }
    ]
  },
  devtool: 'source-maps'
};
