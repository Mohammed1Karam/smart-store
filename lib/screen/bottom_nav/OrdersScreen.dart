import 'package:flutter/material.dart';
import 'package:smart_store/screen/orders/my_orders_history_screen.dart';
import 'package:smart_store/screen/orders/my_orders_upcoming_screen.dart';
import 'package:smart_store/utils/app_colors.dart';
import 'package:smart_store/utils/size_config.dart';
import 'package:smart_store/widget/my_text.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.WiteColor,
            AppColors.HomeColor,
            AppColors.HomeColor,
            AppColors.HomeColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TabBar(
          indicatorPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaleHeight(5),
            horizontal: SizeConfig.scaleWidth(20),
          ),
          controller: _tabController,
          onTap: (int selectedTapIndex) {
            print('index : $selectedTapIndex');
            setState(() {
              _currentIndex = selectedTapIndex;
            });
            switch (selectedTapIndex) {
              case 0:
                MyOrdersHistoryScreen();
                changeCate(false);
                break;
              case 1:
                MyOrdersUpcomingScreen();
                changeCate(true);

                break;
            }
          },
          indicator: BoxDecoration(
              color: AppColors.COLOR, borderRadius: BorderRadius.circular(40)),
          indicatorColor: AppColors.COLOR,
          unselectedLabelColor: AppColors.Auth_COLOR,
          labelColor: AppColors.TapColor,
          labelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
          tabs: [
            Tab(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig.scaleWidth(20),
                  end: SizeConfig.scaleWidth(20),
                  top: SizeConfig.scaleHeight(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: MyText(
                      text: 'History',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.Auth_COLOR),
                ),
              ),
            ),
            Tab(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  start: SizeConfig.scaleWidth(20),
                  end: SizeConfig.scaleWidth(20),
                  top: SizeConfig.scaleHeight(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: MyText(
                      text: 'Upcoming',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.Auth_COLOR),
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            MyOrdersHistoryScreen(),
            MyOrdersUpcomingScreen(),
          ],
        ),
      ),
    );
  }

  void changeCate(bool expense) {
    if (expense == false) {
      MyOrdersHistoryScreen();
    } else {
      MyOrdersUpcomingScreen();
    }
  }
}
