const express = require('express');
const app = express();
var bodyParser = require('body-parser');

// Start the server on port 3000
app.listen(3000, () => {
  console.log('API server listening on port 3000');
});

// Body parser middleware
app.use(bodyParser.json());

// Define a route for the GET method at the root path
app.get('/', (req, res) => {
  res.send('simple api!');
});

app.post('/products/mysql', function (req, res) {
  console.log(`Received item: ${JSON.stringify(req.body)}`)
  // save your transformed item in the database...
  res.json({ status: 'success' })
})