const router = require('express').Router();
const userData = require('./user.js').userJWT;
const db = require('../db.js')
router.get('/produto/:cod_produto', (req,res) => {
    let user = new userData();
    let userInfo = user.getJWtByCookie(req);
    if (req.params.cod_produto == undefined) {res.redirect('/');return(0);}
    let sql = "SELECT * FROM `remedios` WHERE `cod_remedio` = '"+req.params.cod_produto+"'";
    db.query(sql, (error,results) => {
        if (error) {throw error;}
        if (results[0] == undefined) {res.redirect('/');return(0);}
        let produtoData = results[0];
        let query = "SELECT * FROM `foto_produto` WHERE `id_produto` = "+req.params.cod_produto+"";
        db.query(query,(err,results) => {
            res.render('produto.html',{"produto":produtoData,"fotos":results})
        })
        
    })
})

module.exports = router;