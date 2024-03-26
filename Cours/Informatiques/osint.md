# Open Source

## Introduction

### Securiter

#### Essentials

##### OSI

1. **Physical** : Les câbles utiliser pour connecter pour qu'ils puissent transmettre un signal
2. **Data Link** : Les frames possèdent les adresses qui vont identifier une machine à l'intérieur du réseau
3. **Network** : envoyer un message en dehors du réseau local
4. **Transport** : fiabilité de transmission et contrôle de flux des datas
7. **Application** : protocoles nécessaire pour permettre à un utilisateur d'accéder à des informations d'un réseau

✔ ASTUCE : penser à vous rappeler à ce qu'il se passe sur telle ou telle couche.
Cela va vous permettre de vous souvenir quel outil ou protocole la question demande.
Please Do Not Throw Sausage Pizza Away →P.D.N.T.S.P.A → Physical, Data Link, Network, Transport, Session, Presentation, Application

##### TCP/IP

Permet à un hôte d'un réseau de communiquer avec un autre hôte
Différents protocoles utilisés, arrangés en couches
[Three-way handshake de TCP :](https://www.youtube.com/watch?v=26jazyc7VNk&ab_channel=Cookieconnect%C3%A9)
1. ma machine souhaite ***établir*** une connexion avec un serveur, ainsi elle va envoyer le premier paquet : **SYN**
2. le serveur va ***répondre*** à ma machine avec un paquet **SYN-ACK**
3. ma machine va ensuite envoyer un autre paquet afin de ***confirmer*** la réception du paquet précédent. Ce paquet en question est **ACK**

[ScienceDirect](https://www.sciencedirect.com/topics/computer-science/three-way-handshake)

Les 5 zones de sécurité :
- **Internet** : zone non contrôlée, présence des acteurs menaçants
- **Internet DMZ** : DMZ pour Demilitarized Zone, sous-réseau qui est isolé du réseau via un pare-feu.
- **Production Network Zone** : zone restreinte, mesures de contrôle d'accès strictes afin de prévenir le trafic non contrôlé.
- **Intranet Zone** : zone contrôlée avec plus ou moins de lourdes restrictions. Cela ne veut pas dire que dans l'Intranet tout est très ouvert. Seuls les systèmes et/ou trafic de confiance peuvent être trouvés ici.
- **Management Network Zone** : zone hautement sécurisée avec des politiques très strictes.

##### Vulnerabilities

Une vulnérabilité est une menace qui peut être exploitée par un acteur malveillant
Les vulnérabilités seront toujours présentes, cependant selon leur nature et leurs caractéristiques l'exploitation de ces dernière peut être plus ou moins compliquée
Système de score pour les vulnérabilités : Common Vulnerability Scoring System (CVSS)
Open framework qui permet de définir les caractéristiques et la sévérité d'une vulnérabilité
le CVSS consiste en 3 métriques (Base, Temporal, Environmental)

- **Misconfiguration** : mauvaise configuration d'un service/application
- **Default installation** : certaines applications/services sont mises en place avec les paramètres d'installation par défaut
- **Buffer Overflow** : faille permettant à un attaquant de prendre l'avantage sur du bad code
- **Missing patches** (unpatched servers) : quand des systèmes ne sont pas patchés, des acteurs malveillants peuvent exploiter cette vulnérabilité
- **Design flaws** : faille universelle commune à tous les OS. Exemples; chiffrement etc.
- **Operating system flaws** : failles spécifiques à un OS (Windows, Linux ...)
- **Application flaws** : faille relative à une application, notamment à son code, son fonctionnement ...
- **Open services** : services qui ne sont pas utilisés activement, mais qui sont laissés ouverts sur le système par négligence/ ignorance
- **Default passwords** : laisser un mot de passe par défaut sur un système

#### Basic

##### Compromi

[Triengle compromi](https://www.linkedin.com/pulse/20140619200426-136462609-the-more-secure-something-is-the-less-usable-and-functional-it-becomes)

##### Menace

[Threat_Model](https://www.guidanceshare.com/wiki/How_To:_Create_a_Threat_Model_for_a_Web_Application_at_Design_Time)

##### Risque

- Le risk ***management*** permet d' :
  - **Atténuer** les risques identifiés
  - **Eliminer** ces risques
  - **Accepter** les risques repérés
- Un des ***objectifs*** pour minimiser ces risques est de :
  - **Lister** les assets de l'organisation
  - **Déterminer** les menaces et les vulnérabilités liées à ces assets
- Les ***security controls*** peuvent être :
  - **Physiques** : gardes, lumières, caméras
  - **Techniques** : chiffrement, smartcards et ACL
  - **Administratifs** : formations, politiques, prise de conscience

[Source](https://sanzubusinesstraining.com/probability-impact-matrix/)

- ***Mesures*** à connaître :
  - Preventive measure : authentication
  - Detective measure : audits
  - Corrective measure : backups et restore options
- La ***gestion*** des risques peut également inclure :
  - un Business Impact Analysis (BIA)
  - un Maximum Tolerable Downtime (MTD)
  - un Business Continuity Plan (BCP)
  - un Disaster Recovery Plan (DRP)
- ***chiffrer*** pertes sur l'année :
  - Recours à l'Annualized Loss Expectancy (ALE)
  - Produit de l'Annualized Rate of Occurence (ARO) x Single Loss Expectancy (SLE) → ALE = ARO x SLE
  - déterminer le SLE Avec l'Exposure Factor (EF) x valeur du bien

##### CIA
Les 3 principaux piliers de la cybersécurité : Confidentiality, Integrity and Availability
- **Confidentiality** : préserver le secret, la protection d'une information afinde prévenir une divulgation ou l'accès par des personnes non autorisées (chiffrement, contrôles d'accès, droits et permissions sur certains fichiers/ressources, stéganographie ...)
- **Integrity** : une donnée qui n'a pas été modifiée, altérée ou révisée. Quelle soit au repos (at rest) ou en transit (in transit), la donnée reste la même. (via les hashes, signatures digitales)
- **Availability** : assurer la disponibilité et le bon fonctionnement des machines et périphériques pour entrer dans le cadre de la continuité d'une activité (redondance, sauvegardes ...)

## Annex

integrité hachage/signatur num
ing social (se faire passer pour quelqun)
    ou prise de comunication
parfau et antivirus, honnypot
outil protec web
sigle
wifi pub
consequance d'une attaque
monté en privilege/ principe de moindre privilege
type et methode d'atack

### Web

[osi théorique](https://community.fs.com/fr/blog/tcpip-vs-osi-whats-the-difference-between-the-two-models.html)
[tcp réel](https://fiberbit.com.tw/tcpip-model-vs-osi-model/)

### Remerciment

Je souhaite remerci EL ARABI Nabil profesionel de la cybersecuriter et professeur à l'IA School en 2024
