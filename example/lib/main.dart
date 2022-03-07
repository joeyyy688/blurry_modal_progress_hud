import '../screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../colors/colors.dart';
import '../mediaQuery/sizeHelpers.dart';
import '../widgets/customTextField.dart';
import '../widgets/labelText.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LandingPage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        LandingPage.routeName: (context) => LandingPage()
      },
    );
  }
}

class LandingPage extends StatefulWidget {
  static const routeName = '/landingPage';
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: SpinKitFadingCircle(
        color: purpleColor,
        size: 90.0,
      ),
      dismissible: false,
      opacity: 0.4,
      color: black97Color,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'SIGN IN',
            style: TextStyle(
              fontSize: displayWidth(context) * 0.060,
              color: blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              LabelText(
                labelValue: 'Email',
              ),
              CustomTextField(
                controller: emailController,
                hintText: 'email',
                keybaordType: TextInputType.emailAddress,
              ),
              LabelText(
                labelValue: 'Password',
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'password',
                keybaordType: TextInputType.name,
              ),
              Container(
                height: displayHeight(context) * 0.074,
                width: displayWidth(context) * 0.68,
                margin: displayWidth(context) == 320.0
                    ? EdgeInsets.symmetric(
                        vertical: displayHeight(context) * 0.09)
                    : EdgeInsets.symmetric(
                        vertical: displayHeight(context) * 0.1),
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: purpleColor,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      await Future.delayed(Duration(seconds: 6), () {
                        setState(() {
                          isLoading = !isLoading;
                        });
                      });
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: whiteColor,
                        fontFamily: 'LibreBaskerville',
                        fontSize: displayWidth(context) * 0.056,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
