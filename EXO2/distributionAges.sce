path = '~/Scilab/data.csv';

// Lire le fichier CSV
data = csvRead(path, ',', 'double'); 

// Extraire la colonne des âges qui est la deuxième colonne
ages = data(:, 2);

// Histogramme des âges
scf(); 
histplot(20, ages);

// Ajouter un titre et des étiquettes aux axes
xtitle('Histogramme de la distribution des âges', 'Âge', 'Nombre de personnes');

// Exporter le diagramme en format PNG
filename = 'distributionAges.png'; 
xs2png(gcf(), filename);
