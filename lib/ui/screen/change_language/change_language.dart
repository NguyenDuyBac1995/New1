import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:bai_tap_figma1/ui/widget/components/common.dart';
import 'package:flutter/material.dart';

import '../../widget/utils/colors.dart';
import '../../widget/utils/text_styles.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  List _languageItem = ['Vietnamese','English','Korean','Japanese', 'Arabic'];
  int _indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,color: false, suffixIcon: false),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Change Language', style: TextStyles.textSize24.copyWith(fontSize: 32),),
            SizedBox(height: 50),
            Container(
              height: 580,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, index){
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                        decoration: BoxDecoration(
                          color: _indexSelected == index? Colors.blue:Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 0.5, color:_indexSelected == index? Colors.transparent:Colors.black38)
                        ),
                        child: Text(_languageItem[index],style: TextStyles.textItem.copyWith(color: _indexSelected == index? Colors.white:Colos.DAtext ),),
                      ),
                      onTap: (){
                        setState(() {
                          _indexSelected = index;
                        });
                      },
                    );
                  }, separatorBuilder: (BuildContext context, index){
                return SizedBox(height: 15);
              } ,
                  itemCount: _languageItem.length),
            ),

            Common().ButtonStyle(textValue: 'Change password',color: Colors.blueAccent, icon: false, callback:(){
              Common().showToastSuccess(context, 'Change language success');
            } )
          ],
        ),
      ),
    );
  }
}
