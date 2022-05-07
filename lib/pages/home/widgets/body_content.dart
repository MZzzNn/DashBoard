import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_web/shared/app_responsive/app_responsive.dart';
import '../../../shared/components/components.dart';
import '../../../shared/style/color.dart';
import 'notification_content.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const WelcomeWidget(),
            const SizedBox(height: 20),
            const TableOfEmployee(),
            if(!AppResponsive.isDesktop(context))
              const NotificationContent(),
          ],
        ),
      ),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(color: ColorManager.white, fontSize: 18),
                      children: [
                        TextSpan(text: 'Hello, '),
                        TextSpan(
                          text: 'Mazen Mohamed',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "It is a long established fact that a reader will be distracted by the readable content of. The point of using Ipsum is that it has making it look like readable English. sometimes on purpose (injected humour and the like).",
                    style: TextStyle(color: ColorManager.white),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Read more',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      color: ColorManager.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 50),
            Expanded(
              flex: 3,
              child: Image.asset('assets/images/img.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class TableOfEmployee extends StatelessWidget {
  const TableOfEmployee({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //height: MediaQuery.of(context).size.height * 0.51,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Employee Data',
                style: TextStyle(color: ColorManager.white, fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add Employee',
                  style: TextStyle(color: ColorManager.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: ColorManager.darkColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.darkColor.withOpacity(0.5),
                  offset: const Offset(0, 3),
                  spreadRadius: 3,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    headTableTitle(title: 'Emp Name'),
                    headTableTitle(title: 'Position'),
                    headTableTitle(title: 'Status'),
                    if(AppResponsive.isDesktop(context) )Expanded(child: Container())
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Divider(color: ColorManager.white.withOpacity(0.2)),
                ),
                ListView.separated(
                  itemCount: 4,
                  padding:  EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                    children: [
                      bodyTableTitle(title: 'John Doe'),
                      bodyTableTitle(title: 'Manager'),
                      bodyTableTitle(title: 'Active'),
                      if(AppResponsive.isDesktop(context) )
                        Expanded(child: completeStar(Random().nextDouble() * 4)),
                    ],
                  ),
                  separatorBuilder: (context, index) => myDivider(),
                ),
                myDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'view 4 from 40',
                      style: TextStyle(
                        color: ColorManager.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('View More')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




