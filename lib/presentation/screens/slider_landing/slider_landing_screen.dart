import 'package:animate_do/animate_do.dart';
import 'package:delivery_go/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Labore nisi elit sit anim adipisicing.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Aute nostrud et in fugiat ipsum pariatur eu excepteur ut ullamco eu enim nisi enim.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Non dolor qui ut ut commodo culpa amet Lorem ipsum occaecat dolore qui.',
      'assets/images/3.png'),
];

class SliderLanding extends StatefulWidget {
  static const String name = 'slider_screen';

  const SliderLanding({super.key});

  @override
  State<SliderLanding> createState() => _SliderLandingState();
}

class _SliderLandingState extends State<SliderLanding> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  //good practice dispose after listener and controller
  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Skip'),
                onPressed: () {
                  // navegation homescreen with go router
                  context.pushNamed(HomeScreen.name);
                },
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () {
                        // navegation homescreen with go router
                        context.pushNamed(HomeScreen.name);
                      },
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleSyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(
                title,
                style: titleSyle,
              ),
              const SizedBox(height: 10),
              Text(
                caption,
                style: captionStyle,
              ),
            ]),
      ),
    );
  }
}
