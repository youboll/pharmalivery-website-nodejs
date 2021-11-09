const router = require('express').Router();
const userData = require('./user.js').userJWT;
const JWT = require('jsonwebtoken');
const cookie = require('cookie-parser');
const hash = require('hash.js');
const db = require('../db.js');
router.get('/entregador/cadastro', (req,res) => {
    res.render('cadastroEntregador.html',{})
})
router.get('/entregador/login',(req,res) => {
    res.render('loginEntregador.html',{});
})

router.post('/entregador/login/', (req,res) => {
    let username = req.body.username;
    let password = req.body.password;
    if (username && password) {

        const password = hash.sha512().update(req.body.password).digest('hex');
        
        let sql = "SELECT * FROM `entregador` WHERE `Cpf` = '"+username+"' AND `senha` = '"+password+"'"; 

        let query = db.query(sql, (err,results) => {
            if (err) {
                throw err;
            } else if (results) {

                if (results[0] == undefined) {res.statusCode=404;res.render('loginEntregador.html',{error:'Usuario ou senha incorretos'});return(0);}     
                //Remover as informacoes senviveis antes de transformar em string
                results[0].senha = undefined;
                results[0].type= "entregador";

                let user = JSON.stringify(results[0]);
                let token = JWT.sign(user,require('../index.js').JWTPrivateKey);
                res.statusCode=200;
                res.cookie('key',token);

                res.redirect('/entregador')

            }
        });
    } else {
        res.statusCode = 401;res.redirect('/');
    }
    
})

router.get('/entregador', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    if (userInfo.type!="entregador" || userInfo == false) {
        res.redirect('/');
    } else {
        res.render('entregador.html',{})
    }
})

module.exports = router;