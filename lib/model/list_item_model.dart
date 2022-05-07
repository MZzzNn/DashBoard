import 'package:flutter/material.dart';
import '../routes_manager.dart';

class ListItemModel{
  String title;
  IconData icon;
  String routes;
  ListItemModel({required this.title, required this.icon, required this.routes});
}

List<ListItemModel> listItems = [
  ListItemModel(title: 'Home', icon: Icons.home, routes: Routes.homeRoute),
  ListItemModel(title: 'Recruitment', icon: Icons.people, routes: Routes.recruitmentRoute),
  ListItemModel(title: 'On Boarding', icon: Icons.person, routes: Routes.onBoardingRoute),
  ListItemModel(title: 'Reports', icon: Icons.assignment, routes: Routes.reportsRoute),
  ListItemModel(title: 'Calender', icon: Icons.calendar_today, routes: Routes.calenderRoute),
  ListItemModel(title: 'Settings', icon: Icons.settings, routes: Routes.settingsRoute),
];