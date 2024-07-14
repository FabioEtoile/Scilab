// Chemin vers le fichier CSV
chemin = '~/SAE_MATHS_23/data.csv';

// Lire le fichier CSV
donnees = read_csv(chemin, ',');

// Extraire les colonnes des genres, expérience et salaire
genres = donnees(:, 3);
experience = donnees(:, 6);
salaire = donnees(:, 7);

// Conversion des données numériques
experience = evstr(experience);
salaire = evstr(salaire);

// Fonction pour analyser et tracer les données pour un genre spécifié
function analyseGenre(genre_label, couleur_point, nom_fichier)
    // Trouver les indices pour le genre spécifié
    indices = find(genres == genre_label);
    experience_genre = experience(indices);
    salaire_genre = salaire(indices);

    // Tracer le nuage de points
    scf(); // Ouvre une nouvelle fenêtre graphique
    plot(experience_genre, salaire_genre, couleur_point); // Trace des points
    xtitle(['Nuage de points expérience vs salaire pour ', genre_label], 'Expérience (années)', 'Salaire');

    // Calculer et tracer la droite de régression
    coefficients = polyfit(experience_genre, salaire_genre, 1); // Régression linéaire
    a = coefficients(1); // Pente
    b = coefficients(2); // Intercept
    x = linspace(min(experience_genre), max(experience_genre), 100);
    y = polyval(coefficients, x);
    plot(x, y, 'r'); // Trace la droite en rouge
    legend(['Données', 'Régression linéaire']);

    // Exporter le graphique en format PNG
    xs2png(gcf(), nom_fichier);
endfunction

// Appel de la fonction pour les hommes
analyseGenre('Male', 'bo', 'régressionSalaireExpérienceHomme.png');

// Appel de la fonction pour les femmes
analyseGenre('Female', 'bo', 'régressionSalaireExpérienceFemme.png');
