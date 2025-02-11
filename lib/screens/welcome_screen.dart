import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './widgets/app_logo.dart';
import 'models/page_item.dart';
import 'widgets/action_button.dart';
import 'widgets/mascot_and_detail_container.dart';
import 'widgets/pageview_bullets.dart';

const _splashScreenBgAnimationDuration = 800;

class WelcomeScreen extends StatefulWidget {
  final VoidCallback onActionButtonTap;
  const WelcomeScreen({super.key, required this.onActionButtonTap});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    setIsLoggedInToFalse();
    _pageController.addListener(_onPageScroll);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageScroll);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageScroll() {
    double maxScrollExtent = _pageController.position.maxScrollExtent;
    double scrollExtentPerSection = maxScrollExtent / 4;
    double scrollPosition = _pageController.position.pixels;

    int newPage;
    if (scrollPosition > scrollExtentPerSection * 3) {
      newPage = 3;
    } else if (scrollPosition >
        scrollExtentPerSection + scrollExtentPerSection / 2) {
      newPage = 2;
    } else if (scrollPosition > scrollExtentPerSection / 2) {
      newPage = 1;
    } else {
      newPage = 0;
    }

    if (_currentPage != newPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  Future<void> setIsLoggedInToFalse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', false);
  }

  Future<void> _setHasShownWelcomeScreenToTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_shown_welcome_screen', true);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final List<PageItem> pageItemList = [
      PageItem(
        id: 'feature_one',
        title: 'Discover & Connect',
        subtitle: 'Explore new possibilities and stay connected effortlessly.',
        assetImage:
            'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/discovery.svg',
        primaryColor: const Color(0xffff725e),
      ),
      PageItem(
        id: 'feature_two',
        title: 'Flexibility at Your Fingertips',
        subtitle: 'Use the app the way you want, anytime, anywhere.',
        assetImage:
            'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/fingertips.svg',
        primaryColor: const Color(0xff92e3a9),
      ),
      PageItem(
        id: 'feature_three',
        title: 'Optimize & Grow',
        subtitle:
            'Leverage smart tools to enhance your experience and performance.',
        assetImage:
            'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/grow.svg',
        primaryColor: const Color(0xffba68c8),
      ),
      PageItem(
        id: 'feature_four',
        title: 'Seamless Transactions',
        subtitle:
            'Manage your activities with ease and get things done faster.',
        assetImage:
            'https://raw.githubusercontent.com/Ronak99/majestic-ui-flutter/refs/heads/master/assets/money.svg',
        primaryColor: const Color(0xff407bfe),
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: double.infinity,
          height: height,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: pageItemList[_currentPage].primaryColor.withOpacity(.2),
              ),
              Column(
                children: [
                  Expanded(
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      scrollBehavior: DisabledGlowBehaviour(),
                      controller: _pageController,
                      children: pageItemList
                          .map(
                            (e) => MascotAndDetailContainer(
                              pageItem: e,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Row(
                      children: [
                        PageViewBullets(
                          pageViewItemListLength: pageItemList.length,
                          selectedPageIndex: _currentPage,
                          primaryColor: pageItemList[_currentPage].primaryColor,
                        ),
                        const Spacer(),
                        ActionButton(
                          color: pageItemList[_currentPage].primaryColor,
                          isFirstPage: _currentPage == 0,
                          onBackPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          onForwardPressed: () async {
                            if (_currentPage == 3) {
                              await _setHasShownWelcomeScreenToTrue();
                              widget.onActionButtonTap();
                            } else {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const AppLogo()
            ],
          ),
        ),
      ),
    );
  }
}

class DisabledGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, _) {
    return child;
  }
}
