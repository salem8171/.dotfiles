const path = require('path');
const NODE_PATH = '/usr/lib/node_modules'
const express = require(path.join(NODE_PATH, 'express'));
var route = express.Router();

// route.post('/fzf', (req, res) => {
//   res.end("hello world");
// });

function fzf(inputArray, callback) {
  var fmenu = child_process.spawn('fmenu')
  fmenu.stdout.on('data', callback);
  inputArray.forEach(line => fmenu.stdin.write(line + "\n"))
  fmenu.stdin.end();
}

route.post('/fzf', (req, res) => {
  fzf(req.body, outputData =>
    res.json(outputData.toString().trim().split("\n")));
});

module.exports = route
