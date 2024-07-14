path = '~/SAE_MATHS_23/data.csv';

// Lire le fichier CSV
data = read_csv(path, ',');

// Extraire la troisième colonne
column = data(:, 3);

// Compter les occurrences
male_count = sum(column == 'Male');
female_count = sum(column == 'Female');
other_count = sum(column == 'Other');
gender_data = [male_count, female_count, other_count];

// Créer le diagramme camembert
scf();
pie(gender_data); // Crée le diagramme camembert

// Ajouter des étiquettes au diagramme camembert
labels = ['Male', 'Female', 'Other'];
pie(gender_data, labels);

// Titre
xtitle('Répartition par genre');

// Exporter le diagramme en PNG
filename = 'camembertGenre.png';
xs2png(gcf(), filename);
