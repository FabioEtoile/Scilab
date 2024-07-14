// Lire le fichier CSV
data = read_csv('~/SAE_MATHS_23/data.csv', ',');

// Extraire les colonnes nécessaires
salaire = evstr(data(:, 7));
genre = data(:, 3);

// Définir les genres uniques
unique_genres = ['Male'; 'Female'; 'Other'];

// Initialiser les tableaux pour les statistiques
minsalaire = zeros(1, size(unique_genres, 1));
maxsalaire = zeros(1, size(unique_genres, 1));
moysalaire = zeros(1, size(unique_genres, 1));
medsalaire = zeros(1, size(unique_genres, 1));
intersalaire = zeros(1, size(unique_genres, 1));
quartsalaire = zeros(size(unique_genres, 1), 3); // Pour les quartiles (Q1, Q2, Q3)
ecarttypesalaire = zeros(1, size(unique_genres, 1));

// Fonction pour calculer les quartiles
function q = quartiles(x)
    x = gsort(x, 'g', 'i');
    n = length(x);
    q1 = x(floor(0.25 * (n + 1)));
    q2 = median(x);
    q3 = x(floor(0.75 * (n + 1)));
    q = [q1, q2, q3];
endfunction

// Calculer les statistiques pour chaque genre
for i = 1:size(unique_genres, 1)
    genre_salaire = salaire(find(strcmp(genre, unique_genres(i, :))));
    
    minsalaire(i) = min(genre_salaire);
    maxsalaire(i) = max(genre_salaire);
    moysalaire(i) = mean(genre_salaire);
    medsalaire(i) = median(genre_salaire);
    intersalaire(i) = iqr(genre_salaire);
    quartsalaire(i, :) = quartiles(genre_salaire);
    ecarttypesalaire(i) = stdev(genre_salaire);
    
    // Créer le diagramme boîte à moustaches pour chaque genre
    scf();
    boxplot(genre_salaire);
    xtitle("Boîte à moustaches des salaires des " + string(unique_genres(i, :)), "Salaire", "Valeur");
    
    // Exporter chaque diagramme en PNG
    filename = 'boiteMoustache_' + string(unique_genres(i, :)) + '.png';
    xs2png(gcf(), filename);
end

// Afficher les statistiques calculées
disp("Min Salaires: " + string(minsalaire));
disp("Max Salaires: " + string(maxsalaire));
disp("Moyenne Salaires: " + string(moysalaire));
disp("Médiane Salaires: " + string(medsalaire));
disp("Intervalle Interquartile: " + string(intersalaire));
disp("Écart-type Salaires: " + string(ecarttypesalaire));
