router = require('express').Router();
const hash = require('hash.js');
const db = require('../db.js');
router.post('/signup/', (req,res) => {
    switch(req.body.type) {
        case 'loja':
            let wantedData = ['nome_fantasia', 'cnpj', 'insc_estadual', 'site', 'email', 'cep', 'endereco', 'numero', 'bairro', 'cidade', 'estado', 'telefone', 'celular','senha'];
            let check = check_req(wantedData,['site','telefone']); 
            let senha = hash.sha512().update(req.body.senha).digest('hex');

            let sql = "INSERT INTO `loja` (`nome_fantasia`, `cnpj`, `insc_estadual`, `site`, `email`, `cep`, `endereco`, `numero`, `bairro`, `cidade`, `estado`, `telefone`, `celular`,`senha`) VALUES ('"+req.body.nome_fantasia+"', '"+req.body.cnpj+"', '"+req.body.insc_estadual+"', '"+req.body.site+"', '"+req.body.email+"', '"+req.body.cep+"', '"+req.body.endereco+"', '"+req.body.numero+"', '"+req.body.bairro+"', '"+req.body.cidade+"', '"+req.body.estado+"', '"+req.body.telefone+"', '"+req.body.celular+"','"+senha+"')";

            db.query(sql,(error,results) => {
                if (error) {
                    if (error.code == "ER_DUP_ENTRY") {res.statusCode = 500;res.send("ja cadastrado")};
                } else {
                    res.send("ok");
                    return(0);
                }
            })
            if (check == false) {res.statusCode = 401;res.send('Dados vazios');return(0);}
            break;

        case 'usuario':
                
            const username = req.body.username; 
            const password = hash.sha512().update(req.body.password).digest('hex');
            const email = req.body.email;
            const cpf = req.body.cpf;  
            const phone_num = req.body.phone_num; 


            let query = "INSERT INTO `users` (`cpf`, `email`, `telefone`, `usuario`, `senha`) VALUES ('"+cpf+"', '"+email+"', '"+phone_num+"', '"+username+"', '"+password+"');";
            let signupQuery = db.query(query, (err) => {
                if (err) {
                    if (err.code == "ER_DUP_ENTRY") {res.statusCode = 500;res.send("ja cadastrado")};
                } else {
                    // 200 - OK 
                    res.statusCode = 200
                    res.send("Operation ok");
                }
            });
            break;
        default:
            res.statusCode = 401;
            res.send("tipo desconhecido");return(0);
            break;
    }
})

module.exports = router;


//Verifica entradas no request e analiza elas com uma whitelist
function check_req(wantedData,uselessData) {

    for (var x=0;x<wantedData.lenght;x++) {
        if ( req.body.hasOwnProperty(wantedData[x])) {
        
        } else {
            if (uselessData.includes(wantedData[x]) == false) {console.log(wantedData[x]);return(false);}
        }
    }


}