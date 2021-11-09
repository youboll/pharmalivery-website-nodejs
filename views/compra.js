const router = require('express').Router();
const carrinho = require('./carrinho').carrinho;
const check_req = require('./signup.js').check_req;
const userData = require('./user.js').userJWT;
const db = require('../db.js');
const JWT = require('jsonwebtoken');
router.get('/compra/confirmaCompra', (req,res) => {
    let cart = new carrinho(req).getData();
    if (cart == false) {res.redirect('/');return(0);}
    let frete = 0;
    let valor = 0;
    for (var x=0;x<cart.produtos.length;x++) {
        valor += parseFloat(cart.produtos[x].valor * cart.produtos[x].quantidade);
        frete += parseFloat(cart.produtos[x].valorFrete);
    }
    cart.valor = {"precoProdutos":valor,"frete":frete,"total":valor+frete};
    let cartToken = JWT.sign(cart,require('../index.js').JWTPrivateKey);
    res.cookie('cart',cartToken)
    res.render('confirmaCompra.html',{"valor":valor,"frete":frete})
})

router.post('/compra/registraPedido',async (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log("Usuario ",userInfo)
    if (userInfo == false || userInfo == undefined) {res.redirect('/carrinho');return(0);}
    let wanted_info = ['rua','numero','cep','bairro','cidade','estado','valor'];
    let check_info = check_req(wanted_info,req);
    if (check_info == false) {
        res.redirect('/compra/confirmaCompra');return(0)
    }
    let data = new Date().toISOString().slice(0, 19).replace('T', ' ');
    //Verificando se tem coordenadas disponiveis
    if (req.body.longitude == undefined || req.body.latitude == undefined) {
        req.body.longitude = null;
        req.body.latitude = null;
    }

    let cart = new carrinho(req).getData();
    let pedidoSql = "INSERT INTO `pharma`.`pedido` (`data_pedido`, `cpf`, `rua`, `numero`, `bairro`, `cep`, `cidade`, `estado`, `latitude`, `longitude`, `precoTotal`,`frete`,`preco`) VALUES ('"+data+"', '"+userInfo.Cpf+"', '"+req.body.rua+"', "+req.body.numero+", '"+req.body.bairro+"', '"+req.body.cep+"', '"+req.body.cidade+"', '"+req.body.estado+"', '"+req.body.latitude+"', '"+req.body.longitude+"', '"+cart.valor.total+"','"+cart.valor.frete+"','"+cart.valor.precoProdutos+"');";
    db.query(pedidoSql,(err,results) => {
        if (err) {throw err;}
        idPedido = results.insertId;
        if (idPedido == undefined) {throw Error("burro")}
        //Pegando as informações do pedido
        
        for (var x=0;x<cart.produtos.length;x++) {
            
            let produtoSql = "INSERT INTO `remedios_pedido` (`cod_remedio`, `cod_pedido`) VALUES ('"+cart.produtos[x].cod_remedio+"', '"+idPedido+"');";
            db.query(produtoSql,(error,results) => {
                if (error) {throw error}
            })
        }
        res.cookie('cart','')
        res.redirect('/');
    })
    
    
})
module.exports = router;
