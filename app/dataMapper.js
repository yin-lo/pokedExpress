const client = require('./database');

const dataMapper = {
  async findAllPokemon() {
    const result = await client.query('SELECT * FROM pokemon');

    return result.rows;
  },

  async findOnePokemon(id) {
    const result = await client.query('SELECT * FROM pokemon WHERE id = $1', [id]);

    return result.rows[0];
  },

  async findPokemonTypes(pokemonId) {
    const result = await client.query(`
    SELECT
        *
    FROM
        TYPE
        JOIN pokemon_type ON type.id = pokemon_type.type_id
    WHERE
        pokemon_type.pokemon_id = $1;
    `, [pokemonId]);

    return result.rows;
  },
};

module.exports = dataMapper;
