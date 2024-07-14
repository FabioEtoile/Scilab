// Chemin vers le fichier CSV
chemin = '~/SAE_MATHS_23/data.csv';

// Lire le fichier CSV
donnees = read_csv(chemin, ',');

// Extraire les colonnes des genres et des niveaux d'éducation
genres = donnees(:, 3);
expérience = donnees(:, 6);
salaire = donnees(:, 7);

//Conversion
expérience = evstr(expérience);
salaire = evstr(salaire);

indice_homme = find(genres == 'Male');
expérience_homme = expérience(indice_homme);
salaire_homme = salaire(indice_homme);

// Tracer le nuage de points
scf(); // Ouvre une nouvelle fenêtre graphique
plot(expérience_homme, salaire_homme, 'bo'); // Trace des points en bleu
xtitle('Nuage de points expérience vs salaire pour les Hommes', 'Expérience (années)', 'Salaire');

// Calculer la droite de régression avec polyfit
degree = 1; // Degré de la régression linéaire
coefficients = polyfit(expérience_homme, salaire_homme, degree); // Calcul des coefficients de la régression linéaire
a = coefficients(1); // Pente
b = coefficients(2); // Intercept

// Tracer la droite de régression
x = linspace(min(expérience_homme), max(expérience_homme), 100); // Génère des valeurs d'expérience réparties uniformément
y = polyval(coefficients, x); // Calcule les valeurs de salaire correspondantes avec polyfit
plot(x, y, 'r'); // Trace la droite en rouge
legend(['Données', 'Régression linéaire']);

// Exporter le graphique en format PNG
filename = 'régressionSalaireExpérienceHomme.png'; 
xs2png(gcf(), filename);
