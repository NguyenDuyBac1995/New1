import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:bai_tap_figma1/ui/widget/components/dummy_data.dart';
import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/components/common.dart';
import '../../widget/dialog/dialog_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Folder> _folderList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _folderList = dummyData;
  }

  void _readFolder(String text) {
    setState(() {
      if (text.isEmpty) {
        _folderList = dummyData;
      } else {
        _folderList = dummyData
            .where(
                (name) => name.name.toLowerCase().contains(text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV2(context, strTitle: 'Your Dribbox'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Common().textFromField(
                      callBackSearch: (val)=>_readFolder(val),
                    textStyle: TextStyles.textSize20,
                    controller: _textController,
                    hintValue: 'Search',
                    icons: Icon(
                    Icons.search,
                    color: Colos.LOGINTEXT1,
                  ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Recent',
                            style: TextStyles.textAppBar
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Transform.scale(
                              scale: 1.1,
                              child: SvgPicture.asset('assets/svg/Vector.svg')),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                              scale: 1.4,
                              child: SvgPicture.asset(
                                'assets/svg/3_gach.svg',
                              )),
                          SizedBox(width: 28),
                          Transform.scale(
                              scale: 1.4,
                              child: SvgPicture.asset(
                                'assets/svg/Group 127.svg',
                              ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 150),
                  child: _folderList.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  mainAxisExtent: 128,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: _folderList.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Common().FolderFont(
                                color: ColorsList
                                    .color[index % ColorsList.color.length],
                                name: _folderList[index].name,
                                date: _folderList[index].date);
                          })
                      : Center(
                          child:
                              Text('Not Empty', style: TextStyles.textSize24),
                        )),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Transform.scale(
        scale: 1.35,
        child: Padding(
          padding: EdgeInsets.only(bottom: 50, right: 30),
          child: FloatingActionButton(
            onPressed: () async {
              List<String> _listName = _folderList.map((e) => e.name).toList();
              Folder? newFolder =
                  await openDialog(context, listName: _listName);
              if (newFolder == null) return;
              setState(() {
                print(newFolder.name);
                print(newFolder.date);
                _folderList.add(newFolder);
              });
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colos.LOGINTEXT1,
          ),
        ),
      ),
    );
  }

  Future<Folder?> openDialog(BuildContext context,
      {required List<String> listName}) async {
    return showDialog<Folder>(
        context: context,
        builder: (context) {
          return CreateFolderDialog(listName: listName);
        });
  }
}
