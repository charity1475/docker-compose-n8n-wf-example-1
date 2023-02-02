const express = require('express');
const app = express();

// Start the server on port 3000
app.listen(3000, () => {
  console.log('API server listening on port 3000');
});

// Define a route for the GET method at the root path
app.get('/', (req, res) => {
    res.send('simple api!');
  });

app.post('/products/mysql', function(req, res) {
  res.json({ status: 'success' })   
})