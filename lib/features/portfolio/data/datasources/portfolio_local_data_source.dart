import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/repositories/portfolio_repository.dart';

class PortfolioLocalDataSource implements PortfolioRepository {
  @override
  Future<List<Experience>> getExperiences({required String languageCode}) async {
    if (languageCode == 'fr') {
      return [
        const Experience(
          company: 'Desjardins',
          role: 'Développeur Android Senior',
          period: '2023 – 2025',
          imageUrl: 'assets/images/experiences/desjardins/desjardins.png',
          description: [
            'Travaillé sur les applications mobiles AccèsD et Caisse Scolaire.',
            'Livraison de nouvelles fonctionnalités de sécurité et de prévention de la fraude pour des millions d\'utilisateurs.',
            'Amélioration du flux d\'authentification biométrique et du pipeline de notifications sécurisées.',
            'Conception et développement du nouveau module Rêves pour la Caisse Scolaire.',
            'Stack: Kotlin, Jetpack Compose, XML, SwiftUI, MVVM, Jira, Firebase, GitLab, Azure.',
          ],
          galleryImages: [
            'assets/images/experiences/desjardins/desjardins_1.png',
            'assets/images/experiences/desjardins/desjardins_2.png',
            'assets/images/experiences/desjardins/desjardins_3.png',
            'assets/images/experiences/desjardins/desjardins_4.png',
            'assets/images/experiences/desjardins/desjardins_5.png',
            'assets/images/experiences/desjardins/desjardins_6.png',
            'assets/images/experiences/desjardins/desjardins_7.png',
            'assets/images/experiences/desjardins/desjardins_8.png',
          ],
        ),
        const Experience(
          company: 'Groupe3MC',
          role: 'Lead Développeur Flutter',
          period: '2022 – 2023',
          imageUrl: 'assets/images/experiences/groupe3mc/groupe3mc.png',
          description: [
            'Lead technique pour une plateforme mobile de services aux consommateurs.',
            'Conception de l\'architecture de l\'application et de l\'infrastructure multi-environnements (dev/staging/prod).',
            'Mise en place du CI/CD avec Fastlane et GitHub Actions.',
            'Mentorat des développeurs juniors (Flutter, BloC, Clean Architecture).',
            'Intégration de la reconnaissance d\'image Google Vision.',
            'Automatisation des flux de traduction avec des scripts Python personnalisés.',
            'Stack: Flutter, BloC, GetIt, Firebase, GitHub, Fastlane.',
          ],
          galleryImages: [
            'assets/images/experiences/groupe3mc/groupe3mc_1.png',
            'assets/images/experiences/groupe3mc/groupe3mc_2.png',
            'assets/images/experiences/groupe3mc/groupe3mc_3.png',
            'assets/images/experiences/groupe3mc/groupe3mc_4.png',
          ],
        ),
        const Experience(
          company: 'TotalEnergies',
          role: 'Développeur iOS & Android',
          period: '2020 – 2021',
          imageUrl: 'assets/images/experiences/totalenergies/totalenergies.png',
          description: [
            'Travaillé sur l\'application mobile de gestion de flotte MyCard.',
            'Ajout des fonctionnalités de recharge VE à l\'application de gestion de flotte MyCard.',
            'Refonte UI/UX et intégration de Kotlin Multiplatform (KMM).',
            'Contribution à la logique backend en utilisant Kotlin Multiplatform.',
            'Travail en Agile SAFe avec pair programming et revues de code.',
            'Stack: Kotlin, Swift, KMM, MVVM, Firebase, Jetpack Compose.',
          ],
          galleryImages: [
            'assets/images/experiences/totalenergies/totalenergies_1.png',
            'assets/images/experiences/totalenergies/totalenergies_2.png',
            'assets/images/experiences/totalenergies/totalenergies_3.png',
            'assets/images/experiences/totalenergies/totalenergies_4.png',
          ],
        ),
        const Experience(
          company: 'Nomad Education',
          role: 'Développeur iOS & Android',
          period: '2019 – 2020',
          imageUrl: 'assets/images/experiences/nomad_education/nomad_education.png',
          description: [
            'Travaillé sur l\'application mobile éducative n°1 en France.',
            'Développement de fonctionnalités de recommandation de contenu basées sur l\'IA.',
            'Implémentation de modules vidéo, profils parents et composants d\'apprentissage social.',
            'Maintenance du CI/CD avec Fastlane et garantie de la compatibilité backend.',
            'Lead sur les tests, le débogage et les revues de code collaboratives.',
            'Stack: Kotlin, Java, Swift, Firebase, MVC, MVP.',
          ],
          galleryImages: [
            'assets/images/experiences/nomad_education/nomad_education_1.png',
            'assets/images/experiences/nomad_education/nomad_education_2.png',
            'assets/images/experiences/nomad_education/nomad_education_3.png',
            'assets/images/experiences/nomad_education/nomad_education_4.png',
          ],
        ),
        const Experience(
          company: 'SpotMyCity',
          role: 'Développeur iOS & Android',
          period: '2017 – 2019',
          imageUrl: 'assets/images/experiences/spotmycity/spotmycity.png',
          description: [
            'Travaillé sur une application mobile de réseau social.',
            'Livraison des fonctionnalités d\'authentification, chat, messagerie et avis utilisateurs.',
            'Intégration de la géolocalisation, APIs NodeJS et stockage MongoDB.',
            'Déploiement des versions bêta via Firebase et TestFlight.',
            'Stack: Java, Kotlin, Swift, Objective-C, MVVM, CocoaPods.',
          ],
          galleryImages: [
            'assets/images/experiences/spotmycity/spotmycity_1.png',
            'assets/images/experiences/spotmycity/spotmycity_2.png',
            'assets/images/experiences/spotmycity/spotmycity_3.png',
            'assets/images/experiences/spotmycity/spotmycity_4.png',
          ],
        ),
      ];
    }
    // Default to English
    return [
      const Experience(
        company: 'Desjardins',
        role: 'Senior Android Developer',
        period: '2023 – 2025',
        imageUrl: 'assets/images/experiences/desjardins/desjardins.png',
        description: [
          'Worked on AccèsD and Caisse Scolaire mobile apps.',
          'Delivered new security and fraud-prevention features for millions of users.',
          'Improved biometric authentication flow and enhanced secure notification pipeline.',
          'Designed and developed the new Dreams module for Caisse Scolaire.',
          'Stack: Kotlin, Jetpack Compose, XML, SwiftUI, MVVM, Jira, Firebase, GitLab, Azure.',
        ],
        galleryImages: [
          'assets/images/experiences/desjardins/desjardins_1.png',
          'assets/images/experiences/desjardins/desjardins_2.png',
          'assets/images/experiences/desjardins/desjardins_3.png',
          'assets/images/experiences/desjardins/desjardins_4.png',
          'assets/images/experiences/desjardins/desjardins_5.png',
          'assets/images/experiences/desjardins/desjardins_6.png',
          'assets/images/experiences/desjardins/desjardins_7.png',
          'assets/images/experiences/desjardins/desjardins_8.png',
        ],
      ),
      const Experience(
        company: 'Groupe3MC',
        role: 'Lead Flutter Developer',
        period: '2022 – 2023',
        imageUrl: 'assets/images/experiences/groupe3mc/groupe3mc.png',
        description: [
          'Technical lead for a consumer services mobile platform.',
          'Designed application architecture and multi-environment infrastructure (dev/staging/prod).',
          'Implemented CI/CD with Fastlane and GitHub Actions.',
          'Mentored junior developers (Flutter, BloC, Clean Architecture).',
          'Integrated Google Vision image recognition.',
          'Automated translation workflows with custom Python scripts.',
          'Stack: Flutter, BloC, GetIt, Firebase, GitHub, Fastlane.',
        ],
        galleryImages: [
          'assets/images/experiences/groupe3mc/groupe3mc_1.png',
          'assets/images/experiences/groupe3mc/groupe3mc_2.png',
          'assets/images/experiences/groupe3mc/groupe3mc_3.png',
          'assets/images/experiences/groupe3mc/groupe3mc_4.png',
        ],
      ),
      const Experience(
        company: 'TotalEnergies',
        role: 'iOS & Android Developer',
        period: '2020 – 2021',
        imageUrl: 'assets/images/experiences/totalenergies/totalenergies.png',
        description: [
          'Worked on the MyCard fleet management mobile application.',
          'Added EV charging features to the MyCard fleet management app.',
          'Delivered UI/UX redesign and Kotlin Multiplatform (KMM) integration.',
          'Contributed to backend logic using Kotlin Multiplatform.',
          'Worked in Agile SAFe with pair programming and code reviews.',
          'Stack: Kotlin, Swift, KMM, MVVM, Firebase, Jetpack Compose.',
        ],
        galleryImages: [
          'assets/images/experiences/totalenergies/totalenergies_1.png',
          'assets/images/experiences/totalenergies/totalenergies_2.png',
          'assets/images/experiences/totalenergies/totalenergies_3.png',
          'assets/images/experiences/totalenergies/totalenergies_4.png',
        ],
      ),
      const Experience(
        company: 'Nomad Education',
        role: 'iOS & Android Developer',
        period: '2019 – 2020',
        imageUrl: 'assets/images/experiences/nomad_education/nomad_education.png',
        description: [
          'Worked on France’s #1 educational mobile application.',
          'Developed AI-powered content recommendation features.',
          'Implemented video modules, parent profiles, and social learning components.',
          'Maintained CI/CD with Fastlane and ensured backend compatibility.',
          'Led testing, debugging and collaborative code reviews.',
          'Stack: Kotlin, Java, Swift, Firebase, MVC, MVP.',
        ],
        galleryImages: [
          'assets/images/experiences/nomad_education/nomad_education_1.png',
          'assets/images/experiences/nomad_education/nomad_education_2.png',
          'assets/images/experiences/nomad_education/nomad_education_3.png',
          'assets/images/experiences/nomad_education/nomad_education_4.png',
        ],
      ),
      const Experience(
        company: 'SpotMyCity',
        role: 'iOS & Android Developer',
        period: '2017 – 2019',
        imageUrl: 'assets/images/experiences/spotmycity/spotmycity.png',
        description: [
          'Worked on a social networking mobile application.',
          'Delivered authentication, chat, messaging and user review features.',
          'Integrated geolocation, NodeJS APIs and MongoDB storage.',
          'Deployed beta versions using Firebase and TestFlight.',
          'Stack: Java, Kotlin, Swift, Objective-C, MVVM, CocoaPods.',
        ],
        galleryImages: [
          'assets/images/experiences/spotmycity/spotmycity_1.png',
          'assets/images/experiences/spotmycity/spotmycity_2.png',
          'assets/images/experiences/spotmycity/spotmycity_3.png',
          'assets/images/experiences/spotmycity/spotmycity_4.png',
        ],
      ),
    ];
  }

