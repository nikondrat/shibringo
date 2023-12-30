/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 26
///
/// Built on 2023-12-30 at 17:59 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsAuthEn auth = _StringsAuthEn._(_root);
	late final _StringsOnboardingEn onboarding = _StringsOnboardingEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
}

// Path: auth
class _StringsAuthEn {
	_StringsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get register => 'Register';
	String get login => 'Login';
	String get password => 'password';
	String get name => 'Full name';
	String get email => 'Email';
	String get nickname => 'Nickname';
	String get repeat => 'Repeat ${_root.auth.password}';
	String forgot({required Object v}) => 'Forgot ${v}';
	String reset({required Object v}) => 'Reset ${v}';
	TextSpan go_login({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'Already have an account? '),
		tapHere('${_root.auth.login}'),
	]);
	TextSpan terms_hint({required InlineSpanBuilder tapHere}) => TextSpan(children: [
		const TextSpan(text: 'By registering, you accept the \n'),
		tapHere('Terms and Conditions'),
	]);
	late final _StringsAuthSetupEn setup = _StringsAuthSetupEn._(_root);
	late final _StringsAuthExampleEn example = _StringsAuthExampleEn._(_root);
}

// Path: onboarding
class _StringsOnboardingEn {
	_StringsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	Map<String, String> get first_view => {
		'title': 'Share Your Recipes',
		'description': 'Get feedback on the recipe',
	};
	Map<String, String> get second_view => {
		'title': 'Learn To Cook',
		'description': 'Find out the recipes of experienced chefs',
	};
	Map<String, String> get third_view => {
		'title': 'Become a Master Chef',
		'description': 'Cook, experiment, share',
	};
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get app_name => 'shibringo';
	String get next => 'Next';
	String get skip => 'Skip';
}

// Path: auth.setup
class _StringsAuthSetupEn {
	_StringsAuthSetupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Account \nSetup';
	String get upload => 'Upload your profile image';
	String get hint => 'No more than 2 MB';
}

// Path: auth.example
class _StringsAuthExampleEn {
	_StringsAuthExampleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get name => 'Ivan Ivanov';
	String get email => 'ivan@example.com';
	String get password => 'password';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.register': return 'Register';
			case 'auth.login': return 'Login';
			case 'auth.password': return 'password';
			case 'auth.name': return 'Full name';
			case 'auth.email': return 'Email';
			case 'auth.nickname': return 'Nickname';
			case 'auth.repeat': return 'Repeat ${_root.auth.password}';
			case 'auth.forgot': return ({required Object v}) => 'Forgot ${v}';
			case 'auth.reset': return ({required Object v}) => 'Reset ${v}';
			case 'auth.go_login': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'Already have an account? '),
				tapHere('${_root.auth.login}'),
			]);
			case 'auth.terms_hint': return ({required InlineSpanBuilder tapHere}) => TextSpan(children: [
				const TextSpan(text: 'By registering, you accept the \n'),
				tapHere('Terms and Conditions'),
			]);
			case 'auth.setup.title': return 'Account \nSetup';
			case 'auth.setup.upload': return 'Upload your profile image';
			case 'auth.setup.hint': return 'No more than 2 MB';
			case 'auth.example.name': return 'Ivan Ivanov';
			case 'auth.example.email': return 'ivan@example.com';
			case 'auth.example.password': return 'password';
			case 'onboarding.first_view.title': return 'Share Your Recipes';
			case 'onboarding.first_view.description': return 'Get feedback on the recipe';
			case 'onboarding.second_view.title': return 'Learn To Cook';
			case 'onboarding.second_view.description': return 'Find out the recipes of experienced chefs';
			case 'onboarding.third_view.title': return 'Become a Master Chef';
			case 'onboarding.third_view.description': return 'Cook, experiment, share';
			case 'common.app_name': return 'shibringo';
			case 'common.next': return 'Next';
			case 'common.skip': return 'Skip';
			default: return null;
		}
	}
}
