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
            
            let check =  check_req(wantedData,req.body) 
            if (check == false) {res.statusCode = 401;res.render('lojaCadastro.html',{error:"Dados vazios"});return(0)}

            if (req.body.email != req.body.email2) {res.statusCode = 401;res.render('lojaCadastro.html',{error:"<strong>Email</strong> não correspondente"});return(0)}
            if (req.body.senha != req.body.senha2) {res.statuscode = 401;res.render('lojCadastro.html',{error:"<strong>Senh</strong> não correspondente"});return(0)}
        
            if (check != false) {
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
            let wantedUserData = ['username','cpf','email','email2','telefone','senha','senha2'];
            let checkData = check_req(wantedUserData,req.body); 
            
            console.log("Empty: ",checkData)

            console.log("req",req.body)
            
            if (checkData == false) {res.code = 401;res.render('cadastro.html',{error:"Dados Vazios"});return(0)}
            // *TODO: Trocar todo res.send para res.render bobalhão
            if (req.body.email != req.body.email2) {res.statusCode = 401;res.render('cadastro.html',{error:"<strong>Email</strong> não correspondente"});return(0)}
            if (req.body.senha != req.body.senha2) {res.statuscode = 401;res.render('cadastro.html',{error:"<strong>Senha</strong> não correspondente"});return(0)}
            if (8>req.body.senha.length || req.body.senha > 16) {res.statuscode = 401;res.render('cadastro.html',{error:"A <strong>Senha</strong> deve ser maior que 8 e menor de 16 caracteres"});return(0)}
            const username = req.body.username; 
            const password = hash.sha512().update(req.body.senha).digest('hex');
            const email = req.body.email;
            const cpf = req.body.cpf;  
            const phone_num = req.body.telefone; 


            let query = "INSERT INTO `users` (`cpf`, `email`, `telefone`, `usuario`, `senha`) VALUES ('"+cpf+"', '"+email+"', '"+phone_num+"', '"+username+"', '"+password+"');";
            let signupQuery = db.query(query, (err) => {
                if (err) {
                    if (err.code == "ER_DUP_ENTRY") {res.statusCode = 500;res.render('cadastro.html',{error:"Usuario já cadastrado"});return(0)};
                } else {
                    res.redirect('/')
                }
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

module.exports = router;

//Verifica request
function check_req(wantedData,request) {
    for (var x=0;x<wantedData.length;x++) {
        //console.log('aieou')
        if (request[wantedData[x]] == "") {
           return(false)
        }

    }
    //return(true)
}