import 'package:bai_tap_figma1/ui/widget/components/common.dart';
import 'package:bai_tap_figma1/ui/widget/components/dummy_data.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CreateFolderDialog extends StatefulWidget {
  CreateFolderDialog({Key? key, required this.listName}) : super(key: key);

  List<String> listName;

  @override
  State<CreateFolderDialog> createState() => _CreateFolderDialogState();
}

class _CreateFolderDialogState extends State<CreateFolderDialog> {
final TextEditingController _textController = TextEditingController();
final TextEditingController _textController2 = TextEditingController();



@override
void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
    _textController2.dispose();
  }
  final _formKey = GlobalKey<FormState>();
@override
void initState() {
    // TODO: implement initState
    super.initState();
  }

String value1 = '';
String value2 = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                  child: Text('Create New Folder', style: TextStyles.textSize22)),
              SizedBox(height: 20),
              Text('New Folder :', style: TextStyles.textSize20,),
              SizedBox(height: 10),
              Common().textFromField(
                textStyle: TextStyles.textSize20,
                focus: true,
                  controller: _textController,
                  hintValue: 'New Folder Name',
                  icons: Icon(Icons.person),
                  validation: true,
                  validationError: 'Please enter some text',
                  validationCondition: (val){
                    return widget.listName.contains(val) == true ? 'da ton tai' : null ;
                  },
                  callBackSearch: (val){
                    setState(() {
                      value1 = val;
                    });
                  }),
              SizedBox(height: 20),
              Text('Date / Time :', style: TextStyles.textSize20,),
              SizedBox(height: 10),
              Common().textFromField(
                validationCondition: (val){return null;},
                hintValue: 'date/time',
                textStyle: TextStyles.textSize20,
                icons: Icon(Icons.date_range),
                controller: _textController2,
                  validation: true,
                  validationError: 'Please enter some text',
                  callBackSearch: (val){
                    setState(() {
                      value2 = val;
                    });
                  }),
              SizedBox(height: 30),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: createFolder, child: Text('Create', style: TextStyles.textSize24.copyWith(color: Colors.blue),)),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Canel', style: TextStyles.textSize24.copyWith(color: Colors.red),))
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  void createFolder() {
    print('${dummyData.where((name) => name.name.contains(value1))}');
    setState(() {
      if(_formKey.currentState!.validate()){
        var data = Folder(name: value1, date: value2);
        Navigator.of(context).pop(data);
        _textController.clear();
        _textController2.clear();
      }else{
        print('failed');
      }
    });
  }
}
