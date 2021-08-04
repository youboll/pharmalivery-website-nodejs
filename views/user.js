const express = require('express')
const router = express.Router();
const hash = require('hash.js');
const JWT = require('jsonwebtoken');
const db = require('../db.js');
const axios = require('axios');
const cookie = require('cookie-parser');
router.use(express.json());
router.use(express.urlencoded({ extended: false}));
//User login module
router.post('/user/signin/', (req,res) => {
    let username = req.body.username;
    let password = req.body.password;
    let destination = req.body.destination;
    if (username && password && destination) {
        const password = hash.sha512().update(req.body.password).digest('hex');
        
        let sql = "SELECT * FROM `users` WHERE `cpf` = '"+username+"' AND `senha` = '"+password+"'"; 
        let query = db.query(sql, (err,results) => {
            if (err) {
                throw err;
            } else if (results) {
                if (results[0] == undefined) {res.statusCode=404;res.send("Not found");return(0);}     
                //Remover as informacoes senviveis antes de transformar em string
                results[0].cpf = undefined;results[0].senha = undefined;
                let user = JSON.stringify(results[0]);
                let token = JWT.sign(user,require('../index.js').JWTPrivateKey);
                res.statusCode=200;
                res.cookie('key',token);
                res.redirect(destination)
            }
        });
    } else {
        res.statusCode = 401;res.send("campos vazios"+JSON.stringify(req.body));
    }
    
})

router.get('/user/login', (req,res) => {
    //console.log("cookie: ",req.headers.cookie.split('; '), breakCookie(req.headers.cookie));
    let userData = JWT.verify(breakCookie(req.headers.cookie).key,require('../index.js').JWTPrivateKey)
    //console.log(userData)
    return(res.render('login.html',{"userData": userData}))

})
//Instead of downloading a package
function breakCookie(cookie) {
    let cookies = cookie.split('; ');
    let finalCookie = {};
    for (var x=0;x<cookies.length;x++) {
        let element = cookies[x].split('=');
        finalCookie[element[0]] = element[1];
    }
    return(finalCookie)
}

module.exports = router;