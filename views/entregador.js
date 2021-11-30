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
        console.log(sql)
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
    if (userInfo == false || userInfo == undefined) {res.redirect('/entregador/login');return(0);}
    let sql = "SELECT * FROM `pedido` INNER JOIN `remedios_pedido` ON remedios_pedido.cod_pedido = pedido.cod_pedido INNER JOIN remedios ON remedios.cod_remedio = remedios_pedido.cod_remedio WHERE pagamentoEfetuado = 1 AND entregaEfetuada = 0 AND atribuida=0;";
    db.query(sql,(error,results) => {
        if (results.length == 0 ) {res.render('entregador.html',{});return(0)}
        let ordenedResults = [];
        let bList = [];
        for (var x=0;x<results.length;x++) {
            if (bList.indexOf(results[x].cod_pedido) == -1) {
                let pedido = {}
                let cod_pedido = results[x].cod_pedido;
                let produtos = results.filter((pedidos) => {
                    return pedidos.cod_pedido == cod_pedido;
                })
                //console.log(cod_pedido,produtos);
                pedido[cod_pedido] = produtos;
                ordenedResults.push(produtos)
                bList.push(cod_pedido);
            }
        }
        console.log(ordenedResults)
        res.render('entregador.html',{"userData":userInfo,"entregas":ordenedResults});

    })
    
})

router.get('/entregador/checkout',(req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    if (userInfo == false || userInfo == undefined) {res.redirect('/entregador/login');return(0);}
    if (req.query.entrega == undefined) {res.redirect('/entregador');return(0);}
    
    let sql = "UPDATE `pedido` SET `atribuida` = '1', `cpfEntregador` = '"+userInfo.cpf+"' WHERE `cod_pedido` = "+req.query.entrega+";";
    db.query(sql,(error,results)=>{
        if (error) {throw error};
        res.redirect('/entregador')
    })
})

router.get('/entregador/meusPedidos',(req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log("User data: ",userInfo)
    if (userInfo == false || userInfo == undefined) {res.redirect('/entregador/login');return(0);}
    let sql = "SELECT * FROM `pedido` WHERE `atribuida` = 1 AND `cpfEntregador` = '"+userInfo.cpf+"'";
    db.query(sql,(error,results) => {
        if (error) {throw error}
        console.log(results)
        res.render('meusPedidos.html',{"userData":userInfo,"pedidos":results})
    })
})
router.get('/entregador/pedido/:cod_pedido',(req,res) => {
    if (req.params.cod_pedido == undefined) {res.redirect('/entregador');return(0)}
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log("User data: ",userInfo)
    if (userInfo == false || userInfo == undefined) {res.redirect('/entregador/login');return(0);}

    let sql = "SELECT * FROM `pedido` WHERE `atribuida` = 1 AND `cod_pedido` = "+req.params.cod_pedido+"  AND `cpfEntregador` = '"+userInfo.cpf+"'";
    db.query(sql, (error,results) => {
        if (error) {
            throw error;
        }
        if (results[0] == undefined) {
            res.redirect('/entregador');
        } else {
            res.render('dadosPedido.html',{"pedido":results[0],"userData":userInfo})
        }
        
    })

})
router.get('')
module.exports = router;