const db = require('./db.js');
const express = require('express');
const controller = require('./controller.js');
const cors = require('cors');
const nunjucks = require('nunjucks');

const app = express();

app.use(cors());

app.use(express.json());
app.use(controller);


nunjucks.configure('static', {
    autoescape: true,
    express: app
});
app.use(express.static('static'))

require('dotenv').config();
//Busca pelo arquivo .env e senhas sensiveis

app.listen(80, () => {
    console.log('Servidor iniciado na porta 4000');
})
console.log("SENHA JWT:"+process.env.JWTPrivateKey)
//Nome e senha do JWT
module.exports.JWTPrivateKey =  process.env.JWTPrivateKey;
module.exports.JWTHeaderKey = process.env.JWTHeaderKey;