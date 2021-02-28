const express = require('express')  ;

const PORT = 80
const HOST = '0.0.0.0';

const app = express();


app.get('/', (request, response) => {
    return response.json({
      message: 'Hello World'}
      );
})

app.listen (PORT , () => {
  console.log (`🚀 the SimpleApp is running on port ${HOST}:${PORT}`)
})