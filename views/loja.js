const router = require('express').Router();
const express = require('express')
const path = require('path');
//Faz a importação 
const index = require('../index');
const hash = require('hash.js');
const db = require('../db.js');
const JWT = require('jsonwebtoken');
const userData = require('./user.js').userJWT;
const check_req = require('./signup.js').check_req;
const fileupload = require('express-fileupload');
const fs = require('fs')
router.use(fileupload())

router.use(express.urlencoded({ extended: false}));

router.get('/loja/login',(req,res) => {
    res.render('lojaLogin.html',{})
})

router.get('/loja/estoque', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);

    let sql = "SELECT * FROM `remedios` WHERE farmacia = '"+userInfo.cnpj+"'";
    db.query(sql, (error,results) => {
        if (error) {throw error;}

        console.log("Dados usuario",userInfo)
        return(res.render('estoque.html',{"userData": userInfo,"products":results,"msg":req.query.msg}))
    })
    

})

router.get('/loja/addproduto', (req,res) => {
    res.render('addProduto.html', {});
})

//Terminar Update
router.get('/loja/produto/update',(req,res) => {
    if (req.query.id_produto == undefined) {res.redirect('/loja/estoque');return(0);}
    
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    if (userInfo == false) {res.redirect('/');return(0);}
    let sql = "SELECT * FROM `remedios` WHERE farmacia = '"+userInfo.cnpj+"' AND cod_remedio = "+req.query.id_produto+"";
    db.query(sql, (error,results) => {
        if (error) {throw error;}
        if (results[0] == undefined) {res.redirect('/loja/estoque?msg=Produto inesistente');return(0);}
        res.render('atualizar.html',{produto:results[0],msg:req.query.msg})
    })
})





// Rotas POST
router.post('/loja/signin', (req,res) => {
    if (req.body.cnpj && req.body.password) {
        const password = hash.sha512().update(req.body.password).digest('hex');
        let sql = "SELECT * FROM `loja` WHERE `cnpj` = '"+req.body.cnpj+"' and `senha` = '"+password+"';";
        db.query(sql, (error,results) => {
            if (error) {
                throw error;
            }
            if (results) {
                if (results[0] == undefined) {res.statusCode = 401;res.render('lojaLogin.html', {error:"Credenciais invalidas"});return(0);}
                results[0].type = "loja";
                results[0].senha = undefined;

                let token = JWT.sign(JSON.stringify(results[0]),index.JWTPrivateKey);
                res.cookie('key',token);
                if (req.body.destination) {res.redirect(req.body.destination)} else {
                    res.redirect('/')
                }
               }
        })
    } else {
        // Exemplo de erro
        res.render('lojaLogin.html', {error:"Campos Vazios"})
    }
})

// CRUD do remedio

