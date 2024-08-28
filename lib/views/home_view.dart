import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pageController = PageController();
  var currentPage = 0;

// todo move to next page func
  void jumpToPage(int page) {
    setState(() {
      currentPage = page;
      pageController.jumpToPage(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              // todo to move back to previous page smoothly
              onPageChanged: (val) {
                setState(() {
                  currentPage = val;
                });
              },
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(200, 60),
                ),
                onPressed: () {
                  // todo move to next page
                  jumpToPage(currentPage + 1);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 100,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: const WormEffect(
              dotHeight: 20,
              dotWidth: 20,
              dotColor: Colors.grey,
              activeDotColor: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue[200],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red[200],
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green[200],
    );
  }
}
