const router = require('express').Router();
const carrinho = require('./carrinho').carrinho;
const check_req = require('./signup.js').check_req;

router.get('/compra/confirmaCompra', (req,res) => {
    let cart = new carrinho(req).getData();
    if (cart == false) {res.redirect('/');return(0);}
    let frete = 0;
    let valor = 0;
    for (var x=0;x<cart.produtos.length;x++) {
        valor += parseFloat(cart.produtos[x].valor * cart.produtos[x].quantidade);
        frete += parseFloat(cart.produtos[x].valorFrete);
    }
    res.render('confirmaCompra.html',{"valor":valor,"frete":frete})
})

router.post('/compra/registraPedido',(req,res) => {
    let wanted_info = ['rua','numero','cep','bairro','cidade','estado'];
    let check_info = check_req(wanted_info,req);
    if (check_info == false) {
        res.redirect('/compra/confirmaCompra');return(0)
    }
    let cart = new carrinho(req).getData();
    
})
module.exports = router;