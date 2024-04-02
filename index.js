// mettre en place pour le .env
require('dotenv/config');

// utilisation du port avec le .env
const PORT = process.env.PORT || 3000;

// dire qu'on utilise express
const express = require('express');
//on la renomme app pour plus de facilité
const app = express();

//appel des autres fichiers
const dataMapper = require('./app/dataMapper/dataMapper');
const mainController = require('./app/controllers/mainController');

// On met en place le moteur de rendu
app.set('view engine', 'ejs');
app.set('views', './app/views');

// On fait le lien vers les fichiers statics
app.use(express.static('public'));

// on crée la route de la page d'accueil
app.get('/', mainController.homePage);


app.listen(PORT, () => {
	console.log(`Example app listening on port localhost:${PORT} !`);
  });