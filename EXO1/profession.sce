// Chemin vers le fichier CSV
path = '~/Scilab/data.csv';

// Lire le fichier CSV
data = read_csv(path, ',');

// Extraire les colonnes pertinentes
genders = data(:, 3);
professions = data(:, 5);

// Séparer les données par genre
male_professions = professions(genders == 'Male');
female_professions = professions(genders == 'Female');

// Trouver la profession la plus fréquente pour les hommes
unique_male_professions = unique(male_professions);
male_counts = [];
for i = 1:size(unique_male_professions, '*')
    male_counts(i) = sum(male_professions == unique_male_professions(i));
end
[max_male_count, max_male_index] = max(male_counts);
most_frequent_male_profession = unique_male_professions(max_male_index);

// Trouver la profession la plus fréquente pour les femmes
unique_female_professions = unique(female_professions);
female_counts = [];
for i = 1:size(unique_female_professions, '*')
    female_counts(i) = sum(female_professions == unique_female_professions(i));
end
[max_female_count, max_female_index] = max(female_counts);
most_frequent_female_profession = unique_female_professions(max_female_index);

// Afficher les résultats
disp("La profession la plus fréquente des hommes est : " + most_frequent_male_profession);
disp("La profession la plus fréquente des femmes est : " + most_frequent_female_profession);
