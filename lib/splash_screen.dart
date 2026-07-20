import 'package:calc_x/core/routing/app_routes.dart';
import 'package:calc_x/shared/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 12,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pages.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  currentPage = index;
                  final page = pages[index];
                  return Image.asset(page.image, fit: BoxFit.fill);
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (currentPage == pages.length - 1) {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.basicCalcScreen);
                      }
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    child: Text("Next"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.basicCalcScreen);
                    },
                    child: Text("Skip All"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                  dotWidth: 20,
                  dotHeight: 10,
                  dotColor: Color.fromARGB(250, 17, 63, 112),
                  activeDotColor: Color.fromARGB(151, 29, 221, 239),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
