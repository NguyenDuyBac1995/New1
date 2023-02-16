import 'package:bai_tap_figma1/ui/widget/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';


class Common {
  TextFormField textFromField( {
    String labelValue = "",
    String hintValue = "",
    bool? validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    TextStyle? textStyle,
    String? validationError,
    bool obscureText = false,
    bool isReadOnly = false,
    Widget? icons,
    Widget? suffixIcon,
    FocusNode? fn,
    bool focus = false,
    required Function(String value) callBackSearch,
    VoidCallback? callback,
    Function(String value)? validationCondition,
  }) {
    TextFormField textFormField = TextFormField(
      autofocus: focus,
      keyboardType: TextInputType.name,
      style: textStyle,
      controller: controller,
      obscureText: obscureText,
      focusNode: fn,
      onChanged: (String? val) {
        return callBackSearch(val!);
      },
      validator: (String? val) {
        if (validation!) {
          if (val!.isEmpty) {
            return validationError;
          }else{
            return validationCondition!(val);
          }
        }
      },
      decoration: InputDecoration(
        hintText: hintValue,
        prefixIcon: icons,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.black38),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
    return textFormField;
  }

  GestureDetector ButtonStyle({
    String? textValue,
    Color? color,
    double? width,
    VoidCallback? callback,
    bool icon = true,
  }) {
    return GestureDetector(
      child: Container(
        height: 55,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textValue ?? '',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(width: 5),
            icon == true
                ? Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                : Text(''),
          ],
        ),
      ),
      onTap: callback,
    );
  }

  Container FolderFont({
    Color? color,
    String? name,
    String? date,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      decoration: BoxDecoration(
          color: color!.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Stack(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Container(
                          padding: EdgeInsets.only(left: 1),
                          child: SvgPicture.asset(
                            'assets/svg/Vector (2).svg',
                            color: color,
                          )),
                    ),
                    Transform.scale(
                      scale: 1.2,
                      child: Container(
                        padding: EdgeInsets.only(top: 3),
                        child: SvgPicture.asset(
                          'assets/svg/Vector (1).svg',
                          color: color.withOpacity(0.65),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Transform.scale(
                  scale: 1.2,
                  child: SvgPicture.asset(
                    'assets/svg/More Option.svg',
                    color: color,
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            name ?? '',
            style: TextStyles.textAppBar.copyWith(color: color),
          ),
          SizedBox(height: 5),
          Text(
            date ?? "",
            style: TextStyles.textSize13.copyWith(color: color),
          )
        ],
      )),
    );
  }
  Padding ItemList({
    String? strName,
    bool value = false,
    VoidCallback? callback,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 4,
          color: value == true ? Color(0xFF567DF4) : Color(0xffE5E5E5),
        ),
        title: Text(strName ?? '',
            style: TextStyles.textItem.copyWith(
                fontWeight: value == true ? FontWeight.bold : FontWeight.w300)),
        onTap: callback,
      ),
    );
  }

  Column StorageItem({
    Color? iconColor,
    String? strNameFile,
    String? strGB,
    String? assetsSvg,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.circle, color: iconColor, size: 14),
                SizedBox(width: 10),
                Text(
                  strNameFile ?? '',
                  style: TextStyles.textSize22.copyWith(fontSize: 20),
                ),
              ],
            ),
            SvgPicture.asset(
              assetsSvg ?? '',
              height: 5.3,
            )
          ],
        ),
        SizedBox(height: 5),
        Padding(
            padding: EdgeInsets.only(left: 22, top: 4, bottom: 26),
            child: Text(strGB ?? ''))
      ],
    );
  }

  Future<void> selectedURL(String strUrl) async {
    if (!await launchUrl(Uri.parse(strUrl))) {
      throw Exception('Could not launch ${Uri.parse(strUrl)}');
    }
  }

  void showToastSuccess(BuildContext context , String strText) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content:Text( strText, style: TextStyles.textSize24.copyWith(color: Colors.blue),),
      ),
    );
  }

  void showToastError(BuildContext context , String strText) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content:Text( strText, style: TextStyles.textSize24.copyWith(color: Colors.red),),
      ),
    );
  }
}
