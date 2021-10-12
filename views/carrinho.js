const router = require('express').Router();
const userData = require('./user.js').userJWT;
const JWT = require('jsonwebtoken');
const express = require('express');
const db = require('../db.js');
router.use(express.urlencoded({ extended: false}));
//Pagina do carrinho
router.get('/carrinho',(req,res) => {
    
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log("Usuario ",userInfo)
    if (userInfo == false || userInfo == undefined) {res.redirect('/user/Login/');return(0);}
    let cookies = user.breakCookie(req.headers.cookie);

    let cart = new carrinho(req).getData();
    console.log("cartData = ",cart)
    
    let cartData =(cart!= false)? JWT.verify(cookies['cart'],require('../index.js').JWTPrivateKey) : undefined;
    let alert = (req.query.alert != undefined)? req.query.alert : undefined;
    res.render('carrinho.html',{"cartData":cartData,"alert": alert})
})

router.get('/carrinho/entrega', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log("Usuario ",userInfo)
    if (userInfo == false || userInfo == undefined) {res.redirect('/user/Login/');return(0);}
    res.render('entrega.html',{})

})
//Adicionar produto
router.get('/addCarrinho/:id_produto', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    if (req.params.id_produto == undefined) {res.redirect('/');return(0)}
    if (req.query.quantidade == undefined) {console.log("Quantidade");res.redirect('/'+req.params.id_produto);return(0)}
    if (userInfo == false || userInfo == undefined) {res.redirect('/user/Login/');return(0);}
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
router.get('/removeCarrinho/:id_produto', (req,res) => {
    const idProduto = req.params.id_produto;
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log("Usuario ",userInfo)
    if (userInfo == false) {console.log(userInfo);res.redirect('/user/Login/');return(0);}

    let cartData = new carrinho(req).getData();
    console.log("cartData = ",cartData)
    if (cartData == false) {res.redirect('/user/Login/');return(0);}
    for (var x=0;x<cartData.produtos.length;x++) {
        if (cartData.produtos[x].cod_remedio == req.params.id_produto) {
            //delete cartData.produtos[x];
            cartData.produtos.splice(x, 1) 
            let cartJWT = JWT.sign(cartData,require('../index.js').JWTPrivateKey)
            res.cookie('cart',cartJWT)
            res.redirect('/carrinho?alert=Produto removido com sucesso');
            return(0);
        }
    }
})
router.post('/carrinho/entrega', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    
    console.log("Usuario ",userInfo)
    if (userInfo == false) {console.log(userInfo);res.redirect('/user/Login/');return(0);}
    let cookies = user.breakCookie(req.headers.cookie);
    
    let cartData = JWT.verify(cookies['cart'],require('../index.js').JWTPrivateKey);
})


class carrinho {
    constructor (req) {
        if (req == undefined) {throw Error("Nescessita da requisicao")}
        this.req = req;
    }
    getData () {
        const userData = require('./user.js').userJWT;
        let user = new userData();
        let cookies = user.breakCookie(this.req.headers.cookie);
        try {
            let data = JWT.verify(cookies['cart'],require('../index.js').JWTPrivateKey);
            return(data)
        } catch(err) {
            return(false);
        }

    }
}
module.exports = router;
module.exports.carrinho = carrinho;