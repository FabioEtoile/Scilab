// Chemin vers le fichier CSV
chemin = '~/Scilab/data.csv';

// Lire le fichier CSV
donnees = read_csv(chemin, ',');

// Extraire les colonnes des diplômes, expérience et salaire
diplome = donnees(:, 4);
experience = donnees(:, 6);
salaire = donnees(:, 7);

// Conversion des types de données, si nécessaire
diplome = evstr(diplome);
experience = evstr(experience);
salaire = evstr(salaire);

// Fonction pour tracer et exporter les graphiques
function plotAndExport(data_index, degree_title, file_name)
    experience_level = experience(data_index);
    salaire_level = salaire(data_index);

    scf(); // Ouvre une nouvelle fenêtre graphique
    plot(experience_level, salaire_level, 'bo'); // Trace des points en bleu
    xtitle(['Nuage de points expérience vs salaire pour les ', degree_title], 'Expérience (années)', 'Salaire');

    // Régression linéaire
    degree = 1; // Degré de la régression linéaire
    coefficients = polyfit(experience_level, salaire_level, degree);
    x = linspace(min(experience_level), max(experience_level), 100);
    y = polyval(coefficients, x);
    plot(x, y, 'r'); // Trace la droite en rouge
    legend(['Données', 'Régression linéaire']);

    // Exporter le graphique
    xs2png(gcf(), file_name);
endfunction

// Indices pour chaque niveau de diplôme
indice_phd = find(diplome == 3);
indice_master = find(diplome == 2);
indice_bachelor = find(diplome == 1);
indice_highschool = find(diplome == 0);

// Appels de fonction pour chaque niveau de diplôme
plotAndExport(indice_phd, 'PhD', 'régressionSalaireExpériencePhd.png');
plotAndExport(indice_master, 'Master', 'régressionSalaireExpérienceMaster.png');
plotAndExport(indice_bachelor, 'Bachelor', 'régressionSalaireExpérienceBachelor.png');
plotAndExport(indice_highschool, 'High School', 'régressionSalaireExpérienceHighschool.png');