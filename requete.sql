-- Récupérer les pokemons de la génération 1 (filtre)
SELECT
    *
FROM
    pokemon
WHERE
    generation = 1;

-- Récupérer les pokemons avec leurs statistiques (jointure)
SELECT
    *
FROM
    pokemon
    JOIN stats ON pokemon.id = stats.pokemon_id;

-- Récupérer les pokemons ayant un talent "Brasier" (jointure)
SELECT
    *
FROM
    pokemon
    JOIN pokemon_talent ON pokemon.id = pokemon_talent.pokemon_id
    JOIN talent ON pokemon_talent.talent_id = talent.id
WHERE
    talent.name = 'Brasier';

-- Récupérer les pokemons ayant une attaque supérieure à 100 (jointure + filtre)
SELECT
    *
FROM
    pokemon
    JOIN stats ON pokemon.id = stats.pokemon_id
WHERE
    stats.attack > 100;

-- Récupérer les pokemons ayant une attaque supérieure à 100 et une défense inférieure à 50 (jointure + filtre)
SELECT
    *
FROM
    pokemon
    JOIN stats ON pokemon.id = stats.pokemon_id
WHERE
    stats.attack > 100
    AND stats.defense < 50;

-- Récupérer les pokemons de type "Eau" (jointure de table intermédiaire)
SELECT
    *
FROM
    pokemon
    JOIN pokemon_type ON pokemon.id = pokemon_type.pokemon_id
    JOIN type ON pokemon_type.type_id = type.id
WHERE
    type.name = 'Eau';

-- Compter le nombre de pokemons de type "Feu" (agrégation)
SELECT
    COUNT(pokemon.*)
FROM
    pokemon
    JOIN pokemon_type ON pokemon.id = pokemon_type.pokemon_id
    JOIN type ON pokemon_type.type_id = type.id
WHERE
    type.name = 'Feu';

-- Compter le nombre de pokemons de chaque type (aggrégation + regroupement)
SELECT
    type.name,
    COUNT(pokemon.*) AS nb_pokemon
FROM
    pokemon
    JOIN pokemon_type ON pokemon.id = pokemon_type.pokemon_id
    JOIN TYPE ON pokemon_type.type_id = type.id
GROUP BY
    type.id
ORDER BY
    nb_pokemon DESC;

-- Récupérer un pokémon depuis son id ainsi que ses types aggréger dans un tableau (jointure + agrégation)
--   - Exemple : `{ id: 1, name_fr: "Bulbizarre", types: ["Plante", "Poison"] }`
--   - Voir la fonction `JSON_AGG` de PostgreSQL
SELECT
    p.*,
    JSON_AGG(ty.name) as types
FROM
    pokemon p
    JOIN pokemon_type pty ON p.id = pty.pokemon_id
    JOIN type ty ON pty.type_id = ty.id
WHERE p.id = 2
GROUP BY p.id;

-- Pareil que précédemment mais avec les types sous forme de tableau d'objets (jointure + agrégation)
--   - Exemple : `{ id: 1, name_fr: "Bulbizarre", types: [{ id: 1, name: "Plante" }, { id: 2, name: "Poison" }] }`
SELECT
    p.*,
    JSON_AGG(ty.*) as types
FROM
    pokemon p
    JOIN pokemon_type pty ON p.id = pty.pokemon_id
    JOIN type ty ON pty.type_id = ty.id
WHERE p.id = 2
GROUP BY p.id;

-- Récupérer les pokémons avec les types et les talents (jointure multiple)
--   - Exemple : `[{ id: 1, name_fr: "Bulbizarre", types: [{id: 1, name: "Plante"], talents: [{id: 1, name: "Engrais"}]}, ...]`
SELECT
    p.*,
    JSON_AGG(ty.*) as types
FROM
    pokemon p
    JOIN pokemon_type pty ON p.id = pty.pokemon_id
    JOIN type ty ON pty.type_id = ty.id
GROUP BY p.id;
