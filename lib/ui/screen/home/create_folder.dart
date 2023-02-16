import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:flutter/material.dart';

class CreateFolder extends StatefulWidget {
  const CreateFolder({Key? key}) : super(key: key);

  @override
  State<CreateFolder> createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  List color =['black', ' red', 'white'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context,suffixIcon: false,color: false),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 10,
              itemBuilder: (BuildContext context , index){
                return Container(
                  height: 30,
                  child: Text(color[index%color.length])
                );
              }),
        ),
      ),
    );
  }
}
