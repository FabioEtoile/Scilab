// Chemin vers le fichier CSV
path = '~/SAE_MATHS_23/data.csv';

data = csvRead(path, ',', 'double'); // Lire les données en tant que doubles

// Extraire la colonne de l'expérience (sixième colonne)
experience = data(:, 6);
scf(); 
histplot(10, experience); 

// Titre et étiquettes
xtitle('Histogramme de la distribution de l’expérience', 'Années d’expérience', 'Nombre de personnes');

// Exporter l'histogramme en PNG
filename = 'distributionExperience.png';
xs2png(gcf(), filename);

