import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Lightweight app localizations for English and Spanish.
class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  static AppLocalizations of(BuildContext context) {
    final value = Localizations.of<AppLocalizations>(context, AppLocalizations);
    assert(value != null, 'No AppLocalizations found in context');
    return value!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      // Nav
      'navHome': 'Home',
      'navDiscover': 'Discover',
      'navSearch': 'Search',
      'navSaved': 'Saved',
      'navSettings': 'Settings',
      // Index
      'welcomeTitle': 'Welcome to HearHub',
      'welcomeSubtitle': 'Discover and use hearing support tools — simply.',
      'featureDiscover': 'Discover new tools',
      'featureLearn': 'Learn how to use them',
      'featureImprove': 'Improve your daily life',
      'seePersonalizedApps': 'See Personalized Apps',
      'seeAllApplications': 'See All Applications',
      // Onboarding
      'step1of4': 'Step 1 of 4',
      'step2of4': 'Step 2 of 4',
      'step3of4': 'Step 3 of 4',
      'howCanWeHelp': 'How can we help?',
      'selectOptionDescribesYou': 'Select the option that best describes you.',
      'roleStudent': 'I am a student',
      'roleProfessional': 'I am a professional',
      'roleParent': 'I am a parent',
      'roleSenior': 'I am a senior',
      'roleCaregiver': 'I am a caregiver',
      'continueLabel': 'Continue',
      'howIsYourHearing': 'How is your hearing?',
      'helpsSuggestTools': 'This helps us suggest the most useful tools.',
      'hearingMild':
          'Mild difficulty — I sometimes miss words in noisy places.',
      'hearingModerate':
          'Moderate difficulty — I often ask people to repeat themselves.',
      'hearingSevere':
          'Severe difficulty — I struggle to hear even in quiet environments.',
      'hearingProfound':
          'Profound loss — I rely on visual cues or assistive devices.',
      'whereNeedHelp': 'Where do you need help most?',
      'selectAllEnvironments': 'Select all environments that apply.',
      'envWork': 'Work — Meetings, open offices, calls.',
      'envSchool': 'School — Lectures, classrooms, group discussions.',
      'envHome': 'Home — TV, doorbells, family conversations.',
      'envSocial': 'Social — Restaurants, gatherings, public spaces.',
      'envOutdoors': 'Outdoors — Streets, transit, sports, events.',
      'seeMyGuide': 'See my guide',
      // Guide
      'forStudents': 'For Students',
      'forProfessionals': 'For Professionals',
      'forParents': 'For Parents',
      'forSeniors': 'For Seniors',
      'forCaregivers': 'For Caregivers',
      'guideTipsStudent': 'Tools and tips to help you in the classroom.',
      'guideTipsProfessional': 'Tools and tips to help you in the workplace.',
      'guideTipsParent': 'Tools and tips to help you with family life.',
      'guideTipsSenior': 'Tools and tips to help you in everyday life.',
      'guideTipsCaregiver':
          'Tools and tips to help you support someone you care for.',
      'guideTipsDefault': 'Tools and tips to help you.',
      'recommendedTools': 'Recommended Tools',
      'watchHowItWorks': 'Watch How It Works',
      'howToUse': 'How to Use',
      'tryTheseTools': 'Try these tools',
      // Dashboard
      'goodMorning': 'Good morning',
      'helloUser': 'Hello, User',
      'topPicks': 'Top Picks',
      'seeAll': 'See all',
      'get': 'Get',
      'learnMore': 'Learn more',
      'dailySituations': 'Daily Situations',
      'browseTools': 'Browse tools',
      'scenarioRestaurant': 'Restaurant',
      'scenarioMeeting': 'Meeting',
      'scenarioClassroom': 'Classroom',
      'scenarioHome': 'Home',
      // Tools
      'allTools': 'All Tools',
      'toolsCount': '{count} tools',
      'searchToolsHint': 'Search tools...',
      'showingToolsFor': 'Showing tools for {label}',
      'noToolsMatch': 'No tools match "{query}"',
      'noToolsInCategory': 'No tools in this category',
      'tryDifferentSearch': 'Try a different search or category.',
      'categoryAll': 'All',
      'categoryApps': 'Apps',
      'categoryDevices': 'Devices',
      'categoryGuides': 'Guides',
      // Tool detail
      'toolDetails': 'Tool Details',
      'whatThisToolHelpsWith': 'What this tool helps with',
      'watchTutorial': 'Watch tutorial',
      'startUsingTool': 'Start using tool',
      'howToStartIn2Minutes': 'How to start in 2 minutes',
      'toolNotFound': 'Tool not found',
      'toolNotInLibrary': '"{id}" is not in our library yet.',
      'browseAllTools': 'Browse all tools',
      'noDownloadPage': 'No download page available yet.',
      'invalidTutorialLink': 'Invalid tutorial link.',
      'couldNotOpenVideo': 'Could not open the video.',
      'invalidStoreLink': 'Invalid store link.',
      'couldNotOpenStore': 'Could not open the store page.',
      // Discover
      'discoverTools': 'Discover tools',
      'hearHubGuideIntro':
          "Hi, I'm HearHub Guide.\nWhat do you want help with today?",
      'tapOptionSuggestion': 'Tap an option to get a suggestion:',
      'optionSpeechInNoise': 'Understanding speech in noise',
      'optionNotesFromSpeech': 'Taking notes from speech',
      'optionCheckHearing': 'Checking my hearing',
      'optionSomethingElse': 'Something else',
      // Search
      'searchTitle': 'Search',
      'searchHint': 'Search tools or situations...',
      'popularCategories': 'Popular Categories',
      'recentSearches': 'Recent Searches',
      'clearAll': 'Clear all',
      'noRecentSearches': 'No recent searches',
      'noToolsFoundFor': 'No tools found for "{query}"',
      // Saved
      'savedTools': 'Saved Tools',
      'yourToolkit': 'Your toolkit for any situation.',
      'filterArticles': 'Articles',
      'filterApps': 'Apps',
      'filterGuides': 'Guides',
      // Personalize / Settings
      'settingsAccessibility': 'Settings & Accessibility',
      'personalizeApp': 'Personalize App',
      'visualSupport': 'Visual Support',
      'textSizeAdjustment': 'Text Size Adjustment',
      'previewText': 'Preview text looks like this',
      'appTheme': 'App Theme',
      'themeDark': 'Dark',
      'themeLight': 'Light',
      'interaction': 'Interaction',
      'reducedMotion': 'Reduced Motion',
      'tactileFeedback': 'Tactile Feedback',
      'system': 'System',
      'appLanguage': 'App Language',
      'languageEnglish': 'English',
      'languageSpanish': 'Spanish',
      'change': 'Change',
      'logout': 'Logout',
      'loggingOut': 'Logging out...',
      'chooseLanguage': 'Choose language',
      // Auth
      'welcomeBack': 'Welcome back',
      'loginSubtitle': 'Log in to continue using HearHub.',
      'email': 'Email',
      'password': 'Password',
      'name': 'Name',
      'emailRequired': 'Email is required',
      'enterValidEmail': 'Enter a valid email',
      'passwordRequired': 'Password is required',
      'nameRequired': 'Name is required',
      'passwordMinLength': 'Password should be at least 6 characters',
      'login': 'Login',
      'loggingIn': 'Logging in...',
      'dontHaveAccount': "Don't have an account? Sign up",
      'unableToLogin': 'Unable to login right now. Please try again.',
      'createAccount': 'Create account',
      'signupSubtitle': 'Get started with HearHub in a minute.',
      'createAccountButton': 'Create Account',
      'creatingAccount': 'Creating account...',
      'unableToSignup': 'Unable to sign up right now. Please try again.',
      // Misc
      'pageNotFound': 'Page not found',
      'goHome': 'Go home',
      'skip': 'Skip',
      'yesOften': 'Yes, often',
      'noRarely': 'No, rarely',
      'thankYou': 'Thank you!',
      'findingBestTools': 'Finding the best tools for you...',
      'answersHelpPersonalize': 'Your answers help us personalize tools.',
    },
    'es': {
      // Nav
      'navHome': 'Inicio',
      'navDiscover': 'Descubrir',
      'navSearch': 'Buscar',
      'navSaved': 'Guardados',
      'navSettings': 'Ajustes',
      // Index
      'welcomeTitle': 'Bienvenido a HearHub',
      'welcomeSubtitle':
          'Descubre y usa herramientas de apoyo auditivo — de forma sencilla.',
      'featureDiscover': 'Descubre nuevas herramientas',
      'featureLearn': 'Aprende a usarlas',
      'featureImprove': 'Mejora tu día a día',
      'seePersonalizedApps': 'Ver apps personalizadas',
      'seeAllApplications': 'Ver todas las aplicaciones',
      // Onboarding
      'step1of4': 'Paso 1 de 4',
      'step2of4': 'Paso 2 de 4',
      'step3of4': 'Paso 3 de 4',
      'howCanWeHelp': '¿Cómo podemos ayudarte?',
      'selectOptionDescribesYou':
          'Selecciona la opción que mejor te describe.',
      'roleStudent': 'Soy estudiante',
      'roleProfessional': 'Soy profesional',
      'roleParent': 'Soy padre o madre',
      'roleSenior': 'Soy una persona mayor',
      'roleCaregiver': 'Soy cuidador o cuidadora',
      'continueLabel': 'Continuar',
      'howIsYourHearing': '¿Cómo está tu audición?',
      'helpsSuggestTools':
          'Esto nos ayuda a sugerirte las herramientas más útiles.',
      'hearingMild':
          'Dificultad leve — A veces no oigo bien las palabras en lugares ruidosos.',
      'hearingModerate':
          'Dificultad moderada — A menudo pido que me repitan.',
      'hearingSevere':
          'Dificultad severa — Me cuesta oír incluso en ambientes silenciosos.',
      'hearingProfound':
          'Pérdida profunda — Dependo de señales visuales o dispositivos de ayuda.',
      'whereNeedHelp': '¿Dónde necesitas más ayuda?',
      'selectAllEnvironments': 'Selecciona todos los entornos que apliquen.',
      'envWork': 'Trabajo — Reuniones, oficinas abiertas, llamadas.',
      'envSchool': 'Escuela — Clases, aulas, debates en grupo.',
      'envHome': 'Hogar — TV, timbre, conversaciones familiares.',
      'envSocial': 'Social — Restaurantes, reuniones, espacios públicos.',
      'envOutdoors': 'Exterior — Calles, transporte, deportes, eventos.',
      'seeMyGuide': 'Ver mi guía',
      // Guide
      'forStudents': 'Para estudiantes',
      'forProfessionals': 'Para profesionales',
      'forParents': 'Para padres y madres',
      'forSeniors': 'Para personas mayores',
      'forCaregivers': 'Para cuidadores',
      'guideTipsStudent':
          'Herramientas y consejos para ayudarte en el aula.',
      'guideTipsProfessional':
          'Herramientas y consejos para ayudarte en el trabajo.',
      'guideTipsParent':
          'Herramientas y consejos para la vida familiar.',
      'guideTipsSenior':
          'Herramientas y consejos para el día a día.',
      'guideTipsCaregiver':
          'Herramientas y consejos para apoyar a alguien a tu cargo.',
      'guideTipsDefault': 'Herramientas y consejos para ayudarte.',
      'recommendedTools': 'Herramientas recomendadas',
      'watchHowItWorks': 'Ver cómo funciona',
      'howToUse': 'Cómo usarlo',
      'tryTheseTools': 'Prueba estas herramientas',
      // Dashboard
      'goodMorning': 'Buenos días',
      'helloUser': 'Hola, Usuario',
      'topPicks': 'Destacados',
      'seeAll': 'Ver todo',
      'get': 'Obtener',
      'learnMore': 'Más información',
      'dailySituations': 'Situaciones diarias',
      'browseTools': 'Explorar herramientas',
      'scenarioRestaurant': 'Restaurante',
      'scenarioMeeting': 'Reunión',
      'scenarioClassroom': 'Aula',
      'scenarioHome': 'Hogar',
      // Tools
      'allTools': 'Todas las herramientas',
      'toolsCount': '{count} herramientas',
      'searchToolsHint': 'Buscar herramientas...',
      'showingToolsFor': 'Mostrando herramientas para {label}',
      'noToolsMatch': 'Ninguna herramienta coincide con "{query}"',
      'noToolsInCategory': 'No hay herramientas en esta categoría',
      'tryDifferentSearch': 'Prueba otra búsqueda o categoría.',
      'categoryAll': 'Todas',
      'categoryApps': 'Apps',
      'categoryDevices': 'Dispositivos',
      'categoryGuides': 'Guías',
      // Tool detail
      'toolDetails': 'Detalles de la herramienta',
      'whatThisToolHelpsWith': 'En qué te ayuda esta herramienta',
      'watchTutorial': 'Ver tutorial',
      'startUsingTool': 'Empezar a usar',
      'howToStartIn2Minutes': 'Cómo empezar en 2 minutos',
      'toolNotFound': 'Herramienta no encontrada',
      'toolNotInLibrary': '"{id}" aún no está en nuestra biblioteca.',
      'browseAllTools': 'Ver todas las herramientas',
      'noDownloadPage': 'Aún no hay página de descarga.',
      'invalidTutorialLink': 'Enlace de tutorial no válido.',
      'couldNotOpenVideo': 'No se pudo abrir el video.',
      'invalidStoreLink': 'Enlace de tienda no válido.',
      'couldNotOpenStore': 'No se pudo abrir la página de la tienda.',
      // Discover
      'discoverTools': 'Descubrir herramientas',
      'hearHubGuideIntro':
          'Hola, soy la Guía de HearHub.\n¿Con qué quieres ayuda hoy?',
      'tapOptionSuggestion': 'Toca una opción para recibir una sugerencia:',
      'optionSpeechInNoise': 'Entender el habla en ruido',
      'optionNotesFromSpeech': 'Tomar notas del habla',
      'optionCheckHearing': 'Revisar mi audición',
      'optionSomethingElse': 'Otra cosa',
      // Search
      'searchTitle': 'Buscar',
      'searchHint': 'Buscar herramientas o situaciones...',
      'popularCategories': 'Categorías populares',
      'recentSearches': 'Búsquedas recientes',
      'clearAll': 'Borrar todo',
      'noRecentSearches': 'No hay búsquedas recientes',
      'noToolsFoundFor': 'No se encontraron herramientas para "{query}"',
      // Saved
      'savedTools': 'Herramientas guardadas',
      'yourToolkit': 'Tu kit para cualquier situación.',
      'filterArticles': 'Artículos',
      'filterApps': 'Apps',
      'filterGuides': 'Guías',
      // Personalize / Settings
      'settingsAccessibility': 'Ajustes y accesibilidad',
      'personalizeApp': 'Personalizar app',
      'visualSupport': 'Apoyo visual',
      'textSizeAdjustment': 'Tamaño del texto',
      'previewText': 'Así se ve el texto de vista previa',
      'appTheme': 'Tema de la app',
      'themeDark': 'Oscuro',
      'themeLight': 'Claro',
      'interaction': 'Interacción',
      'reducedMotion': 'Reducir movimiento',
      'tactileFeedback': 'Respuesta táctil',
      'system': 'Sistema',
      'appLanguage': 'Idioma de la app',
      'languageEnglish': 'Inglés',
      'languageSpanish': 'Español',
      'change': 'Cambiar',
      'logout': 'Cerrar sesión',
      'loggingOut': 'Cerrando sesión...',
      'chooseLanguage': 'Elegir idioma',
      // Auth
      'welcomeBack': 'Bienvenido de nuevo',
      'loginSubtitle': 'Inicia sesión para seguir usando HearHub.',
      'email': 'Correo',
      'password': 'Contraseña',
      'name': 'Nombre',
      'emailRequired': 'El correo es obligatorio',
      'enterValidEmail': 'Introduce un correo válido',
      'passwordRequired': 'La contraseña es obligatoria',
      'nameRequired': 'El nombre es obligatorio',
      'passwordMinLength': 'La contraseña debe tener al menos 6 caracteres',
      'login': 'Iniciar sesión',
      'loggingIn': 'Iniciando sesión...',
      'dontHaveAccount': '¿No tienes cuenta? Regístrate',
      'unableToLogin':
          'No se pudo iniciar sesión ahora. Inténtalo de nuevo.',
      'createAccount': 'Crear cuenta',
      'signupSubtitle': 'Empieza con HearHub en un minuto.',
      'createAccountButton': 'Crear cuenta',
      'creatingAccount': 'Creando cuenta...',
      'unableToSignup':
          'No se pudo crear la cuenta ahora. Inténtalo de nuevo.',
      // Misc
      'pageNotFound': 'Página no encontrada',
      'goHome': 'Ir al inicio',
      'skip': 'Omitir',
      'yesOften': 'Sí, a menudo',
      'noRarely': 'No, rara vez',
      'thankYou': '¡Gracias!',
      'findingBestTools': 'Buscando las mejores herramientas para ti...',
      'answersHelpPersonalize':
          'Tus respuestas nos ayudan a personalizar las herramientas.',
    },
  };

  String _t(String key) {
    final lang = locale.languageCode;
    return _localizedValues[lang]?[key] ??
        _localizedValues['en']![key] ??
        key;
  }

  String _tr(String key, Map<String, String> params) {
    var value = _t(key);
    params.forEach((k, v) {
      value = value.replaceAll('{$k}', v);
    });
    return value;
  }

  // Nav
  String get navHome => _t('navHome');
  String get navDiscover => _t('navDiscover');
  String get navSearch => _t('navSearch');
  String get navSaved => _t('navSaved');
  String get navSettings => _t('navSettings');

  // Index
  String get welcomeTitle => _t('welcomeTitle');
  String get welcomeSubtitle => _t('welcomeSubtitle');
  String get featureDiscover => _t('featureDiscover');
  String get featureLearn => _t('featureLearn');
  String get featureImprove => _t('featureImprove');
  String get seePersonalizedApps => _t('seePersonalizedApps');
  String get seeAllApplications => _t('seeAllApplications');

  // Onboarding
  String get step1of4 => _t('step1of4');
  String get step2of4 => _t('step2of4');
  String get step3of4 => _t('step3of4');
  String get howCanWeHelp => _t('howCanWeHelp');
  String get selectOptionDescribesYou => _t('selectOptionDescribesYou');
  String get roleStudent => _t('roleStudent');
  String get roleProfessional => _t('roleProfessional');
  String get roleParent => _t('roleParent');
  String get roleSenior => _t('roleSenior');
  String get roleCaregiver => _t('roleCaregiver');
  String get continueLabel => _t('continueLabel');
  String get howIsYourHearing => _t('howIsYourHearing');
  String get helpsSuggestTools => _t('helpsSuggestTools');
  String get hearingMild => _t('hearingMild');
  String get hearingModerate => _t('hearingModerate');
  String get hearingSevere => _t('hearingSevere');
  String get hearingProfound => _t('hearingProfound');
  String get whereNeedHelp => _t('whereNeedHelp');
  String get selectAllEnvironments => _t('selectAllEnvironments');
  String get envWork => _t('envWork');
  String get envSchool => _t('envSchool');
  String get envHome => _t('envHome');
  String get envSocial => _t('envSocial');
  String get envOutdoors => _t('envOutdoors');
  String get seeMyGuide => _t('seeMyGuide');

  // Guide
  String get forStudents => _t('forStudents');
  String get forProfessionals => _t('forProfessionals');
  String get forParents => _t('forParents');
  String get forSeniors => _t('forSeniors');
  String get forCaregivers => _t('forCaregivers');
  String get guideTipsStudent => _t('guideTipsStudent');
  String get guideTipsProfessional => _t('guideTipsProfessional');
  String get guideTipsParent => _t('guideTipsParent');
  String get guideTipsSenior => _t('guideTipsSenior');
  String get guideTipsCaregiver => _t('guideTipsCaregiver');
  String get guideTipsDefault => _t('guideTipsDefault');
  String get recommendedTools => _t('recommendedTools');
  String get watchHowItWorks => _t('watchHowItWorks');
  String get howToUse => _t('howToUse');
  String get tryTheseTools => _t('tryTheseTools');

  // Dashboard
  String get goodMorning => _t('goodMorning');
  String get helloUser => _t('helloUser');
  String get topPicks => _t('topPicks');
  String get seeAll => _t('seeAll');
  String get getLabel => _t('get');
  String get learnMore => _t('learnMore');
  String get dailySituations => _t('dailySituations');
  String get browseTools => _t('browseTools');
  String get scenarioRestaurant => _t('scenarioRestaurant');
  String get scenarioMeeting => _t('scenarioMeeting');
  String get scenarioClassroom => _t('scenarioClassroom');
  String get scenarioHome => _t('scenarioHome');

  // Tools
  String get allTools => _t('allTools');
  String toolsCount(int count) => _tr('toolsCount', {'count': '$count'});
  String get searchToolsHint => _t('searchToolsHint');
  String showingToolsFor(String label) =>
      _tr('showingToolsFor', {'label': label});
  String noToolsMatch(String query) => _tr('noToolsMatch', {'query': query});
  String get noToolsInCategory => _t('noToolsInCategory');
  String get tryDifferentSearch => _t('tryDifferentSearch');
  String get categoryAll => _t('categoryAll');
  String get categoryApps => _t('categoryApps');
  String get categoryDevices => _t('categoryDevices');
  String get categoryGuides => _t('categoryGuides');

  // Tool detail
  String get toolDetails => _t('toolDetails');
  String get whatThisToolHelpsWith => _t('whatThisToolHelpsWith');
  String get watchTutorial => _t('watchTutorial');
  String get startUsingTool => _t('startUsingTool');
  String get howToStartIn2Minutes => _t('howToStartIn2Minutes');
  String get toolNotFound => _t('toolNotFound');
  String toolNotInLibrary(String id) => _tr('toolNotInLibrary', {'id': id});
  String get browseAllTools => _t('browseAllTools');
  String get noDownloadPage => _t('noDownloadPage');
  String get invalidTutorialLink => _t('invalidTutorialLink');
  String get couldNotOpenVideo => _t('couldNotOpenVideo');
  String get invalidStoreLink => _t('invalidStoreLink');
  String get couldNotOpenStore => _t('couldNotOpenStore');

  // Discover
  String get discoverTools => _t('discoverTools');
  String get hearHubGuideIntro => _t('hearHubGuideIntro');
  String get tapOptionSuggestion => _t('tapOptionSuggestion');
  String get optionSpeechInNoise => _t('optionSpeechInNoise');
  String get optionNotesFromSpeech => _t('optionNotesFromSpeech');
  String get optionCheckHearing => _t('optionCheckHearing');
  String get optionSomethingElse => _t('optionSomethingElse');

  // Search
  String get searchTitle => _t('searchTitle');
  String get searchHint => _t('searchHint');
  String get popularCategories => _t('popularCategories');
  String get recentSearches => _t('recentSearches');
  String get clearAll => _t('clearAll');
  String get noRecentSearches => _t('noRecentSearches');
  String noToolsFoundFor(String query) =>
      _tr('noToolsFoundFor', {'query': query});

  // Saved
  String get savedTools => _t('savedTools');
  String get yourToolkit => _t('yourToolkit');
  String get filterArticles => _t('filterArticles');
  String get filterApps => _t('filterApps');
  String get filterGuides => _t('filterGuides');

  // Personalize
  String get settingsAccessibility => _t('settingsAccessibility');
  String get personalizeApp => _t('personalizeApp');
  String get visualSupport => _t('visualSupport');
  String get textSizeAdjustment => _t('textSizeAdjustment');
  String get previewText => _t('previewText');
  String get appTheme => _t('appTheme');
  String get themeDark => _t('themeDark');
  String get themeLight => _t('themeLight');
  String get interaction => _t('interaction');
  String get reducedMotion => _t('reducedMotion');
  String get tactileFeedback => _t('tactileFeedback');
  String get system => _t('system');
  String get appLanguage => _t('appLanguage');
  String get languageEnglish => _t('languageEnglish');
  String get languageSpanish => _t('languageSpanish');
  String get change => _t('change');
  String get logout => _t('logout');
  String get loggingOut => _t('loggingOut');
  String get chooseLanguage => _t('chooseLanguage');

  String languageDisplayName(String code) {
    switch (code) {
      case 'es':
        return languageSpanish;
      case 'en':
      default:
        return languageEnglish;
    }
  }

  // Auth
  String get welcomeBack => _t('welcomeBack');
  String get loginSubtitle => _t('loginSubtitle');
  String get email => _t('email');
  String get password => _t('password');
  String get name => _t('name');
  String get emailRequired => _t('emailRequired');
  String get enterValidEmail => _t('enterValidEmail');
  String get passwordRequired => _t('passwordRequired');
  String get nameRequired => _t('nameRequired');
  String get passwordMinLength => _t('passwordMinLength');
  String get login => _t('login');
  String get loggingIn => _t('loggingIn');
  String get dontHaveAccount => _t('dontHaveAccount');
  String get unableToLogin => _t('unableToLogin');
  String get createAccount => _t('createAccount');
  String get signupSubtitle => _t('signupSubtitle');
  String get createAccountButton => _t('createAccountButton');
  String get creatingAccount => _t('creatingAccount');
  String get unableToSignup => _t('unableToSignup');

  // Misc
  String get pageNotFound => _t('pageNotFound');
  String get goHome => _t('goHome');
  String get skip => _t('skip');
  String get yesOften => _t('yesOften');
  String get noRarely => _t('noRarely');
  String get thankYou => _t('thankYou');
  String get findingBestTools => _t('findingBestTools');
  String get answersHelpPersonalize => _t('answersHelpPersonalize');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales
          .any((l) => l.languageCode == locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
