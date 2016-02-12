var React = require('react');

React.render(<h1>Hello World!</h1>, document.body);

// require uniq package by npm
var uniq = require('uniq');
var nums = [ 5, 2, 1, 3, 2, 5, 4, 2, 0, 1 ];
console.log(uniq(nums));
