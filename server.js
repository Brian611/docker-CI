const config = require("./config");
const db = require("knex")(config);
const express = require('express');
const app = express();

app.get('/', (req, res) => {
    db("users").then((data) => {
        res.send(data);
    }).catch((err) => console.dir(err));
});

process.on('SIGINT', () => {
    process.exit();
});

app.listen(3000, () => console.log('Example app listening on port 3000!'));