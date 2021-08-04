//Foi uma gambiarra pra "Organizar" o projeto sem controladores ou roteadores
const router = require('express').Router();

router.use(require('./views/signup.js'));
router.use(require('./views/user.js'));
router.use(require('./views/loja.js'));
router.use(require('./views/index.js'));
router.use(require('./views/logout.js'));

module.exports = router;
