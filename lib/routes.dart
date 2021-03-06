import 'splashscreen.dart';
import 'src/home.dart';
import 'src/find-a-provider.dart';
import 'src/current-prospective-member.dart';
import 'src/login/login.dart';
import 'src/registration.dart';
import 'src/in-app-browser.dart';
import 'src/member-home/member-home.dart';
import 'src/member-id-cards/member-id-cards.dart';

final appRoutes = {
  '/': (context) => AfterSplash(),
  '/home': (context) => MyHomePage(title: 'Careington'),
  '/member-home': (context) => MemberHome(title: 'Careington'),
  '/login': (context) => Login(title: 'Login'),
  '/registration': (context) => Registration(title: 'Registration'),
  '/find-a-provider': (context) => FindAProvider(title: 'FindAProvider'),
  '/current-prospective-member': (context) => CurrentProspectiveMember(title: 'CurrentProspectiveMember'),
  '/in-app-browser': (context) => InAppBrowser("https://www1.careington.com/mobile/search.aspx"),
  '/member-id-cards': (context) => MemberIDCards()
};
