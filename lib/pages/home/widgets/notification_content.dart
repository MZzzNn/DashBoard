import 'package:flutter/material.dart';
import 'package:flutter_web/shared/app_responsive/app_responsive.dart';
import 'package:flutter_web/shared/components/components.dart';
import 'package:flutter_web/shared/style/color.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 15),
      child: SingleChildScrollView(
        physics: (!AppResponsive.isDesktop(context)) ?const NeverScrollableScrollPhysics() :const BouncingScrollPhysics() ,
        child: Column(
          children: const [
            CalendarWidget(),
            SizedBox(height: 10),
            TasksWidget(),
          ],
        ),
      ),
    );
  }
}

//calendar
class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.darkColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 5),
              Text(
                DateFormat("MMM, yyyy").format(_selectedDate),
                style: const TextStyle(
                  color: ColorManager.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  _selectedDate =
                      DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  _selectedDate =
                      DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
                  setState(() {});
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
          const SizedBox(height: 10),
          TableCalendar(
              focusedDay: _selectedDate,
              firstDay: DateTime.utc(2000),
              lastDay: DateTime.utc(2030),
              headerVisible: false,
              onFormatChanged: (date) {},
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                    color: ColorManager.iconColor, fontWeight: FontWeight.bold),
                weekendStyle: TextStyle(
                    color: ColorManager.orangeColor,
                    fontWeight: FontWeight.bold),
              ),
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.orangeColor,
                ),
                markerDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.orangeColor,
                ),
                defaultTextStyle: TextStyle(color: ColorManager.white),
              )),
        ],
      ),
    );
  }
}

//tasks
class TasksWidget extends StatelessWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.darkColor,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 15,
            leading: const CircleAvatar(
              backgroundColor: ColorManager.orangeColor,
              child: Icon(
                Icons.person,
                color: ColorManager.white,
              ),
            ),
            title: const Text("Mazen Mohamed",style: TextStyle(color: ColorManager.white)),
            subtitle: const Text('Developer', style: TextStyle(color: Colors.grey)),
            onTap: () {},
          ),
          myDivider(),
          //task list
          const SizedBox(height: 10),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return taskWidget(
                title: 'Task ${index+1}',
                subtitle: 'task ${index+1}',
                onTap: () {},
              );
            },
            separatorBuilder: (BuildContext context, int index)=> const SizedBox(height: 5),
          ),


        ],
      ),
    );
  }

}

Widget taskWidget({required String title, required String subtitle, required Null Function() onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: const TextStyle(color: ColorManager.white)),
     Text(subtitle, style: const TextStyle(color: Colors.grey)),
    ],
  );
}