  @override
  Future<List<Project>> getProjects({required String languageCode}) async {
    if (languageCode == 'fr') {
      return [
        const Project(
          title: 'WAAA World',
          description:
              'Réseau social orienté voyage (disponible sur les stores). Implémentation de l\'authentification via AWS Cognito, Facebook et Google. Création des systèmes de messagerie, amis, événements et notifications. Maintenance des pipelines CI/CD pour TestFlight et Firebase.',
          technologies: ['Flutter', 'Clean Architecture', 'BloC', 'GetIt', 'AWS'],
          imageUrl: 'assets/images/projects/waaa.png',
          googlePlayLink: 'https://play.google.com/store/apps/details?id=com.waaworld.newwaaworld',
          appStoreLink: 'https://apps.apple.com/fr/app/waaaworld/id6483005465',
          role: 'Lead Mobile Developer',
          year: '2023',
          client: 'WAAA World',
          challenge: 'Créer une expérience sociale fluide pour les voyageurs combinant réseautage, gestion d\'événements et communication en temps réel sur une plateforme unique.',
          solution: 'Développement d\'une application Flutter robuste utilisant la Clean Architecture et AWS pour des services backend évolutifs, assurant haute performance et sécurité des données.',
          galleryImages: [
            'assets/images/projects/waaa.png',
            'assets/images/projects/waaa.png',
            'assets/images/projects/waaa.png',
          ],
        ),
        const Project(
          title: 'StartHome',
          description:
              'Application professionnelle pour techniciens et professionnels de l\'immobilier pour générer des rapports d\'inspection complets. Formulaires dynamiques hors ligne, checklists et capture photo haute résolution. Synchronisation temps réel avec backend Laravel PHP.',
          technologies: ['Flutter', 'RxDart', 'MVP', 'GetX', 'Laravel', 'Firebase'],
          link: null,
          imageUrl: 'assets/images/projects/starthome.png',
          googlePlayLink: 'https://play.google.com/store/apps/details?id=ca.starthome.app',
          appStoreLink: 'https://apps.apple.com/fr/app/start-home/id6741734431',
          role: 'Mobile Developer',
          year: '2024',
          client: 'StartHome',
          challenge: 'Permettre aux professionnels de l\'immobilier de générer des rapports d\'inspection complexes hors ligne tout en assurant l\'intégrité des données et la synchronisation une fois en ligne.',
          solution: 'Mise en place d\'une architecture offline-first avec stockage local et synchronisation en arrière-plan, couplée à un moteur de formulaires dynamiques.',
          galleryImages: [
            'assets/images/projects/starthome.png',
            'assets/images/projects/starthome.png',
            'assets/images/projects/starthome.png',
          ],
        ),
        const Project(
          title: 'Hoopers',
          description:
              'Plateforme mobile pour cartographier les terrains de basket dans les grandes villes et organiser des tournois communautaires. Conception des flux utilisateurs pour la découverte de terrains, planification de matchs et organisation d\'événements. Intégration des services de localisation et UI basée sur des cartes.',
          technologies: ['Flutter', 'BloC', 'GetIt', 'Firebase'],
          imageUrl: 'assets/images/projects/hoopers.png',
          role: 'Mobile Developer',
          year: '2022',
          client: 'Personal Project',
          challenge: 'Aider les joueurs de basket à trouver des terrains et organiser des matchs dans un environnement urbain fragmenté.',
          solution: 'Création d\'un outil de découverte basé sur une carte avec des fonctionnalités de géolocalisation et un système d\'événements communautaire.',
          galleryImages: [
            'assets/images/projects/hoopers.png',
            'assets/images/projects/hoopers.png',
            'assets/images/projects/hoopers.png',
          ],
        ),
      ];
    }
    // Default to English
    return [
      const Project(
        title: 'WAAA World',
        description:
            'Travel-oriented social network application (available on app stores). Implemented authentication using AWS Cognito, Facebook and Google. Built messaging, friends, events and notification systems. Maintained CI/CD pipelines for TestFlight and Firebase distribution.',
        technologies: ['Flutter', 'Clean Architecture', 'BloC', 'GetIt', 'AWS'],
        imageUrl: 'assets/images/projects/waaa.png',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=com.waaworld.newwaaworld',
        appStoreLink: 'https://apps.apple.com/fr/app/waaaworld/id6483005465',
        role: 'Lead Mobile Developer',
        year: '2023',
        client: 'WAAA World',
        challenge: 'Creating a seamless social experience for travelers that combines networking, event management, and real-time communication in a single platform.',
        solution: 'Built a robust Flutter application using Clean Architecture and AWS for scalable backend services, ensuring high performance and secure user data management.',
        galleryImages: [
          'assets/images/projects/waaa.png',
          'assets/images/projects/waaa.png',
          'assets/images/projects/waaa.png',
        ],
      ),
      const Project(
        title: 'StartHome',
        description:
            'Professional app for technicians and real estate professionals to generate complete digital property inspection reports. Offline-first dynamic forms, checklists and high-resolution photo capture. Real-time synchronization with Laravel PHP backend.',
        technologies: ['Flutter', 'RxDart', 'MVP', 'GetX', 'Laravel', 'Firebase'],
        link: null,
        imageUrl: 'assets/images/projects/starthome.png',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=ca.starthome.app',
        appStoreLink: 'https://apps.apple.com/fr/app/start-home/id6741734431',
        role: 'Mobile Developer',
        year: '2024',
        client: 'StartHome',
        challenge: 'Enabling real estate professionals to generate complex inspection reports offline while ensuring data integrity and synchronization when online.',
        solution: 'Developed an offline-first architecture with local database storage and background synchronization, coupled with a dynamic form engine.',
        galleryImages: [
          'assets/images/projects/starthome.png',
          'assets/images/projects/starthome.png',
          'assets/images/projects/starthome.png',
        ],
      ),
      const Project(
        title: 'Hoopers',
        description:
            'Mobile platform to map basketball courts in major cities and organize community tournaments. Designed user flows for court discovery, match scheduling and event hosting. Integrated location services and map-based UI.',
        technologies: ['Flutter', 'BloC', 'GetIt', 'Firebase'],
        imageUrl: 'assets/images/projects/hoopers.png',
        role: 'Mobile Developer',
        year: '2022',
        client: 'Personal Project',
        challenge: 'Helping basketball players find courts and organize games in a fragmented urban environment.',
        solution: 'Created a map-based discovery tool with geolocation features and a community-driven event system.',
        galleryImages: [
          'assets/images/projects/hoopers.png',
          'assets/images/projects/hoopers.png',
          'assets/images/projects/hoopers.png',
        ],
      ),
    ];
  }

