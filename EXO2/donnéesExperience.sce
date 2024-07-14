path = '~/Scilab/data.csv';
data = csvRead(path, ',', 'double'); // Assurez-vous que les données sont lues comme des nombres réels

// Extraire la colonne des années d'expérience qui est la sixième colonne
experience = data(:, 6);

// Calculer les mesures statistiques de base pour l'expérience
min_exp = min(experience); // Minimum
max_exp = max(experience); // Maximum
mean_exp = mean(experience); // Moyenne
median_exp = median(experience); // Médiane

// Calcul du mode pour l'expérience
unique_exp = unique(experience, "r");
count_exp = zeros(unique_exp);

for i = 1:size(unique_exp, "r")
    count_exp(i) = sum(experience == unique_exp(i));
end

[max_count, index] = max(count_exp);
mode_exp = unique_exp(index);

// Écart type
std_dev_exp = stdev(experience);

// Calcul des quartiles pour l'expérience
sorted_exp = gsort(experience, 'g', 'i'); // Tri croissant des années d'expérience
n = size(sorted_exp, 'r');
q1_exp = sorted_exp(round(0.25 * n));
q2_exp = median_exp; // Médiane est également le deuxième quartile
q3_exp = sorted_exp(round(0.75 * n));
iqr_exp = q3_exp - q1_exp; // Écart interquartile

// Affichage des résultats
disp("Statistiques descriptives des années d`expérience :");
disp("Minimum : " + string(min_exp));
disp("Maximum : " + string(max_exp));
disp("Moyenne : " + string(mean_exp));
disp("Médiane : " + string(median_exp));
disp("Mode : " + string(mode_exp));
disp("Écart type : " + string(std_dev_exp));
disp("Premier quartile (Q1) : " + string(q1_exp));
disp("Médiane (Q2) : " + string(q2_exp));
disp("Troisième quartile (Q3) : " + string(q3_exp));
disp("Écart interquartile (IQR) : " + string(iqr_exp));
