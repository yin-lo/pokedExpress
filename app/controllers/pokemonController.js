const dataMapper = require('../dataMapper');

const pokemonController = {
  async detail(req, res) {
    try {
      const { id } = req.params;
      const pokemon = await dataMapper.findOnePokemon(id);
      const types = await dataMapper.findPokemonTypes(id);

      if (!pokemon) {
        res.status(404).send('Pokémon non trouvé');
      } else {
        res.render('detail', {
          pokemon,
          types,
        });
      }
    } catch (err) {
      console.error(err);
      res.status(500).send('Erreur lors de la récupération du pokémon');
    }
  },
};

module.exports = pokemonController;
