const router = require('express').Router();
const userData = require('./user.js').userJWT;
const JWT = require('jsonwebtoken');
const express = require('express');
const db = require('../db.js');
router.use(express.urlencoded({ extended: false}));
//Adicionar produto
router.get('/addCarrinho/:id_produto', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    if (req.params.id_produto == undefined) {res.redirect('/');return(0)}
    if (req.query.quantidade == undefined) {console.log("Quantidade");res.redirect('/'+req.params.id_produto);return(0)}
    if (userInfo == false) {res.redirect('/');return(0);}
    let cookies = user.breakCookie(req.headers.cookie);
    let cartCookie = {produtos:[]};
    //Adding empty obj
    if (cookies['cart'] != undefined && cookies['cart'] != "") {cartCookie = JWT.verify(cookies['cart'],require('../index.js').JWTPrivateKey)}
    
    let sql = "SELECT * FROM `remedios` WHERE `cod_remedio` = "+req.params.id_produto+"";
    db.query(sql, (error,results) => {
        if (error) {throw error}
        if (results[0] == undefined) {console.log("Nao encontrado");res.redirect(('/'+req.params.id_produto));return(0)}
        results[0]['quantidade'] = req.query.quantidade;
        console.log(results[0])
        cartCookie.produtos.push(results[0]);
        let cartJWT = JWT.sign(cartCookie,require('../index.js').JWTPrivateKey)
        res.cookie('cart',cartJWT);
        res.send("ok")
    })
})
//Terminar ROTA
router.get('/removeCarrinho/:id_produto')

router.get('/carrinho',(req,res) => {
    
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log("Usuario ",userInfo)
    if (userInfo == false) {console.log(userInfo);res.redirect('/');return(0);}
    let cookies = user.breakCookie(req.headers.cookie);
    
    let cartData =(userData != undefined)? JWT.verify(cookies['cart'],require('../index.js').JWTPrivateKey) : undefined;
    
    res.render('carrinho.html',{"cartData":cartData})
})
module.exports = router;