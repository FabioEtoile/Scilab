// Chemin vers le fichier CSV
chemin = '~/SAE_MATHS_23/data.csv';

// Lire le fichier CSV
donnees = read_csv(chemin, ',');

// Extraire les colonnes des genres et des niveaux d'éducation
genres = donnees(:, 3);
niveaux = donnees(:, 4);

// Compter les occurrences pour chaque combinaison genre/niveau d'éducation
male_highschool = length(find(genres == "Male" & niveaux == "0"));
male_bachelor = length(find(genres == "Male" & niveaux == "1"));
male_master = length(find(genres == "Male" & niveaux == "2"));
male_phd = length(find(genres == "Male" & niveaux == "3"));

female_highschool = length(find(genres == "Female" & niveaux == "0"));
female_bachelor = length(find(genres == "Female" & niveaux == "1"));
female_master = length(find(genres == "Female" & niveaux == "2"));
female_phd = length(find(genres == "Female" & niveaux == "3"));

other_highschool = length(find(genres == "Other" & niveaux == "0"));
other_bachelor = length(find(genres == "Other" & niveaux == "1"));
other_master = length(find(genres == "Other" & niveaux == "2"));
other_phd = length(find(genres == "Other" & niveaux == "3"));

// Regrouper les données
donnees_groupées = [male_highschool, female_highschool, other_highschool; 
                    male_bachelor, female_bachelor, other_bachelor; 
                    male_master, female_master, other_master; 
                    male_phd, female_phd, other_phd];

// Créer l'histogramme
scf();
indices_niveaux = 1:4; // Indices pour les niveaux d'éducation
bar(indices_niveaux, donnees_groupées);

// Ajouter une légende
legend(['Male', 'Female', 'Other']);

// Ajouter un titre et des étiquettes pour les axes
xtitle('Répartition des niveaux d études suivant le genre', 'Niveaux d études', 'Effectif');

// Définir les étiquettes des x-axis manuellement
etiquettes_niveaux = ['High School', 'Bachelor', 'Master', 'PhD'];
xticks(indices_niveaux, etiquettes_niveaux);



