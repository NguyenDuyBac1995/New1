import 'package:bai_tap_figma1/ui/router/fluro_navigator.dart';
import 'package:bai_tap_figma1/ui/router/router_generator.dart';
import 'package:bai_tap_figma1/ui/widget/utils/assets_utils.dart';
import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../main.dart';
import '../../widget/components/common.dart';
import '../../widget/utils/colors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textUserName = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();
  String? _userName;
  String? _password;
  var value1;
  final TextEditingController _textPassword1 = TextEditingController();


  _getData() async {
    print(_userName);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    value1 = prefs.getString('$_userName');
    print(value1);
    print(_password);
    if (_fromKey.currentState!.validate()) {
      NavigatorUtils.push(context, RouterGenerator.routeHome);
    } else {
      print('Form is valid');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textUserName.addListener(() {
      _userName = _textUserName.text;
    });
    _textPassword.addListener(() {
      _password = _textPassword.text;
    });
  }

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.1,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.1,
              child: Transform.scale(
                  scale: 1.12, child: Image.asset(ImageUtils.NEN)),
            ),
            Container(
              padding: EdgeInsets.only(left: 25, top: 80, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(ImageUtils.LOGO),
                  SizedBox(height: 10),
                  Text("Welcome to", style: TextStyles.textSize20),
                  SizedBox(height: 10),
                  Text(
                    "Dirbbox",
                    style: TextStyles.textSize20
                        .copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  _showLogin ? _outText() : _textFiled(),
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text('Use Social Login',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff1B1D28), fontSize: 12)),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/Instagram Logo.svg'),
                      SizedBox(width: 50),
                      SvgPicture.asset('assets/svg/Twitter Logo.svg'),
                      SizedBox(width: 50),
                      SvgPicture.asset('assets/svg/Facebook Logo.svg'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      child: Text(
                        'Create an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      onPressed: () {
                        NavigatorUtils.push(
                            context, RouterGenerator.routeCreateAccount);
                      },
                    ))),
          ],
        ),
      ),
    );
  }

  Widget _outText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          'Best cloud storage platform for all',
          style: TextStyles.textSize14.copyWith(fontSize: 17),
        ),
        Text('business and individual to',
            style: TextStyles.textSize14.copyWith(fontSize: 17)),
        Text('manage there data',
            style: TextStyles.textSize14.copyWith(fontSize: 17)),
        SizedBox(height: 40),
        Text('Join For Free',
            style: TextStyles.textSize14.copyWith(fontSize: 17)),
        SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                height: 55,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colos.CA.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/Group.png'),
                    SizedBox(width: 5),
                    Text('Smart Id',
                        style: TextStyles.textSize14.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colos.CA))
                  ],
                ),
              ),
            ),
            Common().ButtonStyle(
                textValue: 'Sign in',
                width: 170,
                color: Colos.CA,
                callback: () {
                  print('$_showLogin');
                  setState(() {
                    _showLogin = false;
                    print('$_showLogin');
                  });
                })
          ],
        ),
      ],
    );
  }

  Widget _textFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Username or email address",
                style: TextStyles.textItem,
              ),
              SizedBox(height: 10),
              // TextFormField(
              //   style: TextStyles.textSize20,
              //   controller: _textUserName,
              //   decoration:InputDecoration(
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(width: 0.5, color: Colors.blue),
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     border: OutlineInputBorder(
              //         borderSide: BorderSide(width: 0.2, color: Color(0xffEEF2FE)),
              //         borderRadius: BorderRadius.circular(12)),
              //     prefixIcon: Icon(Icons.person),
              //   ),
              //   validator: (value)
              //   {
              //     if(value!.isEmpty){
              //       return 'Please enter some text';
              //     }else{
              //       return value1 == null ?'Username or mail does not exist' : null ;
              //     }
              //   },
              //   onChanged: (val){
              //     Provider.of<UserName>(context, listen: false).setUserName(val);
              //   },
              // ),
              Common().textFromField(
                focus: true,
                textStyle: TextStyles.textSize20,
                callBackSearch: (val) =>
                    Provider.of<UserName>(context, listen: false)
                        .setUserName(val),
                hintValue: 'Username or mail address',
                controller: _textUserName,
                icons: Icon(Icons.person),
                validation: true,
                validationError: 'Please enter some text',
                validationCondition: (val) =>
                    value1 == null ? 'Username or mail does not exist' : null,
              ),
              SizedBox(height: 14),
              Text(
                "Password",
                style: TextStyles.textItem,
              ),
              SizedBox(
                height: 10,
              ),
              Common().textFromField(
                textStyle: TextStyles.textSize20,
                controller: _textPassword,
                hintValue: 'Password',
                icons: Icon(Icons.lock),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(_obscureText
                        ? Icons.visibility_off
                        : Icons.visibility)),
                validation: true,
                validationError: 'Please enter some text',
                validationCondition: (val) =>
                    value1 != _password ? 'Password wrong' : null,
                obscureText: _obscureText,
                callBackSearch: (String val) {
                  Provider.of<Password>(context, listen: false)
                      .setPassword(val);
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Container(
                height: 55,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colos.CA.withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: Colos.CA,
                    ),
                    SizedBox(width: 5),
                    Text('Back',
                        style: TextStyles.textSize14.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colos.CA))
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  _showLogin = true;
                });
              },
            ),
            Common().ButtonStyle(
              width: 170,
              color: Colos.CA,
              textValue: 'Sign in',
              callback: () {
                setState(() {
                  _getData();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
