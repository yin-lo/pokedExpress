// mettre en place pour le .env
require('dotenv/config');

// utilisation du port avec le .env
const PORT = process.env.PORT || 3000;

// dire qu'on utilise express
const express = require('express');
//on la renomme app pour plus de facilité
const app = express();

// On met en place le moteur de rendu
app.set('view engine', 'ejs');
app.set('views', './app/views');

// On fait le lien vers les fichiers statics
app.use(express.static('public'));

app.get('/', (req,res) => {
	res.render ('home');
});




app.listen(PORT, () => {
	console.log(`Example app listening on port localhost:${PORT} !`);
  });