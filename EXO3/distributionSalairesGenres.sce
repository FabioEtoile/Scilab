// Lire le fichier CSV
data = csvRead('~/SAE_MATHS_23/data.csv', ',', '.', 'string');

// Extraire les colonnes nécessaires
salaire = evstr(data(:, 7));
genre = data(:, 3);

// Définir les genres uniques
unique_genres = ['Male'; 'Female'; 'Other'];

// Extraire les salaires pour chaque genre
salaire_hommes = salaire(find(genre == unique_genres(1, 1)));
salaire_femmes = salaire(find(genre == unique_genres(2, 1)));
salaire_other = salaire(find(genre == unique_genres(3, 1)));

// Créer les histogrammes pour chaque genre
scf();

subplot(3, 1, 1);
histplot(10, salaire_hommes, style=2);
xtitle('Distribution des salaires pour les hommes', 'Salaire', 'Effectif');

subplot(3, 1, 2);
histplot(10, salaire_femmes, style=5);
xtitle('Distribution des salaires pour les femmes', 'Salaire', 'Effectif');

subplot(3, 1, 3);
histplot(10, salaire_other);
xtitle('Distribution des salaires pour les autres', 'Salaire', 'Effectif');

// Exporter le graphique en PNG
filename = 'distribution_salaires_genres.png';
xs2png(gcf(), filename);
