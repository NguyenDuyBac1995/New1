import 'package:flutter/material.dart';

class Folder {
 String name;
 String date;

 Folder({ required this.name, required this.date});
}

 List<Folder> dummyData = [
  Folder(name: 'Mobile Apps', date: 'December 20.2020'),
  Folder(name: 'Svg Icons', date: 'December 14.2020'),
  Folder(name: 'Prototypes', date: 'Novemaber 22.2020'),
  Folder(name: 'Avatars', date: 'Novemaber 10.2020'),
  Folder(name: 'Design', date: 'December 20.2020'),
  Folder(name: 'Portfolio', date: 'December 14.2020'),
  Folder(name: 'References', date: 'Novemaber 22.2020'),
  Folder(name: 'Clients', date: 'December 20.2020'),
  Folder(name: 'Flutter', date: 'December 20.2020'),
  Folder(name: 'Desktop Folder', date: 'December 20.2020')
 ];
class ColorsList{
 static List<Color> color = [Color(0xff415EB6), Color(0xffFFB110),Color(0xffAC4141),Color(0xff23B0B0)];
}