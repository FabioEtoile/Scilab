path = '~/SAE_MATHS_23/data.csv';
data = csvRead(path, ',', 'double'); // Assurez-vous que les données sont lues comme des nombres réels

// Extraire la colonne des âges qui est la deuxième colonne
ages = data(:, 2);

// Calculer les mesures statistiques de base
min_age = min(ages); // Minimum
max_age = max(ages); // Maximum
mean_age = mean(ages); // Moyenne
median_age = median(ages); // Médiane

// Calcul du mode
unique_ages = unique(ages, "r");
count_ages = zeros(unique_ages);

for i = 1:size(unique_ages, "r")
    count_ages(i) = sum(ages == unique_ages(i));
end

[max_count, index] = max(count_ages);
mode_age = unique_ages(index);

// Écart type
std_dev_age = stdev(ages);

// Calcul des quartiles
sorted_ages = gsort(ages, 'g', 'i'); // Tri croissant des âges
n = size(sorted_ages, 'r');
q1 = sorted_ages(round(0.25 * n));
q2 = median_age; // Médiane est également le deuxième quartile
q3 = sorted_ages(round(0.75 * n));
iqr_age = q3 - q1; // Écart interquartile

// Affichage des résultats
disp("Statistiques descriptives de l`âge :");
disp("Minimum : " + string(min_age));
disp("Maximum : " + string(max_age));
disp("Moyenne : " + string(mean_age));
disp("Médiane : " + string(median_age));
disp("Mode : " + string(mode_age));
disp("Écart type : " + string(std_dev_age));
disp("Premier quartile (Q1) : " + string(q1));
disp("Médiane (Q2) : " + string(q2));
disp("Troisième quartile (Q3) : " + string(q3));
disp("Écart interquartile (IQR) : " + string(iqr_age));
