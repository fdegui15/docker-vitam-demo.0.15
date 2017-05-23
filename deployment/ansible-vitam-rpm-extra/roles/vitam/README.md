Role Name
=========

Ce rôle a pour but de regrouper les templates de fichiers communs à tous les rôles

Requirements
------------

Ce rôle ne doit pas être appelé directement mais pour être appelé via un include ../../common (donc sans gérer les handlers, vars et defaults)

Variables
---------

Les variables attendues pour ce rôle sont : 
* Variables obligatoires 

  + {{ vitam_component }} : nom du composant à installer

* Variables optionnelles : permet de surcharger une valeur par défaut (valeur par défaut) 
  + {{ vitam_user }} : propriétaire unix des fichiers déployés (valeur par défaut : vitam)
  + {{ vitam_group }} : groupe unix des fichiers déployés (valeur par défaut : vitam)
  + {{ package_name }} : nom du fichier rpm à déployer (valeur par défaut : vitam-{{ vitam_component }})
  + {{ memory_opts }} : paramétres mémoire de la JVM (valeur par défaut : -Xms512m -Xmx512m) 
  + {{ gc_opts }} : paramétrage du garbage collector (valeur par défaut : "" ) 
  + {{ java_opts }} : autres variables à passer à la JVM (valeur par défaut : "")
  + {{ java_args }} : arguments à passer à la JVM (valeur par défaut : "")
  + {{ port_http }} : port d'écoute du service vitam (valeur par défaut : 8082)
  + {{ tls_active }} : activation du https
  + {{ days_to_delete_local }} : nombre de jours par défaut pour le job Curator de purge des vieux index
  + {{ days_to_delete_access_local }} :
  + {{ vitam_worker_capacity }} : nombre de parallélisme des threads du composant vitam-worker
  + {{ vitam_provider_offer }}: type de fournisseur pour l'offre de stockage par défaut (filesystem/openstack-swift)
  + {{ vitam_keystone_auth_url }} : URL de connexion à la gateway CEPH si {{ vitam_provider_offer }} est openstack-swift
  + {{ vitam_swift_uid }} : utilisateur swift
  + {{ vitam_swift_subuser }} : sous-utilisateur swift
  + {{ vitam_keystone_passwd }} : mot de passe associé
  + {{ vitam_ceph_mode }} : booléen
  + {{ vitam_site_id }} : identifiant du site associé à l'installation


Dependencies
------------

Pas de dépendances


License
-------

Cecill 2.1

Auteur
-------

Projet VITAM
