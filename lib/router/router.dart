import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space/common/components/beauty.dart';
import 'package:space/common/components/conn.dart';
import 'package:space/common/components/default_screen.dart';
import 'package:space/common/components/food_screen.dart';
import 'package:space/common/components/forgot_password.dart';
import 'package:space/common/components/profile.dart';
import 'package:space/common/components/signIn.dart';
import 'package:space/common/components/signup.dart';
import 'package:space/common/components/tile_detail.dart';
import 'package:space/common/components/token.dart';
import 'package:space/router/bottom_nav.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _spaceNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'space');
final _connectNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'connect');
final _profileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'profile');
final _otherNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'other');

final goRouter = GoRouter(
    initialLocation: '/login',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => const SignUpWidget(),
      ),
      StatefulShellRoute.indexedStack(
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/default-screen',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: DefaultScreen()),
                  routes: [
                    GoRoute(
                        path: 'food',
                        builder: (context, state) => const FoodScreen(),
                        routes: [
                          GoRoute(
                              path: 'tile-detail',
                              builder: (context, state) => const TileDetail())
                        ])
                  ])
            ], navigatorKey: _homeNavigatorKey),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/beauty-screen',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: BeautyScreen()),
                  routes: const [
                    // GoRoute(path: 'details',builder: (context, state)=>DetailsScreen())
                  ])
            ], navigatorKey: _spaceNavigatorKey),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/connection-screen',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: ConnectionScreen()),
                  routes: const [
                    // GoRoute(path: 'details',builder: (context, state)=>DetailsScreen())
                  ])
            ], navigatorKey: _connectNavigatorKey),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/profile-screen',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: Profile()),
                  routes: const [
                    // GoRoute(path: 'details',builder: (context, state)=>DetailsScreen())
                  ])
            ], navigatorKey: _profileNavigatorKey),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: '/token-screen',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: TokenScreen()),
                  routes: const [
                    // GoRoute(path: 'details',builder: (context, state)=>DetailsScreen())
                  ])
            ], navigatorKey: _otherNavigatorKey)
          ],
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          })
    ]);
