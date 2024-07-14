path = '~/SAE_MATHS_23/data.csv';
data = csvRead(path, ',', 'double'); 
salaries = data(:, 7);

min_salary = min(salaries); // Minimum
max_salary = max(salaries); // Maximum
mean_salary = mean(salaries); // Moyenne
median_salary = median(salaries); // Médiane

// Calcul du mode
unique_salaries = unique(salaries, "r");
count_salaries = zeros(unique_salaries);

for i = 1:size(unique_salaries, "r")
    count_salaries(i) = sum(salaries == unique_salaries(i));
end

[max_count, index] = max(count_salaries);
mode_salary = unique_salaries(index);

// Écart type
std_dev_salary = stdev(salaries);

// Calcul des quartiles
sorted_salaries = gsort(salaries, 'g', 'i'); // Tri croissant des salaires
n = size(sorted_salaries, 'r');
q1 = sorted_salaries(round(0.25 * n));
q2 = median_salary; // Médiane est également le deuxième quartile
q3 = sorted_salaries(round(0.75 * n));
iqr_salary = q3 - q1; // Écart interquartile

// Affichage des résultats
disp("Statistiques descriptives des salaires :");
disp("Minimum : " + string(min_salary));
disp("Maximum : " + string(max_salary));
disp("Moyenne : " + string(mean_salary));
disp("Médiane : " + string(median_salary));
disp("Mode : " + string(mode_salary));
disp("Écart type : " + string(std_dev_salary));
disp("Premier quartile (Q1) : " + string(q1));
disp("Médiane (Q2) : " + string(q2));
disp("Troisième quartile (Q3) : " + string(q3));
disp("Écart interquartile (IQR) : " + string(iqr_salary));
