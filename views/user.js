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
                if (results[0] == undefined) {res.statusCode=404;res.render('./login.html',{error:'Usuario ou senha incorretos'});return(0);}     
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
        res.statusCode = 401;res.redirect(req.body.destination);
    }
    
})

router.get('/user/login', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    console.log(userInfo)
    return(res.render('login.html',{"userData": userInfo}))

})
//Instead of downloading a package
 

//Getting userData Utils
class userData {
    constructor () {
        // Nothing to put inside here
    }
    // undefined == req empty ; false == JWT invalid; other == UserData
    getJWtByCookie(req) {
        let cookies = undefined;
        if (req.cookie) {
            cookies = breackCookie(req.cookie);
        } else {
            return(undefined)
        }
        try {
            let userData = JWT.verify(cookies.key,require('../index.js').JWTPrivateKey);
            return(userData)
        } catch (err) {
            throw (err);
            return(false);
        }

    }

    breakCookie(cookie) {
        try{
            let cookies = cookie.split('; ');
            let finalCookie = {};
            for (var x=0;x<cookies.length;x++) {
                let element = cookies[x].split('=');
                finalCookie[element[0]] = element[1];
            }
        } catch (err) {
            return(false)
        }
        return(finalCookie)
    }a
}
module.exports = router;
module.exports.user = userData;