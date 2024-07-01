import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stripe_sessions/ui/confetti.dart';
import 'package:stripe_sessions/utils/app_asset.dart';

class Speakers extends StatefulWidget {
  const Speakers({Key? key}) : super(key: key);

  @override
  State<Speakers> createState() => _SpeakersState();
}

class _SpeakersState extends State<Speakers> {
  final controller = ScrollController();
  late ConfettiController _confettiController;
  late double panelWidth;
  final curve = Curves.linearToEaseOut;
  final duration = const Duration(milliseconds: 700);
  int activeIndex = 0;
  int? hoveredIndex;
  bool animating = false;
  final glow = Image.asset(
    "assets/images/glow-texture.png",
    width: 1080,
    height: 1080,
  );

  List<String> get images => [
        AppAssets.images.kayteeImg1,
        AppAssets.images.kayteeImg2,
        AppAssets.images.kayteeImg3,
        AppAssets.images.kayteeImg4,
        AppAssets.images.kayteeImg5,
        AppAssets.images.kayteeImg6,
        AppAssets.images.kayteeImg7,
      ];

  void prev() async {
    if (animating) return;
    final newIndex = max(0, activeIndex - 1);
    final oldIndex = activeIndex;
    animating = true;
    setState(() => activeIndex = newIndex);
    await controller.animateTo(
      max(
        controller.offset -
            (newIndex < 2
                ? panelWidth
                : (panelWidth * min(oldIndex - newIndex, 2))),
        0,
      ),
      duration: duration,
      curve: curve,
    );
    setState(() => animating = false);
  }

  void next() async {
    if (animating) return;
    final newIndex = min(activeIndex + 1, images.length - 1);
    final oldIndex = activeIndex;
    animating = true;
    setState(() => activeIndex = newIndex);
    await controller.animateTo(
      max(
        controller.offset +
            (newIndex > 2 ? (panelWidth * min(newIndex - oldIndex, 2)) : 0),
        controller.offset,
      ),
      duration: duration,
      curve: curve,
    );
    setState(() => animating = false);
  }

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 30));
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 64, 12, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child:
                              Confetti(confettiController: _confettiController),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () => _confettiController.play(),
                              child: Text(
                                'Click on this text before reading',
                                style: GoogleFonts.indieFlower(
                                  fontSize: screenWidth * 0.05,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\n My Bee 🐝",
                          style: GoogleFonts.yeonSung(
                            fontSize: screenWidth * 0.06,
                          ),
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '🖋️ As I sit down to write to you, my heart overflows with emotions and my thoughts are filled \n'
                                    'with the countless reasons why I love you. You are the sunshine that brightens every day, the star that guides me through the night.\n',
                                style: GoogleFonts.indieFlower(
                                    fontSize: screenWidth * 0.04),
                              ),
                              TextSpan(
                                text:
                                    '\n Your love is a symphony that fills my heart with joy, a gentle breeze that soothes my soul 💓.'
                                    ' You are the missing piece that makes me whole, the missing beat that makes my heart complete \n',
                                style: GoogleFonts.indieFlower(
                                    fontSize: screenWidth * 0.04),
                              ),
                              TextSpan(
                                text:
                                    '\n Your presence has been nothing short of enchanting 🥰,  Your smile, so warm and genuine, has the power to brighten even the gloomiest of days.\n'
                                    '\nAnd i am privileged to have seen that beautiful smile of yours multiple times in my lifetime 😊\n',
                                style: GoogleFonts.indieFlower(
                                    fontSize: screenWidth * 0.04),
                              ),
                              TextSpan(
                                text:
                                    '\n 😀, like Justin Bieber, I could catch a grenade for you, baby 🎆 (I am not 100% sure about the grenade sha)\n\n',
                                style: GoogleFonts.indieFlower(
                                    fontSize: screenWidth * 0.04),
                              ),
                              TextSpan(
                                text:
                                    'Like i have always said i am here to be your happy pill, i hope you don\'t Od on me 😂\n\nAnd i love you 😘\n\n',
                                style: GoogleFonts.indieFlower(
                                    fontSize: screenWidth * 0.04),
                              ),
                              TextSpan(
                                text:
                                    "\nThe Photo Collage below is just to remind you of how much of an enchantress that you are (Trust me, your beauty is stunning! 😀) ",
                                style: GoogleFonts.indieFlower(
                                    fontSize: screenWidth * 0.04),
                              ),
                              TextSpan(
                                text: "\n 😘\n\n",
                                style: GoogleFonts.indieFlower(
                                    fontSize: screenWidth * 0.04),
                              ),
                              TextSpan(
                                text:
                                    "From your forever shameless Boyfriend 🥺 \n Oluwamayowafunmi",
                                style: GoogleFonts.fasthand(
                                    fontSize: screenWidth * 0.04),
                              ),
                            ],
                          ),
                        ),
                        ButtonBar(
                          children: [
                            IconButton(
                              onPressed: prev,
                              icon: const Icon(Icons.chevron_left),
                            ),
                            IconButton(
                              onPressed: next,
                              icon: const Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final cardMargin = screenWidth * 0.01;
                            final cardWidth = constraints.maxWidth / 10;
                            final activeWidth = constraints.maxWidth / 2;
                            panelWidth = cardWidth;

                            return SizedBox(
                              height: screenWidth * 0.6,
                              width: double.infinity,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                controller: controller,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  final active = index == activeIndex;
                                  return GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      if (activeIndex == index) return;
                                      setState(() {
                                        if (index > activeIndex) {
                                          controller.animateTo(
                                            max(
                                              controller.offset +
                                                  (index > 2
                                                      ? (cardWidth *
                                                          min(
                                                              index -
                                                                  activeIndex,
                                                              2))
                                                      : 0),
                                              controller.offset,
                                            ),
                                            duration: duration,
                                            curve: curve,
                                          );
                                        } else {
                                          controller.animateTo(
                                            max(
                                              controller.offset -
                                                  (index < 2
                                                      ? cardWidth
                                                      : (cardWidth *
                                                          min(
                                                              activeIndex -
                                                                  index,
                                                              2))),
                                              0,
                                            ),
                                            duration: duration,
                                            curve: curve,
                                          );
                                        }
                                        activeIndex = index;
                                      });
                                    },
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      onHover: (event) {
                                        if (index == 0) return;
                                        setState(() => hoveredIndex = index);
                                      },
                                      onExit: (event) {
                                        setState(() => hoveredIndex = null);
                                      },
                                      child: AnimatedContainer(
                                        curve: curve,
                                        duration: duration,
                                        height: screenWidth * 0.6,
                                        width: active
                                            ? hoveredIndex != null
                                                ? (activeWidth - cardMargin)
                                                : activeWidth
                                            : hoveredIndex == index
                                                ? (cardWidth + cardMargin)
                                                : cardWidth,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: cardMargin / 2,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          child: AnimatedContainer(
                                            curve: curve,
                                            duration: duration,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    AssetImage(images[index]),
                                              ),
                                            ),
                                            child: AnimatedOpacity(
                                              duration: duration,
                                              curve: curve,
                                              opacity: active ? 1 : 0,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    top: -400,
                                                    left: 40,
                                                    child: glow,
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    right: 40,
                                                    child: glow,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
