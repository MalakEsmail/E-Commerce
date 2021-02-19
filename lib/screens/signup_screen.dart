import 'package:e_commerce/constants.dart';
import 'package:e_commerce/provider/modalhud.dart';
import 'package:e_commerce/screens/users/home_screen.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'signup';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email, _password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('images/icons/buy.png'),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          'Buy It',
                          style:
                              TextStyle(fontFamily: 'pacifico', fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  hint: 'Enter Your Name',
                  icon: Icons.perm_identity,
                  onClick: (value) {},
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  onClick: (value) {
                    _email = value;
                  },
                  hint: 'Enter Your Email',
                  icon: Icons.email,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  onClick: (value) {
                    _password = value;
                  },
                  hint: 'Enter Your Password',
                  icon: Icons.lock,
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder: (context) => FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () async {
                      final modalHud =
                          Provider.of<ModalHud>(context, listen: false);
                      modalHud.changeIsLoading(true);
                      if (_globalKey.currentState.validate()) {
                        _globalKey.currentState.save();
                        try {
                          final authResult =
                              await _auth.signUp(_email, _password);
                          modalHud.changeIsLoading(false);
                          Navigator.of(context).pushNamed(HomeScreen.id);
                        } catch (e) {
                          modalHud.changeIsLoading(false);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e.message),
                          ));
                        }
                      }
                      modalHud.changeIsLoading(false);
                    },
                    color: Colors.black,
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account ?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
