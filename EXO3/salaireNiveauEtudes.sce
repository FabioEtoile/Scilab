// Lire le fichier CSV
data = read_csv( '~/Scilab/data.csv', ',');

// Extraire les colonnes nécessaires
salaire = evstr(data(:, 7));
niveauxEtudes = data(:, 4);

// Définir les niveaux d'études uniques
unique_etude = [0, 1, 2, 3];

// Calculer les salaires moyens pour chaque niveau d''études
salaire0 = mean(salaire(find(niveauxEtudes == string(unique_etude(1, 1)))));
salaire1 = mean(salaire(find(niveauxEtudes == string(unique_etude(1, 2)))));
salaire2 = mean(salaire(find(niveauxEtudes == string(unique_etude(1, 3)))));
salaire3 = mean(salaire(find(niveauxEtudes == string(unique_etude(1, 4)))));

salaires = [salaire0; salaire1; salaire2; salaire3];

// Créer le diagramme à barres
scf();
bar(unique_etude, salaires);

// Titre et étiquettes des axes
xtitle("Salaires moyens suivants le niveau d''études", "Niveau d''études", "Salaire moyen");

// Exporter le diagramme en PNG
filename = 'salaireNiveauEtudes.png';
xs2png(gcf(), filename);
