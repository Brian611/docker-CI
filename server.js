const express = require('express');
const app = express();

app.get('/', (req, res) => res.send('Hello real time app not working'));

process.on('SIGINT', () => {
    process.exit();
});

app.listen(3000, () => console.log('Example app listening on port 3000!'));