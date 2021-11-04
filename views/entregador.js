const router = require('express').Router();
const hash = require('hash.js');
const db = require('../db.js');

router.get('/entregador/login/',(req,res) => {
    res.render('loginEntregador.html',{})
})
router.post('/entregador/login/', (req,res) => {
    let username = req.body.username;
    let password = req.body.password;
    let destination = req.body.destination;
    if (username && password && destination) {
        const password = hash.sha512().update(req.body.password).digest('hex');
        
        let sql = "SELECT * FROM `entregador` WHERE `cpf`='"+username+"' AND `senha` = '"+password+"'"; 
        let query = db.query(sql, (err,results) => {
            if (err) {
                throw err;
            } else if (results) {
                if (results[0] == undefined) {res.statusCode=404;res.render('./login.html',{error:'Usuario ou senha incorretos'});return(0);}     
                //Remover as informacoes senviveis antes de transformar em string
                results[0].senha = undefined;
                results[0].type= "entregador"
                let user = JSON.stringify(results[0]);
                let token = JWT.sign(user,require('../index.js').JWTPrivateKey);
                res.statusCode=200;
                res.cookie('key',token);
                res.redirect(destination)
            }
        });
    } else {
        res.statusCode = 401;res.redirect(req.body.destination);
    }
    
})

module.exports = router;