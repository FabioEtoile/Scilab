// Chemin vers le fichier CSV
chemin = '~/Scilab/data.csv';


// Lire le fichier CSV
donnees = read_csv(chemin, ',');

// Extraire la colonne des métiers
metiers = donnees(:, 5);

// Compter les occurrences de chaque métier
occurrences_metiers = tabul(metiers, 'i');
noms_metiers = occurrences_metiers(1);
effectifs_metiers = occurrences_metiers(2);

// Trier les métiers par nombre d'occurrences décroissant
[effets_tries, indices_tries] = gsort(effectifs_metiers, 'g', 'd');
top10_metiers = noms_metiers(indices_tries(1:10));
effectifs_top10 = effets_tries(1:10);

// Créer l'histogramme des top 10 métiers
scf();
indices_top10 = 1:10;
bar(indices_top10, effectifs_top10);

// Ajouter une légende et un titre
legend(['Top 10 Métiers']);
xtitle('Top 10 des métiers avec le plus d''effectifs', 'Métiers', 'Effectif');

// Annoter les noms des métiers sur l'axe des x
xstring(indices_top10, effectifs_top10, top10_metiers);
