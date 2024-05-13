# Rails Rent Cars


## Base de données

<img src="https://raw.githubusercontent.com/lewagon/fullstack-images/master/assess/rent_car_db_schema.png" alt="DB schema">

Une voiture n'est pas valide :

- Si elle n'a pas de marque.
- Si elle n'a pas de modèle.
- Si elle n'a pas d'adresse.
- Si son prix journalier est inférieur ou égal à zéro.

Une réservation n'est pas valide :

- Si elle n'a pas de date de début.
- Si elle n'a pas de date de fin.

La suppression d'un utilisateur doit entraîner la suppression de ses voitures et de ses réservations. La suppression d'une voiture doit entraîner la suppression de ses réservations.

## Interface utilisateur

- En tant qu'utilisateur, je peux accéder à la page d'accueil.
- En tant qu'utilisateur, je peux voir la liste de toutes les voitures.
- En tant qu'utilisateur, je peux accéder aux détails d'une voiture.
- En tant qu'utilisateur, je peux réserver une voiture.

## Home page
![Home page](app/assets/images/home.png)
## Car list
![Home page](app/assets/images/Car_list.png)
## Booking a Car
![Home page](app/assets/images/Car_booking.png)
## Booking
![Home page](app/assets/images/booking_list.png)
