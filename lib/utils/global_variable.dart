import 'package:alert_us/screens/home_screen.dart';
import 'package:alert_us/screens/news_screen.dart';
import 'package:flutter/material.dart';

List<Widget> homeScreenItems = [HomeScreen(), NewsScreen(), Text('dashboard')];

List<String> address = ['latitude', 'longitude', 'fullAddress'];

late String username;

late String uid;
