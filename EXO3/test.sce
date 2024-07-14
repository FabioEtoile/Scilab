// Charger le module stixbox
atomsLoad('stixbox');

// Exemple de données de salaires (à remplacer par vos propres données)
salaires_male = [50000, 60000, 70000, 80000, 90000];
salaires_female = [45000, 55000, 65000, 75000, 85000];

// Créer une figure pour la boîte à moustaches
scf();

// Tracer la boîte à moustaches pour les salaires masculins et féminins
stixbox(salaires_male, salaires_female, 'Salaires Masculins', 'Salaires Féminins', 'Salaires');
