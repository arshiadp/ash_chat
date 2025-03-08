import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() {
    return _AuthenticationScreenState();
  }
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;

  var _enterdEmail = '';
  var _enterdPassword = '';

  void _submit() {
    final isValid = _form.currentState!.validate(); //! it will not be null
    if (isValid) {
      _form.currentState!.save();
      //use those values to send our auth request
      print(_enterdEmail);
      print(_enterdPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect:
                                false, //to ensure email add won't get autocorrected
                            textCapitalization:
                                TextCapitalization
                                    .none, //to ensutre email add won't get capitalized and wont be uppercase
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null; //if we dont make it into if check then we have to return null
                            },
                            onSaved: (value) {
                              _enterdEmail = value!;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText:
                                true, //to hide the password as they are being enterd
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null; //if we dont make it into if check then we have to return null
                            },
                            onSaved: (value) {
                              _enterdPassword = value!;
                            },
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                            ),
                            child: Text(_isLogin ? "Login" : 'Signup'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin; //_isLogin ? true : false;
                              });
                            },
                            child: Text(
                              _isLogin
                                  ? 'I don\'t have an account. Signup'
                                  : 'I already have an account. Login',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
