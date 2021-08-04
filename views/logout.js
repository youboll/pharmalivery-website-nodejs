const Router = require('express').Router();
Router.get('/logout/', (req,res) => {
    if (req.query.destination == undefined) {res.redirect('/');} else {
    console.log(req.query.destination);
    res.render('logout.html',{"destination": req.query.destination});
    }
})
module.exports = Router;