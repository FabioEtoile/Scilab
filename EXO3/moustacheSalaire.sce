path = '~/Scilab/data.csv';
data = csvRead(path, ',', 'double'); 

// Extraire la colonne des salaires qui est la septieme colonne
salaries = data(:, 7);

// Tracer la boîte à moustaches pour les salaires
scf(); 
boxplot(salaries); 

// Titre
xtitle("Boîte à moustaches pour les salaires");

// Exporter le diagramme en format PNG
filename = 'moustacheSalaire.png';
xs2png(gcf(), filename);
