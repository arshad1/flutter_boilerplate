import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterappredux/controllers/login_controller.dart';
import 'package:flutterappredux/models/login/auth_model.dart';
import 'package:flutterappredux/provider/AuthProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _email = FocusNode();
  FocusNode _password = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 1080, height: 2160, allowFontScaling: false);

    return WillPopScope(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          body: SafeArea(
              top: false,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ClipPath(
                        clipper: _customWaveClipper(),
                        child: Container(
                          width: ScreenUtil().setWidth(1080),
                          height: ScreenUtil().setHeight(1200),
                          decoration: BoxDecoration(color: Color(0xfff37523)),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil()
                                    .setSp(75, allowFontScalingSelf: true),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      _emailField(),
                      _passwordField(),
                      _loginBtn(),
                    ],
                  ),
                ),
              )),
        ),
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      onWillPop: () {
        return;
      },
    );
  }

  Widget _passwordField() {
    return Container(
        width: ScreenUtil().setWidth(800),
        height: ScreenUtil().setHeight(240),
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (BuildContext context, AuthProvider data, Widget child) {
              return TextFormField(
                obscureText: true,
                controller: _passwordController,
                focusNode: _password,
                style: new TextStyle(
                  fontSize: ScreenUtil().setSp(40, allowFontScalingSelf: true),
                ),
                decoration: new InputDecoration(
                    errorText: data.passwordErrorTxt,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Password",
                    fillColor: Colors.white70),
              );
            },
          ),
        ));
  }

  Widget _emailField() {
    return Container(
        width: ScreenUtil().setWidth(800),
        height: ScreenUtil().setHeight(240),
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
        child: Center(
          child: Consumer<AuthProvider>(
            builder: (BuildContext context, AuthProvider data, Widget child) {
              return TextFormField(
                autofocus: true,
                onEditingComplete: () => _password.requestFocus(),
                focusNode: _email,
                controller: _emailController,
                style: new TextStyle(
                  fontSize: ScreenUtil().setSp(40, allowFontScalingSelf: true),
                ),
                decoration: new InputDecoration(
                    errorText: data.emailErrorTxt,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Email",
                    fillColor: Colors.white70),
              );
            },
          ),
        ));
  }

  Widget _loginBtn() {
    return Container(
        width: ScreenUtil().setWidth(800),
        height: ScreenUtil().setHeight(200),
        decoration: BoxDecoration(color: Colors.transparent),
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
        child: Consumer<AuthProvider>(
          builder: (BuildContext context, AuthProvider data, Widget child) {
            return InkWell(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              onTap: () async {
                if (data.validateForm(
                    _emailController.text, _passwordController.text)) {
                  AuthModel response = await data.requestLoginToServer();
                  LoginController.afterLoginResponseReceived(response);
                }
              }, // needed
              child: Ink(
                child: Center(
                  child: data.isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: ScreenUtil()
                                .setSp(50, allowFontScalingSelf: true),
                            color: Color(0xffffffff),
                          ),
                        ),
                ),
                // use Ink
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xfff37523),
                ),
                width: 200,
                height: 200,
              ),
            );
          },
        ));
  }
}

// ignore: camel_case_types
class _customWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
