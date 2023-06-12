require('dotenv').config();

const express = require("express");
const app = express() ;
const port = process.env.PORT;

app.get("/" , (req , res) => {
    res.send ("Hello World !");
});

app.get('/name/:user', (req, res) => {
    const user = req.params.user;
    const message = `Hello my ${user}!` ;
    res.send(message);
});

app.get('/date', (req, res) => {
    const date = new Date().toISOString().split('T')[0];
    res.send( date );
});

app.listen (port , () => {
    console.log ( ` Example app listening at http://localhost: ${port} `) ;
});
