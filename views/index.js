const Router = require('express').Router();
const JWT = require('jsonwebtoken');
const db = require('../db.js')
Router.get('/', (req,res) => {
    let userData = undefined;
    try {
        userData = JWT.verify(breakCookie(req.headers.cookie).key,require('../index.js').JWTPrivateKey);
    } catch(e) {
        userData = false;
    }
    let sql = "SELECT * FROM `remedios`";
    db.query(sql,(error,results) => {
        if (error) {throw error;}
        for (var x=0;x<results.length;x++) {
            if (results[x].desc.length > 60) {
                results[x].desc = results[x].desc.substr(0,60); 
            }
        }
        res.render('index.html',{"userData": userData,"produtos":results});
    })
    
})
//Instead of downloading a package
function breakCookie(cookie) {
    if (cookie == undefined) { return(false);}
    let cookies = cookie.split('; ');
    let finalCookie = {};
    for (var x=0;x<cookies.length;x++) {
        let element = cookies[x].split('=');
        finalCookie[element[0]] = element[1];
    }
    return(finalCookie)
}
module.exports = Router;
