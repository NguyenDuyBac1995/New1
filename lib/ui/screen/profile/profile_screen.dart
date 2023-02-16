import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:bai_tap_figma1/ui/widget/components/common.dart';
import 'package:bai_tap_figma1/ui/widget/components/dummy_data.dart';
import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _changeColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar:
          appBarCommonV1(context, strTitle: 'My Profile', suffixIcon: false),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 240,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: _changeColor?Color(0xffFFFFFF):Color(0xff22215B),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 50),
                              Transform.scale(
                                  scale: 1.2,
                                  child: SvgPicture.asset(
                                    'assets/svg/avata.svg',
                                  )),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                    color: 
                                         Color(0xffFF317B),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Text(
                                  'PRO',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'gilroy'),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Neelesh Chaudhary',
                            style: TextStyles.textSize24.copyWith(
                                fontSize: 20,
                                color: _changeColor
                                    ? Color(0xff22215B)
                                    : Color(0xffFFFFFF)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'UI / UX Designer',
                            style: TextStyles.textSize14.copyWith(
                                color: _changeColor
                                    ? Colos.LOGINTEXT1
                                    : Color(0xffFFFFFF)),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur',
                            style: TextStyles.textSize14.copyWith(
                                fontWeight: FontWeight.w100,
                                color: _changeColor
                                    ? Color(0xff22215B).withOpacity(0.6)
                                    : Color(0xffFFFFFF)),
                          ),
                          Text(
                            'adipiscing elit. Ornare pretium placerat ut ',
                            style: TextStyles.textSize14
                                .copyWith(fontWeight: FontWeight.w100,color: _changeColor
                                ? Color(0xff22215B).withOpacity(0.6)
                                : Color(0xffFFFFFF)),
                          ),
                          Text(
                            'platea.',
                            style: TextStyles.textSize14
                                .copyWith(fontWeight: FontWeight.w100,color: _changeColor
                                ? Color(0xff22215B).withOpacity(0.6)
                                : Color(0xffFFFFFF)),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _changeColor = !_changeColor;
                      });
                    },
                  ),
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Folders',
                        style: TextStyles.textAppBar,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colos.LOGINTEXT1,
                          ),
                          SizedBox(width: 25),
                          SvgPicture.asset(
                            'assets/svg/Settings.svg',
                            color: Colos.LOGINTEXT1,
                          ),
                          SizedBox(width: 25),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colos.LOGINTEXT1,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 365),
                    height: 300,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisExtent: 128,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 25),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return Common().FolderFont(
                            name: dummyData[index].name,
                            color: ColorsList.color[index % ColorsList.color.length],
                            date: dummyData[index].date,
                          );
                        }),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Uploads',
                        style: TextStyles.textAppBar,
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: SvgPicture.asset('assets/svg/Sort.svg'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Transform.scale(
                        scale: 1.25,
                        child: SvgPicture.asset('assets/svg/Word Icon.svg')),
                    title: Text(
                      'Projects.docx',
                      style: TextStyles.textAppBar,
                    ),
                    subtitle: Text(
                      'Novemaber 22.2020',
                      style: TextStyles.textSize14.copyWith(fontSize: 14),
                    ),
                    trailing: Text(
                      '300kb',
                      style: TextStyles.textSize14.copyWith(fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
