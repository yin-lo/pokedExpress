# Challenge

## Objectif

Réviser les notions de la saison 4.

- Initialiser une base de données
- Faire des requêtes SQL
- express / ejs
- routage
- controller
- model (dataMapper)

## Étape 0: MCD

Le script de création de BDD est déjà fourni dans le fichier `data/create_db.sql`.
Cependant, le but est d'essayer de faire le MCD de la base de données sans regarder le script.

Un pokémon dispose des caractéristiques suivantes :
- un numéro de pokedex
- un numéro de génération
- une catégorie
- un nom français / anglais / japonais
- une image normal (url)
- une image shiny (url)
- des types (plante, feu, eau, etc.)
- des statistiques (pv, attaque, défense, vitesse, etc.)
- des talents (capacités spéciales)

Modéliser la base de données en tenant compte de ces caractéristiques.

## Étape 1: Mise en place

Utiliser npm pour:

- Initialiser le projet.
- Installer les dépendances nécessaires : `express`, `ejs`, `pg`, et `dotenv`.

Le projet utilise pour gérer le style la lib `picocss` (https://picocss.com/).

## Étape 2: Initialisation de la base de données

Les données sont fournies dans un fichier `data/create_db.sql`, à importer dans une base de données PostGreSQL.

Créer un nouvel utilisateur et une nouvelle base de données dans PostGreSQL, puis y importer les données du fichier. [Cette fiche récap](https://kourou.oclock.io/ressources/objectifs/creer-une-nouvelle-base-de-donnee-sur-postgresql/) peut être utile :wink:.

Créer un fichier `.env` contenant les informations du fichier `.env.example`, pour y mettre les informations de connexion à la base de données.

Créer ensuite un fichier `dataMapper.js` (Benjamin) ou `models/pokemon.js` (Quentin) dans le dossier `app`.

Dans ce fichier, copier ce code :

```javascript
const client = require('../database');

const pokedexDataMapper = {


};

module.exports = pokedexDataMapper;
```

## Étape 3: Récupération des pokemons

Dans le fichier `dataMapper/pokedex.js`, créer une méthode `getAllPokemon` qui récupère tous les pokemons de la base de données.

## Étape 4: Affichage des pokemons

Dans le controller appeler sur la route `/` :

- Récupérer tous les pokemons de la base de données. (utiliser la méthode créée précédemment)
- Passer les pokemons récupérés à la vue `index.ejs`.

## Étape 5: Affichage d'un pokemon

Créer une nouvelle route `/pokemon/:id` qui affiche les informations d'un pokemon.

Dans le model / dataMapper :

- Créer une méthode `getOnePokemon` qui récupère un pokemon en fonction de son id.

Dans le controller :

- Récupérer le pokemon correspondant à l'id passé en paramètre de la route.
- Passer le pokemon récupéré à la vue `pokemon.ejs`.

## Bonus 1 : Affichage des types

Sur la page de détail d'un pokemon, afficher ses types (données situer sur une autre table)

## Bonus 2 : Faire des requêtes SQL

Ne pas hésiter à créer des pages sur lesquelles afficher les résultats des requêtes SQL suivantes.

Requêtes SQL à faire :
- Récupérer les pokemons de la génération 1 (filtre)
- Récupérer les pokemons avec leurs statistiques (jointure)
- Récupérer les pokemons ayant un talent "Brasier" (jointure)
- Récupérer les pokemons ayant une attaque supérieure à 100 (jointure + filtre)
- Récupérer les pokemons ayant une attaque supérieure à 100 et une défense inférieure à 50 (jointure + filtre)
- Récupérer les pokemons de type "Eau" (jointure de table intermédiaire)
- Compter le nombre de pokemons de type "Feu" (agrégation)
- Compter le nombre de pokemons de chaque type (aggrégation + regroupement)
- Récupérer un pokémon depuis son id ainsi que ses types aggréger dans un tableau (jointure + agrégation)
  - Exemple : `{ id: 1, name_fr: "Bulbizarre", types: ["Plante", "Poison"] }`
  - Voir la fonction `array_agg` de PostgreSQL
- Pareil que précédemment mais avec les types sous forme de tableau d'objets (jointure + agrégation)
  - Exemple : `{ id: 1, name_fr: "Bulbizarre", types: [{ id: 1, name: "Plante" }, { id: 2, name: "Poison" }] }`
- Récupérer les pokémons avec les types et les talents (jointure multiple)
  - Exemple : `[{ id: 1, name_fr: "Bulbizarre", types: [{id: 1, name: "Plante"], talents: [{id: 1, name: "Engrais"}]}, ...]`

Correction => [ici]('./requete.sql')
