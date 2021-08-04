const router = require('express').Router();
//Faz a importação 
const index = require('../index');
const hash = require('hash.js');
const db = require('../db.js');
const JWT = require('jsonwebtoken');
router.post('/loja/signin', (req,res) => {
    if (req.body.jwtpass) {
        let tokenTry = checkToken(req);
        if (tokenTry === false) {res.statusCode = 401;res.send("Login incorreto");return(0);}
        res.json(tokenTry);
        return(0);
    }
    if (req.body.cnpj && req.body.password) {
        const password = hash.sha512().update(req.body.password).digest('hex');
        let sql = "SELECT * FROM `loja` WHERE `cnpj` = '"+req.body.cnpj+"' and `senha` = '"+password+"';";
        db.query(sql, (error,results) => {
            if (error) {
                throw error;
            }
            if (results) {
                if (results[0] == undefined) {res.statusCode = 401;res.send("Login incorreto");return(0);}
                let token = JWT.sign(JSON.stringify(results[0]),index.JWTPrivateKey);
                res.send(token);
               }
        })
    } else {
        res.statusCode = 410;res.send("Dados vazios");return(0);
    }
})
// Route de produtos no estilo CRUD ---- O mesmo link só muda o metodo
router.post('/loja/produto', (req,res) => {
    let wanted_info = ['nome','desc','lab','JWTKey','preco'];
    if (check_req(wanted_info) == false) {
        res.statusCode = 404;res.send("Dados vazios");return(0);
    }
    let userAuth =checkToken(req);
    if(userAuth == false) {res.statusCode = 401;res.send("Nao autorizada");return(0);}
    let sql = "INSERT INTO `produtos` (`nome`, `desc`, `lab`, `loja_id`, `preco`) VALUES ('"+req.body.nome+"', '"+req.body.desc+"', '"+req.body.lab+"', '"+userAuth.id+"', '"+req.body.preco+"');";
    db.query(sql, (error,result) => {
        if (error) {
            res.statusCode = 500;res.send("Erro desconhecido");return(0);
        } else {
            res.statusCode = 500; res.send("Ok");return(0);
        }
    })
})
router.get('/loja/produto', (req,res) => {
    if (check_req(['loja_id']) == false) {res.statusCode;res.send('Dados Vazios');return(0);}
    let sql = "SELECT * FROM `produtos` WHERE `loja_id`="+req.body.loja_id+"";
    db.query(sql, (error,results) => {
        if (error) {
            throw error;
        }
        if (results) {
            res.json(results)    
        }
    })
})
router.delete('/loja/produto', (req,res) => {
    let userAuth =checkToken(req);
    if(userAuth == false) {res.statusCode = 401;res.send("Nao autorizada");return(0);}
    if(check_req(['id_produto'])) {res.statusCode = 401;res.send("Dados vazios");return(0);}
    let sql = "SELECT * FROM `produtos` WHERE `produto_id`='"+req.body.id_produto+"' AND `loja_id` = '"+userAuth.id+"';"
    db.query(sql,(error,results) => {
        if (error) {
            throw error;
        }
        if (results[0] == undefined) {res.statusCode = 401;res.send('Nao a');return(false)} 
        else {

            let sql2 = "DELETE FROM `produtos` WHERE `produtos`.`produto_id` = "+req.body.id_produto+"";
            db.query(sql2, (error,results) => {
                    if (error) {
                        throw error;
                    } else {
                        res.send("Ok");return(0);
                    }
                })
        }
    })
     
        
})
module.exports = router;

//Erro consertado: Não pode retornar valores no callback -- Passar para variavel intermediaria
function checkToken (req,sensitive = false) {
    let resu = null;
    JWT.verify(req.body.jwtpass,index.JWTPrivateKey, (error,user) => {
        if (error) {
            resu = false;
        } else {
            resu = user;
        }

        if (sensitive == false) {
            delete resu.senha;   
        }
    })
    return(resu);
}
function check_req(wantedData,uselessData) {

    for (var x=0;x<wantedData.lenght;x++) {
        if ( req.body.hasOwnProperty(wantedData[x])) {
        
        } else {
            if (uselessData.includes(wantedData[x]) == false) {console.log(wantedData[x]);return(false);}
        }
    }


}