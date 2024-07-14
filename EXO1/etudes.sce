
// Chemin vers le fichier CSV
path = '~/SAE_MATHS_23/data.csv';

// Lire le fichier CSV
data = read_csv(path, ',');

// Extraire les colonnes pertinentes
levels = data(:, 4);
ages = strtod(data(:, 2)); // Convertir les âges en nombres
salaries = strtod(data(:, 7)); // Convertir les salaires en nombres
experiences = strtod(data(:, 6)); // Convertir les expériences en nombres


// Identifier les différents niveaux d'études
unique_levels = unique(levels);

// Initialiser les matrices pour stocker les moyennes
avg_salaries = [];
avg_ages = [];
avg_experiences = [];

// Calculer les moyennes pour chaque niveau d'études
for i = 1:size(unique_levels, '*')
    level = unique_levels(i);
    indices = find(levels == level);
    
    avg_salaries(i) = mean(salaries(indices));
    avg_ages(i) = mean(ages(indices));
    avg_experiences(i) = mean(experiences(indices));
end

// Afficher les résultats
for i = 1:size(unique_levels, '*')
    level = unique_levels(i);
    if level <> '' then // Ignorer la ligne sans valeur de niveau d'études
        disp("Niveau d études : " + string(level));
        disp("Salaire moyen : " + string(avg_salaries(i)));
        disp("Âge moyen : " + string(avg_ages(i)));
        disp("Expérience moyenne : " + string(avg_experiences(i)));
        disp(" ");
    end
end
