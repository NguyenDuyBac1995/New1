import 'package:bai_tap_figma1/main.dart';
import 'package:bai_tap_figma1/ui/widget/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widget/components/common.dart';
import '../../widget/utils/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  String? _passwordNew;
  String? val;

  final _formKey = GlobalKey<FormState>();

  setPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      await prefs.setString(
          Provider.of<UserName>(context, listen: false).userName,
          '$_passwordNew');
      Common().showToastSuccess(context, "Change password success");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommonV1(context, suffixIcon: false, color: false),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change Password',
                style: TextStyles.textSize24.copyWith(fontSize: 32),
              ),
              SizedBox(height: 50),
              Text(
                "Current Password",
                style: TextStyles.textItem,
              ),
              SizedBox(height: 10),
              Common().textFromField(
                textStyle: TextStyles.textSize20,
                controller: _textController1,
                obscureText: _obscureText1,
                icons: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText1 = !_obscureText1;
                      });
                    },
                    icon: Icon(_obscureText1
                        ? Icons.visibility_off
                        : Icons.visibility)),
                validation: true,
                validationError: 'Please enter some text',
                validationCondition: (val) => val !=
                        Provider.of<Password>(context, listen: false).passWord
                    ? 'Password wrong'
                    : null,
                callBackSearch: (String value) {},
              ),
              SizedBox(height: 40),
              Text("New Password", style: TextStyles.textItem),
              SizedBox(height: 10),
              Common().textFromField(
                  textStyle: TextStyles.textSize20,
                  controller: _textController2,
                  obscureText: _obscureText2,
                  icons: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                      icon: Icon(_obscureText2
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  validation: true,
                  validationError: 'Please enter some text',
                  validationCondition: (val) {
                    if (val.length < 6) {
                      return 'Password too short';
                    } else {
                      return val ==
                              Provider.of<Password>(context, listen: false)
                                  .passWord
                          ? 'Password already exist'
                          : null;
                    }
                  },
                  callBackSearch: (String value) {
                    _passwordNew = value;
                  }),
              SizedBox(height: 40),
              Text("Confirm new password", style: TextStyles.textItem),
              SizedBox(height: 10),
              Common().textFromField(
                textStyle: TextStyles.textSize20,
                controller: _textController3,
                obscureText: _obscureText3,
                icons: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText3 = !_obscureText3;
                      });
                    },
                    icon: Icon(_obscureText3 == 3
                        ? Icons.visibility_off
                        : Icons.visibility)),
                validation: true,
                validationError: 'Please enter some text',
                validationCondition: (val) =>
                    val != _passwordNew ? 'Password does not match' : null,
                callBackSearch: (String value) {},
              ),
              SizedBox(height: 230),
              Common().ButtonStyle(
                  color: Colors.blue,
                  icon: false,
                  textValue: 'Change Password',
                  callback: () {
                    setPassword();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
