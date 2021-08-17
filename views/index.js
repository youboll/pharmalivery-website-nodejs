const Router = require('express').Router();
const JWT = require('jsonwebtoken')
Router.get('/', (req,res) => {
    let userData = undefined;
    try {
        userData = JWT.verify(breakCookie(req.headers.cookie).key,require('../index.js').JWTPrivateKey);
    } catch(e) {
        userData = false;
    }
    res.render('index.html',{"userData": userData});
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