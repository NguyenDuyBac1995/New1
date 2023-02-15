import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:bai_tap_figma1/ui/widget/components/common.dart';
import 'package:bai_tap_figma1/ui/widget/utils/colors.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _textUserName = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();

 String? strName  ;
 String? strPassword ;
 var checkUserName;


  final _formKey = GlobalKey<FormState>();
  getAccount() async {
    print(strName);
    print(strPassword);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checkUserName = prefs.getString('$strName');
    if(_formKey.currentState!.validate()){
      await prefs.setString('$strName', '$strPassword');
      Common().showToastSuccess(context, "Create account success");
    }
  }


  bool _obscureText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textUserName.addListener(() {
     strName = _textUserName.text ;
    });
    _textPassword.addListener(() {
      strPassword = _textPassword.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          appBarCommonV1(context,color: false,suffixIcon: false),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,
          horizontal: 25,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: TextStyles.textSize24.copyWith(fontSize: 32),),
              SizedBox(height: 50),
              Text(
                "Username or email address",
                style: TextStyles.textItem,
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyles.textSize20,
                controller: _textUserName,
                decoration:InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.2, color: Color(0xffEEF2FE)),
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value)
                  {
                    print(checkUserName);
                    if(value!.isEmpty){
                      return 'Please enter some text';
                    }else{
                     return checkUserName != null ?'Account already exist' : null ;
                    }
                  },
              ),
              SizedBox(height: 50),
              Text(
                "Password",
                style: TextStyles.textItem,
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyles.textSize20,
                controller: _textPassword,
                obscureText: _obscureText,
                decoration:InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.2, color: Color(0xffEEF2FE)),
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility)),
                ),
                validator: (String? value)
                {
                   if(value!.isEmpty){
                     return 'Please enter some text';
                   }else{
                     return value.length < 6 ? 'Password too short': null;
                   }
                },
              ),
              // Common().textFromField(
              //   icons: Icon(Icons.person),
              //   textStyle: TextStyles.textSize20,
              //   controller: _textUserName,
              //   validation: true,
              //   validationError: 'Please enter some text',
              //   validationC: checkUserName != null ?'Account da ton tai' : null ,
              // ),
              SizedBox(height: 50),
              Common().ButtonStyle(
                color: Colos.CA,
                textValue: 'Create Account',
                width: MediaQuery.of(context).size.width,
                icon: false,
                callback: (){
                  getAccount();
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
