import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Boubakar Traore - Portfolio'**
  String get appTitle;

  /// No description provided for @heroGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, I am'**
  String get heroGreeting;

  /// No description provided for @heroName.
  ///
  /// In en, this message translates to:
  /// **'Boubakar Traore'**
  String get heroName;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Senior Mobile Engineer'**
  String get heroTitle;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'7 years of experience building high-quality iOS, Android and Flutter applications.'**
  String get heroDescription;

  /// No description provided for @heroContactMe.
  ///
  /// In en, this message translates to:
  /// **'Contact Me'**
  String get heroContactMe;

  /// No description provided for @heroDownloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get heroDownloadCv;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navServices.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get navServices;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Senior Mobile Engineer with 7 years of experience building high-quality iOS, Android and Flutter applications. Strong focus on Clean Architecture, CI/CD automation, secure mobile development and scalable features. Known for ownership, reliability, cross-functional collaboration and the ability to deliver complex solutions in fast-paced environments across Canada and Europe.'**
  String get aboutDescription;

  /// No description provided for @aboutExpYears.
  ///
  /// In en, this message translates to:
  /// **'7+'**
  String get aboutExpYears;

  /// No description provided for @aboutExpLabel.
  ///
  /// In en, this message translates to:
  /// **'Years Experience'**
  String get aboutExpLabel;

  /// No description provided for @aboutProjects.
  ///
  /// In en, this message translates to:
  /// **'10+'**
  String get aboutProjects;

  /// No description provided for @aboutProjectsLabel.
  ///
  /// In en, this message translates to:
  /// **'Projects Completed'**
  String get aboutProjectsLabel;

  /// No description provided for @aboutClients.
  ///
  /// In en, this message translates to:
  /// **'100%'**
  String get aboutClients;

  /// No description provided for @aboutClientsLabel.
  ///
  /// In en, this message translates to:
  /// **'Client Satisfaction'**
  String get aboutClientsLabel;

  /// No description provided for @educationTitle.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationTitle;

  /// No description provided for @educationMaster.
  ///
  /// In en, this message translates to:
  /// **'Master’s Degree — Software Architecture & Application Development'**
  String get educationMaster;

  /// No description provided for @educationMasterSchool.
  ///
  /// In en, this message translates to:
  /// **'ETNA — Paris, France'**
  String get educationMasterSchool;

  /// No description provided for @educationBachelor.
  ///
  /// In en, this message translates to:
  /// **'Bachelor’s Degree in Computer Science'**
  String get educationBachelor;

  /// No description provided for @educationBachelorSchool.
  ///
  /// In en, this message translates to:
  /// **'Université Paris 8 — France'**
  String get educationBachelorSchool;

  /// No description provided for @languagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languagesTitle;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'French (Native)'**
  String get languageFrench;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English (Fluent)'**
  String get languageEnglish;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceTitle;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Skills'**
  String get skillsTitle;

  /// No description provided for @servicesTitle.
  ///
  /// In en, this message translates to:
  /// **'What I Do'**
  String get servicesTitle;

  /// No description provided for @serviceMobileTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Development'**
  String get serviceMobileTitle;

  /// No description provided for @serviceMobileDesc.
  ///
  /// In en, this message translates to:
  /// **'Expert development in Kotlin (Android), Swift (iOS), and Flutter for cross-platform solutions.'**
  String get serviceMobileDesc;

  /// No description provided for @serviceArchTitle.
  ///
  /// In en, this message translates to:
  /// **'Architecture & CI/CD'**
  String get serviceArchTitle;

  /// No description provided for @serviceArchDesc.
  ///
  /// In en, this message translates to:
  /// **'Implementation of Clean Architecture, MVVM, and automated pipelines using Fastlane & GitHub Actions.'**
  String get serviceArchDesc;

  /// No description provided for @serviceLeadTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Leadership'**
  String get serviceLeadTitle;

  /// No description provided for @serviceLeadDesc.
  ///
  /// In en, this message translates to:
  /// **'Mentoring junior developers, conducting code reviews, and leading technical decision-making.'**
  String get serviceLeadDesc;

  /// No description provided for @projectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Projects'**
  String get projectsTitle;

  /// No description provided for @viewProject.
  ///
  /// In en, this message translates to:
  /// **'View Project'**
  String get viewProject;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get contactTitle;

  /// No description provided for @contactNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get contactNameLabel;

  /// No description provided for @contactEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmailLabel;

  /// No description provided for @contactMessageLabel.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get contactMessageLabel;

  /// No description provided for @contactSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get contactSendButton;

  /// No description provided for @contactLocation.
  ///
  /// In en, this message translates to:
  /// **'Toronto, Ontario, Canada'**
  String get contactLocation;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'+1 514 346 5289'**
  String get contactPhone;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'t.boubakar@outlook.com'**
  String get contactEmail;

  /// No description provided for @footerRights.
  ///
  /// In en, this message translates to:
  /// **'© 2026 Boubakar Traore. All rights reserved.'**
  String get footerRights;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
