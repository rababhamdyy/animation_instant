import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation1;
  late Animation<Offset> slideAnimation2;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    slideAnimation1 = Tween<Offset>(
      begin: const Offset(0, -7),
      end: Offset.zero,
    ).animate(animationController);

    slideAnimation2 = Tween<Offset>(
      begin: const Offset(0, 7),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SlideTransition(position: slideAnimation1,child: Image.asset('assets/news.webp')),
              ),
              SlideTransition(
                position: slideAnimation2,
                child: Text(
                  'World News',
                  style: TextStyle(fontSize: 30, color: Colors.blueGrey[900]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
