// Chemin vers le fichier CSV
path = '~/Scilab/data.csv';

// Lire le fichier CSV
data = read_csv(path, ',');

// Extraire les colonnes pertinentes
genres = data(:, 3); // Colonne des genres
ages = strtod(data(:, 2)); // Convertir les âges en nombres
salaries = strtod(data(:, 7)); // Convertir les salaires en nombres
experiences = strtod(data(:, 6)); // Convertir les expériences en nombres

// Initialiser les matrices pour stocker les moyennes
avg_salaries_men = 0;
avg_ages_men = 0;
avg_experiences_men = 0;

avg_salaries_women = 0;
avg_ages_women = 0;
avg_experiences_women = 0;

count_men = 0;
count_women = 0;

// Calculer les moyennes pour chaque genre
for i = 1:size(genres, '*')
    if genres(i) == "Male" then
        avg_salaries_men = avg_salaries_men + salaries(i);
        avg_ages_men = avg_ages_men + ages(i);
        avg_experiences_men = avg_experiences_men + experiences(i);
        count_men = count_men + 1;
    elseif genres(i) == "Female" then
        avg_salaries_women = avg_salaries_women + salaries(i);
        avg_ages_women = avg_ages_women + ages(i);
        avg_experiences_women = avg_experiences_women + experiences(i);
        count_women = count_women + 1;
    end
end

// Calculer les moyennes finales
avg_salaries_men = avg_salaries_men / count_men;
avg_ages_men = avg_ages_men / count_men;
avg_experiences_men = avg_experiences_men / count_men;

avg_salaries_women = avg_salaries_women / count_women;
avg_ages_women = avg_ages_women / count_women;
avg_experiences_women = avg_experiences_women / count_women;

// Afficher les résultats
disp("Genre : Male");
disp("Salaire moyen : " + string(avg_salaries_men));
disp("Âge moyen : " + string(avg_ages_men));
disp("Expérience moyenne : " + string(avg_experiences_men));
disp(" ");

disp("Genre : Female");
disp("Salaire moyen : " + string(avg_salaries_women));
disp("Âge moyen : " + string(avg_ages_women));
disp("Expérience moyenne : " + string(avg_experiences_women));
disp(" ");
