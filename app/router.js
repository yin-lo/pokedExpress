const { Router } = require('express');
const homeController = require('./controllers/homeController');
const pokemonController = require('./controllers/pokemonController');

const router = Router();

router.get('/', homeController.index);
router.get('/pokemon/:id', pokemonController.detail);

module.exports = router;
