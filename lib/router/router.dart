import 'package:SalesMo/features/auth/forget_password.dart';
import 'package:SalesMo/features/auth/login_page.dart';
import 'package:SalesMo/features/auth/otp.dart';
import 'package:SalesMo/features/auth/register.dart';
import 'package:SalesMo/features/dashboard/dashboard_page.dart';
import 'package:SalesMo/features/history/history_page.dart';
import 'package:SalesMo/features/profile/profile_page.dart';
import 'package:SalesMo/features/splash/splash_screen.dart';
import 'package:SalesMo/features/stats/stats_page.dart';
import 'package:SalesMo/layout/mainLayout.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/register', builder: (context, state) => RegisterPage()),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(
      path: '/forget-password',
      builder: (context, state) => ForgetPasswordPage(),
    ),
    GoRoute(path: '/otp', builder: (context, state) => OtpPage()),
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),

    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => DashboardPage(),
        ),
        GoRoute(path: '/stats', builder: (context, state) => StatsPage()),
        GoRoute(path: '/history', builder: (context, state) => HistoryPage()),
        GoRoute(path: '/profile', builder: (context, state) => ProfilePage()),
      ],
    ),
  ],
);
