const router = require('express').Router();
const userData = require('./user.js').userJWT;
const db = require('../db.js');
const JWT = require('jsonwebtoken');
router.get('/produto/:cod_produto', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log('userInfo',userInfo);
    if (req.params.cod_produto == undefined) {res.redirect('/');return(0);}
    let sql = "SELECT * FROM `remedios` WHERE `cod_remedio` = '"+req.params.cod_produto+"'";
    db.query(sql, (error,results) => {
        if (error) {throw error;}
        if (results[0] == undefined) {res.redirect('/');return(0);}
        let produtoData = results[0];
        
        res.render('produto.html',{"produto":produtoData,"userData":userInfo})
        
        
    })
})
router.get('/pesquisa', (req,res) => {
    if (req.query.searchQuery == undefined) {res.redirect('/');return(0);}

    let userData = undefined;
    try {
        userData = JWT.verify(breakCookie(req.headers.cookie).key,require('../index.js').JWTPrivateKey);
    } catch(e) {
        userData = false;
    }

    let sql = "SELECT * FROM `remedios` WHERE `nome` LIKE '%"+req.query.searchQuery+"%' ORDER BY `valor` DESC";
    db.query(sql,(error,results) => {
        if (error) {throw error}
        for (var x=0;x<results.length;x++) {
            if (results[x].desc.length > 60) {
                results[x].desc = results[x].desc.substr(0,60); 
            }
        }
        
        res.render('pesquisa.html',{"userData": userData,"produtos":results,"query":req.query.searchQuery})
    })
})
module.exports = router;

function breakCookie(cookie) {
    if (cookie == undefined) { return(false);}
    let cookies = cookie.split('; ');
    let finalCookie = {};
    for (var x=0;x<cookies.length;x++) {
        let element = cookies[x].split('=');
        finalCookie[element[0]] = element[1];
    }
    return(finalCookie)
}