const dataMapper = require('../dataMapper/dataMapper');

const mainController = {
	async homePage (req, res){
		try {
			const allPokemons = await dataMapper.getAllPokemons();

			res.render('home', { allPokemons } );
		} catch (error) {
			console.error(error);
			res.status(500).send(`An error occured with the database :\n${error.message}`);
		}
	}
};

module.exports = mainController;