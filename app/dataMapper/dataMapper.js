const client = require('../database/client');

const dataMapper = {
async getAllPokemons (){
	const result = await client.query('SELECT * FROM pokemon;');

	return result.rows;
}
};

module.exports = dataMapper;