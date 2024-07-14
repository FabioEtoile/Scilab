path = '~/Scilab/data.csv';
data = csvRead(path, ',', 'double');

// Extraire la colonne des années d'expérience qui est la sixième colonne
experience = data(:, 6);

// Tracer la boîte à moustaches pour les années d'expérience
scf();  
boxplot(experience);  

// Titre
xtitle("Boîte à moustaches pour les années d`expérience");

// Exporter le diagramme en format PNG
filename = 'moustacheExperience.png';
xs2png(gcf(), filename);  // Exporte la figure en PNG
