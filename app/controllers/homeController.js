const dataMapper = require('../dataMapper');

const homeController = {
  async index(req, res) {
    try {
      const pokemons = await dataMapper.findAllPokemon();
      res.render('index', {
        pokemons,
      });
    } catch (err) {
      console.error(err);
      res.status(500).send('Erreur lors de la récupération des pokémons');
    }
  },
};

module.exports = homeController;
