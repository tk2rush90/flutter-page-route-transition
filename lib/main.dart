import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'First Page',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const SecondPage(),
                  // [child] is returned value of [pageBuilder]
                  // This will not display any animation
                  transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
                ));
              },
              child: const Text(
                'To Second Page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Second Page',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const ThirdPage(),
                  // [child] is returned value of [pageBuilder]
                  // This example shows slide transition on page change
                  // The page will be animated from bottom to top
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const Offset begin = Offset(0, 1);
                    const Offset end = Offset.zero;

                    Tween<Offset> tween = Tween(begin: begin, end: end);
                    Animation<Offset> offsetAnimation = animation.drive(tween);

                    // Use built-in [SlideTransition]
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ));
              },
              child: const Text(
                'To Third Page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Third Page',
            ),
            ElevatedButton(
              onPressed: () {
                const Duration duration = Duration(milliseconds: 100);

                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const FourthPage(),
                  transitionDuration: duration,
                  reverseTransitionDuration: duration,
                  // [child] is returned value of [pageBuilder]
                  // This example shows slide transition on page change
                  // The page will be animated from right to left
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const Offset begin = Offset(1, 0);
                    const Offset end = Offset.zero;

                    Tween<Offset> tween = Tween(begin: begin, end: end);
                    Animation<Offset> offsetAnimation = animation.drive(tween);

                    // Use built-in [SlideTransition]
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ));
              },
              child: const Text(
                'To Fourth Page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Fourth Page',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const FifthPage(),
                  // [child] is returned value of [pageBuilder]
                  // This example shows slide transition on page change
                  // Use [Curves.easeInOut] on animation
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const Offset begin = Offset(0, -1);
                    const Offset end = Offset.zero;
                    const Curve curve = Curves.easeInOut;

                    Animatable<Offset> tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    Animation<Offset> offsetAnimation = animation.drive(tween);

                    // Use built-in [SlideTransition]
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ));
              },
              child: const Text(
                'To Fifth Page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  const FifthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Fifth Page',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const FirstPage(),
                  // [child] is returned value of [pageBuilder]
                  // This example shows fade transition on page change
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const double begin = 0;
                    const double end = 1;
                    const Curve curve = Curves.easeInOut;

                    Animatable<double> tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    Animation<double> doubleAnimation = animation.drive(tween);

                    // Use built-in [FadeTransition]
                    return FadeTransition(
                      opacity: doubleAnimation,
                      child: child,
                    );
                  },
                ));
              },
              child: const Text(
                'To First Page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