//Cadastro
router.post('/loja/produto', (req,res) => {
    let wanted_info = ["nome","desc","lab","valor","qtd_unit","qtd_est","desc","tipo"];
    let check_info = check_req(wanted_info,req);
    console.log("Arquivos",req.files)
    //Lidando com fotos
    
    console.log(check_info)
    if (check_info == false) {
        res.render('addProduto.html', {erro:"Dados vazios"});return(0);
    }
    
    //Check JWT
    let user = new userData();
    let userAuth = user.getJWtByCookie(req);
    console.log("Dados JWT "+userAuth)
    if(userAuth == false || userAuth.type != "loja") {res.statusCode = 401;res.send("Nao autorizada");return(0);}
    let urls = []
    if (req.files) {
        //C:\xampp\htdocs\pharmalivery
        
        let dir = "/pedro/projects/pharmalivery-website-nodejs/static/fotos/";
        //dir = path.normalize(dir)
        let wanted_files = ['file1','file2','file3','file4'];
        for (var x=0;x<wanted_files.length;x++) {
            if (req.files[wanted_files[x]] != undefined) {
                let file = req.files[wanted_files[x]];
                let photoName = parseInt(Math.random() * 1000 + 1).toString()+file.name;
                file.mv(dir+photoName, (err) => {
                    if (err) {
                        throw(err);
                    }
                })
       
                urls.push('/fotos/'+photoName);
            }

        }
        

    }
    const nome = req.body.nome;
    const desc = req.body.desc;
    const lab = req.body.lab;
    const valor = parseFloat(req.body.valor);
    const qtd_unit = parseInt(req.body.qtd_unit);
    const qtd_est = parseInt(req.body.qtd_est);
    const tipo = req.body.tipo;
    const frete = parseInt(req.body.frete);
    const foto1 = (urls[0] != undefined)? urls[0] : null;
    const foto2 = (urls[1] != undefined)? urls[1] : null;
    const foto3 = (urls[2] != undefined)? urls[2] : null;
    let sql = "INSERT INTO `pharma`.`remedios` (`farmacia`,`valor`,`valorFrete`, `nome`, `laboratorio`, `tipo`, `qtdade_unidade`, `qtdadeEstoque`, `desc`,`foto1`,`foto2`,`foto3`) VALUES ('"+userAuth.cnpj+"','"+valor+"', '"+frete+"','"+nome+"', '"+lab+"', '"+tipo+"', '"+qtd_unit+"', '"+qtd_est+"', '"+desc+"','"+foto1+"','"+foto2+"','"+foto3+"');";
    db.query(sql, (error,result) => {
        if (error) {
            throw error;
            //res.render('addProduto.html',{erro:"Erro desconhecido"});return(0);
        } else {
            res.redirect('/loja/estoque');
        }
    })

    

})

//Delete
router.get('/loja/produto/delete', (req,res) => {
    let user = new userData();
    let userAuth = user.getJWtByCookie(req);
    let id_produto = req.query.id_produto;
    if(userAuth == false || userAuth.type != "loja") {res.statusCode = 401;res.send("Credenciais invalidas");return(0);}

    if (id_produto == undefined) {res.send('campos vazios');return(0);}

    let sql = "DELETE FROM `remedios` WHERE `remedios`.`cod_remedio` = "+id_produto+" AND farmacia = '"+userAuth.cnpj+"'";
    db.query(sql,(error,results) => {
        if (error) {
            throw error;
        }
    
        res.redirect('/loja/estoque?msg=Produto Deletado com sucesso');
        
        
    })
     
        
})

router.post('/loja/produto/update', (req,res) => {
    if (req.body.id_produto == undefined) {res.send('/loja/estoue');}
    

    let user = new userData();
    let userAuth = user.getJWtByCookie(req);
    if (userAuth == false) {res.redirect('/');return(0)}
    
    let wanted_info = ["nome","desc","lab","valor","qtd_unit","qtd_est","desc","tipo"];
    let check_info = check_req(wanted_info,req);
    if (check_info == false) {res.redirect('/loja/produto/update?msg=Dados Vazios&id_produto='+req.body.id_produto+'');return(0);}

    const id_produto = req.body.id_produto;
    const farmacia = userAuth.cnpj;
    const valor = req.body.valor;
    const nome = req.body.nome;
    const lab = req.body.lab;
    const tipo = req.body.tipo;
    const qtdade_unidade = req.body.qtd_unit;
    const qtdadeEstoque = req.body.qtd_est;
    const frete = parseInt(req.body.frete)
    let sql  = "UPDATE `remedios` SET `farmacia` = '"+farmacia+"', `valor` = '"+valor+"', `nome` = '"+nome+"', `laboratorio` = '"+lab+"', `tipo` = '"+tipo+"', `qtdade_unidade` = '"+qtdade_unidade+"', `qtdadeEstoque` = '"+qtdadeEstoque+"',`valorFrete` = '"+frete+"' WHERE `remedios`.`cod_remedio` = "+id_produto+" ";
    db.query(sql,(error,results) => {
        if (error) {throw error;}
        res.redirect('/loja/estoque?msg=Alterado com sucesso')
    })
})

//Signup
router.get('/loja/cadastro', (req,res) => {
    res.render('lojaCadastro.html')
})
module.exports = router;

