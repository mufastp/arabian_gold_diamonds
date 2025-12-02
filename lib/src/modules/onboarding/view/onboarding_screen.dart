import 'package:arabian_gold_diamonds/app/themedata/appcolor.dart';
import 'package:arabian_gold_diamonds/app/themedata/text_style.dart';
import 'package:arabian_gold_diamonds/gen/assets.gen.dart';
import 'package:arabian_gold_diamonds/src/core/appbutton.dart';
import 'package:arabian_gold_diamonds/src/modules/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingView extends StatelessWidget {
  final controller = Get.put(OnboardingController());
  final PageController pageController = PageController();

  final List<Map<String, String>> data = [
    {
      "img": Assets.images.onb1.keyName,
      "title": "Don’t just save it, make\nit special",
      "subtitle": "Turn your regular savings into something truly valuable.",
    },
    {
      "img": Assets.images.onb2.keyName,
      "title": "Design Your Destiny,\nFee-Free",
      "subtitle":
          "Your dream piece, unlocked with an 11-month plan and no extra costs.",
    },
    {
      "img": Assets.images.onb3.keyName,
      "title": "Your Legacy, Solid Gold",
      "subtitle":
          "Start saving with innovative digital gold—your next big investment!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// PAGEVIEW
          PageView.builder(
            controller: pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: data.length,
            itemBuilder: (_, index) {
              return Stack(
                children: [
                  /// Background Image
                  Positioned.fill(
                    child: Image.asset(data[index]["img"]!, fit: BoxFit.cover),
                  ),

                  /// Skip Button
                 if (index != 2)
                  Positioned(
                    top: 50,
                    right: 20,
                    child: GestureDetector(
                      onTap: controller.skip,
                      child: Text("Skip", style: skipstyle),
                    ),
                  ),

                  /// Text Area
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: index == 2 ? 140 : 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index]["title"]!, style: onboardstyletitle),

                        const SizedBox(height: 12),
                        Text(
                          data[index]["subtitle"]!,
                          style: onboardstylesubtitle,
                        ),
                      ],
                    ),
                  ),

                  /// Next Button
                  if (index != 2)
                    Positioned(
                      right: -80, // 👈 pushes half outside the screen
                      top: MediaQuery.of(context).size.height * 0.43,
                      child: Transform.rotate(
                        angle: 0.785, // 45-degree diamond
                        child: GestureDetector(
                          onTap: () => controller.nextPage(pageController),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color:index == 0? const Color(0xFF1A1F3D):Color(0xFF671411),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 20,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                          
                            child: Transform.rotate(
                              angle: -0.785, // rotate icon back
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.all(20),
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: Color(0xFFD4A017),
                                  size: 36,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  /// Start My Journey (LAST PAGE)
                  if (index == 2)
                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 40,
                      child: AppButton(
                        title: "Start My Journey",
                        onPressed: controller.finish,
                        //isLoading: controller.isLoading.value, // if you want loading
                      ),
                    ),
                ],
              );
            },
          ),

          /// PAGE INDICATOR
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (i) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: controller.pageIndex.value == i ? 24 : 8,
                    decoration: BoxDecoration(
                      color: controller.pageIndex.value == i
                          ? AppColors.gold500
                          : Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}
