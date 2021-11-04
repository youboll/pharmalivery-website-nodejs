const express = require('express')
const router = require('express').Router();
const hash = require('hash.js');
const db = require('../db.js');
const JWT = require('jsonwebtoken')
router.use(express.urlencoded({ extended: false}));

router.post('/signup/', (req,res) => {
    switch(req.body.type) {
        case 'loja':
            let wantedData = ['nome_fantasia', 'cnpj', 'insc_estadual', 'email','email2', 'cep', 'endereco', 'numero', 'bairro', 'cidade', 'estado', 'telefone', 'celular','senha','senha2'];
            let senha = hash.sha512().update(req.body.senha).digest('hex');
            
            
            if (check == false) {res.statusCode = 401;res.render('lojaCadastro.html',{error:"Dados vazios"});return(0)}

            if (req.body.email != req.body.email2) {res.statusCode = 401;res.render('lojaCadastro.html',{error:"<strong>Email</strong> não correspondente"});return(0)}
            if (req.body.senha != req.body.senha2) {res.statuscode = 401;res.render('lojCadastro.html',{error:"<strong>Senh</strong> não correspondente"});return(0)}
        
            if (check != false) {
                let check =  check_req(wantedData,req) 
                let sql = "INSERT INTO `loja` (`nome_fantasia`, `cnpj`, `insc_estadual`, `site`, `email`, `cep`, `endereco`, `numero`, `bairro`, `cidade`, `estado`, `telefone`, `celular`,`senha`) VALUES ('"+req.body.nome_fantasia+"', '"+req.body.cnpj+"', '"+req.body.insc_estadual+"', '"+req.body.site+"', '"+req.body.email+"', '"+req.body.cep+"', '"+req.body.endereco+"', '"+req.body.numero+"', '"+req.body.bairro+"', '"+req.body.cidade+"', '"+req.body.estado+"', '"+req.body.telefone+"', '"+req.body.celular+"','"+senha+"')";

                db.query(sql,(error,results) => {
                    if (error) {
                        if (error.code == "ER_DUP_ENTRY") {res.statusCode = 500;res.render('lojaCadastro.html',{error:"Loja já cadastrada"});return(0)};
                    } else {
                        res.redirect('/');
                        return(0);
                    }
                })
            }
            
            break;

        case 'usuario':
            let wantedUserData = ['username','cpf','email','email2','telefone','logradouro','numero','cidade','bairro','estado','senha','senha2'];
            let checkData = check_req(wantedUserData,req); 
            
            console.log("Empty: ",checkData)

            console.log("req",req.body)
            
            if (checkData == false) {res.code = 401;res.render('cadastro.html',{error:"Dados Vazios"});return(0)}
            // *TODO: Trocar todo res.send para res.render bobalhão
            if (req.body.email != req.body.email2) {res.statusCode = 401;res.render('cadastro.html',{error:"<strong>Email</strong> não correspondente"});return(0)}
            if (req.body.senha != req.body.senha2) {res.statuscode = 401;res.render('cadastro.html',{error:"<strong>Senha</strong> não correspondente"});return(0)}
            if (8 > req.body.senha.length || req.body.senha.length > 16) {res.statuscode = 401;res.render('cadastro.html',{error:"A <strong>Senha</strong> deve ser maior que 8 e menor de 16 caracteres"});return(0)}
            var username = req.body.username; 
            var password = hash.sha512().update(req.body.senha).digest('hex');
            var email = req.body.email;
            var cpf = req.body.cpf;  
            var phone_num = req.body.telefone; 
            var logradouro = req.body.logradouro;
            var numero = req.body.numero;
            var cidade = req.body.cidade;
            var bairro = req.body.bairro;
            var estado = req.body.estado;

            let query = "INSERT INTO `cliente` (`Cpf`, `Logradouro`, `Nome`, `Email` , `cidade`, `bairro`, `estado`, `celular`, `senha`) VALUES ('"+cpf+"', '"+logradouro+"', '"+username+"', '"+email+"',  '"+cidade+"', '"+bairro+"', '"+estado+"', '"+phone_num+"', '"+password+"');";
            let signupQuery = db.query(query, (err) => {
                if (err) {
                    if (err.code == "ER_DUP_ENTRY") {res.statusCode = 500;res.render('cadastro.html',{error:"Usuario já cadastrado"});return(0)};
                } else {
                    res.redirect('/')
                }
            });
            
            break;
        case 'entregador':
                var WantedEntregadorData = ['nome','cpf','email','email2','telefone','logradouro','numero','cidade','bairro','estado','cep','senha','senha2'];
                var checkUserData = check_req(WantedEntregadorData,req); 
                if (checkUserData == false) {res.code = 401;res.render('cadastroEntregador.html',{error:"Dados Vazios"});return(0)}
                if (req.body.email != req.body.email2) {res.statusCode = 401;res.render('cadastroEntregador.html',{error:"<strong>Email</strong> não correspondente"});return(0)}
                if (req.body.senha != req.body.senha2) {res.statuscode = 401;res.render('cadastroEntregador.html',{error:"<strong>Senha</strong> não correspondente"});return(0)}
                if (8 > req.body.senha.length || req.body.senha.length > 16) {res.statuscode = 401;res.render('cadastroEntregador.html',{error:"A <strong>Senha</strong> deve ser maior que 8 e menor de 16 caracteres"});return(0)}
                var nomeEntregador = req.body.nome; 
                let senhaEntregador = hash.sha512().update(req.body.senha).digest('hex');
                 email = req.body.email;
                 cpf = req.body.cpf;  
                 telefone = req.body.telefone; 
                 logradouro = req.body.logradouro;
                 numero = req.body.numero;
                 cidade = req.body.cidade;
                 bairro = req.body.bairro;
                 estado = req.body.estado;
                 cep = req.body.cep;
                let sqlQuery = "INSERT INTO `pharma`.`entregador` (`nome`, `cpf`, `senha`, `email`, `telefone`, `logradouro`, `numero`, `bairro`, `cidade`, `estado`, `cep`) VALUES ('"+nomeEntregador+"', '"+cpf+"', '"+senhaEntregador+"', '"+email+"', '"+telefone+"', '"+logradouro+"', '"+numero+"', '"+bairro+"', '"+cidade+"', '"+estado+"', '"+cep+"');";
                db.query(sqlQuery,(error) => {
                    if (error) {throw error}
                    res.redirect('/');
                });
    
                break;
        default:
            res.statusCode = 401;
            res.send("tipo desconhecido");return(0);
            break;
    }
})

router.get('/cadastro', (req,res) => {
    res.render('cadastro.html', {})
})


//Verifica request
function check_req(wantedData,request) {
    for (var x=0;x<wantedData.length;x++) {
        if (request.body == undefined) { return(false)}
        if (request.body[wantedData[x]] == "") {
           return(false)
        }

    }
    //return(true)
}

module.exports = router;
module.exports.check_req = check_req;