class Experience {
  final String company;
  final String role;
  final String period;
  final List<String> description;
  final String? imageUrl;
  final List<String>? galleryImages;

  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    this.imageUrl,
    this.galleryImages,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? link;
  final String? githubLink;
  final String? googlePlayLink;
  final String? appStoreLink;
  final String? imageUrl;
  final String? challenge;
  final String? solution;
  final String? role;
  final String? year;
  final String? client;
  final List<String>? galleryImages;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.link,
    this.githubLink,
    this.googlePlayLink,
    this.appStoreLink,
    this.imageUrl,
    this.challenge,
    this.solution,
    this.role,
    this.year,
    this.client,
    this.galleryImages,
  });
}

class Skill {
  final String name;
  final String category; // e.g., "Languages", "Frameworks", "Tools"
  final String? iconCode;

  const Skill({required this.name, required this.category, this.iconCode});
}

class Service {
  final String titleKey; // Key for localization
  final String descriptionKey; // Key for localization
  final String iconCode; // FontAwesome icon code or similar

  const Service({
    required this.titleKey,
    required this.descriptionKey,
    required this.iconCode,
  });
}
