const router = require('express').Router();
router.get('/entregador/cadastro', (req,res) => {
    res.render('cadastroEntregador.html',{})
})
module.exports = router;