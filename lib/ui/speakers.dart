import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stripe_sessions/ui/confetti.dart';
import 'package:stripe_sessions/utils/app_asset.dart';

class Speakers extends StatefulWidget {
  const Speakers({super.key});

  @override
  State<Speakers> createState() => _SpeakersState();
}

class _SpeakersState extends State<Speakers> {
  final controller = ScrollController();
  late ConfettiController _confettiController;
  late double panelWidth = 0;
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
        AppAssets.images.kayteeImg8,
        AppAssets.images.kayteeImg9,
        AppAssets.images.kayteeImg10,
        AppAssets.images.kayteeImg11,

        // AppAssets.images.speakerSamJpg,
        // AppAssets.images.speakerClaireJpg,
        // AppAssets.images.speakerHeadshotsEileenOMaraJpg,
        // AppAssets.images.speakerVivekJpg,
        // AppAssets.images.speakerTanyaJpg,
        // AppAssets.images.speakerHeadshotsChristaDaviesJpg,
        // AppAssets.images.speakerHeadshotsYinWuJpg,
        // AppAssets.images.speakerHeadshotsDevakiRajJpg,
        // AppAssets.images.speakerHeadshotsAmitSagivJpg,
        // AppAssets.images.speakerHeadshotsAngelaStrangeJpg,
        // AppAssets.images.speakerHeadshotsSimonTayloJpg,
        // AppAssets.images.speakerHeadshotsTedPowerJpg,
        // AppAssets.images.speakerHeadshotsJeffSherlockJpg,
        // AppAssets.images.speakerHeadshotsJasonFanJpg,
        // AppAssets.images.speakerHeadshotsRachelLeaFishmanJpg,
        // AppAssets.images.speakerHeadshotsTakaoChitoseJpg,
        // AppAssets.images.speakerHeadshotsPeterFitzpatrickJpg,
        // AppAssets.images.speakerPatrickJpg,
        // AppAssets.images.speakerJohnJpg,
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
    final newIndex = min(activeIndex + 1, images.length);
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
    _confettiController = ConfettiController(
      duration: Duration(
        seconds: 30,
      ),
    );
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
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1100,
              ),
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 64, 12, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                              'You should click on this text, before reading  ',
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                          ),
                          Text(
                            "\n My Dearest Kaytee",
                            style: GoogleFonts.yeonSung(fontSize: 42),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '🖋️ On this special day, the world pauses to celebrate the day you were born \n'
                                  'Bringing with you a radiant light that continues to shine brighter with each passing year.\n',
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                            TextSpan(
                              text:
                                  '\n As the years have passed, I have had the privilege of witnessing the incredible woman you\'ve become 💓.',
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                            TextSpan(
                              text:
                                  '\n Your presence has been nothing short of enchanting 🥰,  Your smile, so warm and genuine, has the power to brighten even the gloomiest of days.\n'
                                  'And am priviledged to have seen that beautiful smile of yours mutiple times in my life-time, if i die tommorrow i die a happy Man 😊\n',
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                            TextSpan(
                              text:
                                  '\n 🥂  As we raise a glass to toast to your birthday, know that you are deeply loved and cherished by all who have the pleasure of knowing you.'
                                  '\n And am proud to be associated with you anytime anyday 😀, like justin Bieber i could catch a grenade for you baby 🎆',
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                            TextSpan(
                              text:
                                  "\n I could go on and on speaking of how much of an enchantment you are, but then you have a birthday to celebrate so imma pause here for now 🗞️\n ",
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                            TextSpan(
                              text:
                                  "\nThe Photo Collage below is just to remind of how much of enchantress that you are (Trust me your beauty is Mind-bugging 😀) ",
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                            TextSpan(
                              text:
                                  "\n Happy birthday, my dear. May your special day be as extraordinary as you are 😘\n\n",
                              style: GoogleFonts.indieFlower(fontSize: 24),
                            ),
                            TextSpan(
                              text:
                                  "From your forever shameless Hypeman 🥺 \n DaddyYO ",
                              style: GoogleFonts.fasthand(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                      ButtonBar(
                        children: [
                          IconButton(
                            onPressed: () => prev(),
                            icon: const Icon(Icons.chevron_left),
                          ),
                          IconButton(
                            onPressed: () => next(),
                            icon: const Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        const cardMargin = 12;
                        final cardWidth = (constraints.maxWidth / 10);
                        final activeWidth = (constraints.maxWidth / 2);
                        panelWidth = cardWidth;
                        return SizedBox(
                          height: 640,
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
                                                      min(index - activeIndex,
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
                                                      min(activeIndex - index,
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
                                    height: 640,
                                    width: active
                                        ? hoveredIndex != null
                                            ? (activeWidth - 32)
                                            : activeWidth
                                        : hoveredIndex == index
                                            ? (cardWidth + 32)
                                            : cardWidth,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: cardMargin / 2,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: AnimatedContainer(
                                        curve: curve,
                                        duration: duration,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                images.toList()[index]),
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
                      }),
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