  @override
  Future<List<Skill>> getSkills() async {
    return [
      // Languages
      const Skill(name: 'Kotlin', category: 'Languages', iconCode: 'android'),
      const Skill(name: 'Swift', category: 'Languages', iconCode: 'swift'),
      const Skill(name: 'Dart (Flutter)', category: 'Languages', iconCode: 'flutter'),
      const Skill(name: 'Java', category: 'Languages', iconCode: 'java'),
      const Skill(name: 'XML', category: 'Languages', iconCode: 'code'),

      // Frameworks
      const Skill(name: 'Jetpack Compose', category: 'Frameworks', iconCode: 'android'),
      const Skill(name: 'SwiftUI', category: 'Frameworks', iconCode: 'apple'),
      const Skill(name: 'UIKit', category: 'Frameworks', iconCode: 'apple'),
      const Skill(name: 'Flutter', category: 'Frameworks', iconCode: 'flutter'),
      const Skill(name: 'BloC', category: 'Frameworks', iconCode: 'cubes'),
      const Skill(name: 'GetIt', category: 'Frameworks', iconCode: 'box-open'),

      // Databases
      const Skill(name: 'Firebase', category: 'Databases', iconCode: 'fire'),
      const Skill(name: 'Supabase', category: 'Databases', iconCode: 'supabase'),
      const Skill(name: 'MongoDB', category: 'Databases', iconCode: 'database'),
      const Skill(name: 'SQL Server', category: 'Databases', iconCode: 'server'),
      const Skill(name: 'SQLite', category: 'Databases', iconCode: 'database'),
      const Skill(name: 'Room', category: 'Databases', iconCode: 'database'),

      // CI/CD
      const Skill(name: 'Fastlane', category: 'CI/CD', iconCode: 'rocket'),
      const Skill(name: 'GitHub Actions', category: 'CI/CD', iconCode: 'github'),
      const Skill(name: 'Bitrise', category: 'CI/CD', iconCode: 'robot'),
      const Skill(name: 'Codemagic', category: 'CI/CD', iconCode: 'magic'),

      // Testing
      const Skill(name: 'JUnit', category: 'Testing', iconCode: 'vial'),
      const Skill(name: 'XCTest', category: 'Testing', iconCode: 'vial'),
      const Skill(name: 'Flutter Test', category: 'Testing', iconCode: 'vial'),

      // Tools
      const Skill(name: 'Git', category: 'Tools', iconCode: 'git-alt'),
      const Skill(name: 'GitHub', category: 'Tools', iconCode: 'github'),
      const Skill(name: 'GitLab', category: 'Tools', iconCode: 'gitlab'),
      const Skill(name: 'Maven', category: 'Tools', iconCode: 'tools'),
      const Skill(name: 'CocoaPods', category: 'Tools', iconCode: 'tools'),

      // Architecture
      const Skill(name: 'Clean Architecture', category: 'Architecture', iconCode: 'layer-group'),
      const Skill(name: 'MVVM', category: 'Architecture', iconCode: 'layer-group'),
      const Skill(name: 'MVC', category: 'Architecture', iconCode: 'layer-group'),

      // OS
      const Skill(name: 'macOS', category: 'OS', iconCode: 'apple'),
      const Skill(name: 'Ubuntu', category: 'OS', iconCode: 'ubuntu'),
      const Skill(name: 'Windows', category: 'OS', iconCode: 'windows'),
    ];
  }

  @override
  Future<List<Service>> getServices() async {
    return [
      const Service(
        titleKey: 'serviceMobileTitle',
        descriptionKey: 'serviceMobileDesc',
        iconCode: 'mobile', // Mapped in UI
      ),
      const Service(
        titleKey: 'serviceArchTitle',
        descriptionKey: 'serviceArchDesc',
        iconCode: 'layer-group', // Mapped in UI
      ),
      const Service(
        titleKey: 'serviceLeadTitle',
        descriptionKey: 'serviceLeadDesc',
        iconCode: 'users', // Mapped in UI
      ),
    ];
  }
}
