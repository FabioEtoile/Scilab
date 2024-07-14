path = '~/Scilab/data.csv';
data = csvRead(path, ',', 'double'); // Assurez-vous que les données sont lues comme des nombres réels

// Extraire la colonne des âges qui est la deuxième colonne
ages = data(:, 2);

// Tracer la boîte à moustaches pour les âges
scf(); 
boxplot(ages); 

// Titre
xtitle("Boîte à moustaches pour les âges");

// Exporter le diagramme en format PNG
filename = 'moustacheAge.png';
xs2png(gcf(), filename);
