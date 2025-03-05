import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/localizations/localizations.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'pages/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: whiteColor,
        fontFamily: 'Montserrat',
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
                child: const SplashScreen(), type: PageTransitionType.fade);
          case '/onboarding':
            return PageTransition(
                child: const OnboardingScreen(), type: PageTransitionType.fade);
          case '/login':
            return PageTransition(
                child: const LoginScreen(),
                type: PageTransitionType.rightToLeft);
          case '/register':
            return PageTransition(
                child: RegisterScreen(), type: PageTransitionType.rightToLeft);
          case '/otp':
            return PageTransition(
                child: const OtpScreen(), type: PageTransitionType.rightToLeft);
          case '/bottomNavigation':
            return PageTransition(
                child: const BottomNavigationScreen(),
                type: PageTransitionType.rightToLeft);
          case '/home':
            return PageTransition(
                child: const HomeScreen(),
                type: PageTransitionType.rightToLeft);
          case '/notification':
            return PageTransition(
                child: const NotificationScreen(),
                type: PageTransitionType.rightToLeft);
          case '/search':
            return PageTransition(
                child: SearchScreen(), type: PageTransitionType.rightToLeft);
          case '/venues':
            return PageTransition(
                child: const VenuesScreen(),
                type: PageTransitionType.rightToLeft);
          case '/chat':
            return PageTransition(
                child: const ChatScreen(),
                type: PageTransitionType.rightToLeft);
          case '/calling':
            return PageTransition(
                child: const CallingScreen(),
                type: PageTransitionType.rightToLeft);
          case '/packagedetail':
            return PageTransition(
                child: const PackageDetailScreen(),
                type: PageTransitionType.rightToLeft);
          case '/venuedetail':
            return PageTransition(
                child: const VenueDetailScreen(),
                type: PageTransitionType.rightToLeft);
          case '/albums':
            return PageTransition(
                child: AlbumsScreen(), type: PageTransitionType.rightToLeft);
          case '/diningArea':
            return PageTransition(
                child: DiningArea(), type: PageTransitionType.rightToLeft);
          case '/review':
            return PageTransition(
                child: ReviewScreen(), type: PageTransitionType.rightToLeft);
          case '/availability':
            return PageTransition(
                child: const CheckAvailability(),
                type: PageTransitionType.rightToLeft);
          case '/venueAvailable':
            return PageTransition(
                child: const VenueAvailableScreen(),
                type: PageTransitionType.rightToLeft);
          case '/creditcard':
            return PageTransition(
                child: const CreditCardScreen(),
                type: PageTransitionType.rightToLeft);
          case '/success':
            return PageTransition(
                child: const SuccessScreen(),
                type: PageTransitionType.rightToLeft);
          case '/weddingpackages':
            return PageTransition(
                child: const WeddingPackageScreen(),
                type: PageTransitionType.rightToLeft);
          case '/weddingvenue':
            return PageTransition(
                child: WeddingVenuesScreen(),
                type: PageTransitionType.rightToLeft);
          case '/trendingDecore':
            return PageTransition(
                child: TrendingDecoreScreen(),
                type: PageTransitionType.rightToLeft);
          case '/vendors':
            return PageTransition(
                child: VendorsScreen(), type: PageTransitionType.rightToLeft);
          case '/task':
            return PageTransition(
                child: const TaskScreen(),
                type: PageTransitionType.rightToLeft);
          case '/todoList':
            return PageTransition(
                child: const ToDoListScreen(),
                type: PageTransitionType.rightToLeft);
          case '/guestList':
            return PageTransition(
                child: const GuestListScreen(),
                type: PageTransitionType.rightToLeft);
          case '/vendorshortList':
            return PageTransition(
                child: const VendorShortList(),
                type: PageTransitionType.rightToLeft);
          case '/venueshortlist':
            return PageTransition(
              child: VenueShortList(),
              type: PageTransitionType.rightToLeft,
            );
          case '/budget':
            return PageTransition(
              child: const BudgetScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/message':
            return PageTransition(
              child: MessageScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/profile':
            return PageTransition(
              child: const ProfileScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/editProfile':
            return PageTransition(
              child: const EditProfileScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/booking':
            return PageTransition(
              child: const BookingScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/languages':
            return PageTransition(
              child: const LanguagesScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/aboutUs':
            return PageTransition(
              child: const AboutUsScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/faqs':
            return PageTransition(
              child: FaQsScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/privacyPolicy':
            return PageTransition(
              child: const PrivacyPolicyScreen(),
              type: PageTransitionType.rightToLeft,
            );
          case '/customerSupport':
            return PageTransition(
              child: const CustomerSupportScreen(),
              type: PageTransitionType.rightToLeft,
            );
          default:
            return null;
        }
      },
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('id'),
        Locale('zh'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        DemoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale?.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
