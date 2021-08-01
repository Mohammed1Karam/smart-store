import 'package:flutter/material.dart';
import 'package:smart_store/screen/on_boarding/on_boarding_content.dart';
import 'package:smart_store/screen/on_boarding/on_boarding_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int currentPage) {
              setState(() {
                _currentPage = currentPage;
              });
            },
            controller: _pageController,
            children: [
              OnBoardingContent(
                color: Colors.white,
                image: 'images/pic.png',
                sizedBox: 75,
                text: AppLocalizations.of(context)?.textOnBoarding1 ?? '',
                subText: AppLocalizations.of(context)?.subTextOnBoarding1 ?? '',
              ),
              OnBoardingContent(
                color: Colors.white,
                image: 'images/pic1.png',
                sizedBox: 75,
                text: AppLocalizations.of(context)?.textOnBoarding2 ?? '',
                subText: AppLocalizations.of(context)?.subTextOnBoarding2 ?? '',
              ),
              OnBoardingContent(
                color: Colors.white,
                image: 'images/pic2.png',
                sizedBox: 75,
                text: AppLocalizations.of(context)?.textOnBoarding3 ?? '',
                subText: AppLocalizations.of(context)?.subTextOnBoarding3 ?? '',
              ),
            ],
          ),
          // SizedBox(height: 50,),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnBoardingIndicator(selected: _currentPage == 0),
                    OnBoardingIndicator(selected: _currentPage == 1),
                    OnBoardingIndicator(selected: _currentPage == 2),
                  ],
                ),
                SizedBox(height: SizeConfig.scaleHeight(70)),
                Visibility(
                  visible: _currentPage == 2,
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      child: Text(
                          AppLocalizations.of(context)?.nextpageVive ?? ''),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/LoginScreen');
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: _currentPage != 2,
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      child: Text(
                          AppLocalizations.of(context)?.nextpageVive ?? ''),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
