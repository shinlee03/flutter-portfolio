import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Contact extends StatefulWidget {
  Contact({super.key});

  State<Contact> createState() => _contactState();
}

class _contactState extends State<Contact> with TickerProviderStateMixin {
  late final AnimationController _checkcontroller;
  late final AnimationController _nocontroller;

  @override
  initState() {
    super.initState();
    _checkcontroller = AnimationController(vsync: this);
    _nocontroller = AnimationController(vsync: this);
  }

  @override
  dispose() {
    _checkcontroller.dispose();
    _nocontroller.dispose();
    super.dispose();
  }

  void showSuccess() {
    _checkcontroller.reset();
    _checkcontroller.forward();
  }

  void showFailure() {
    _nocontroller.reset();
    _nocontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Column(children: <Widget>[
        Stack(children: <Widget>[
          Center(
            child: Lottie.asset(
              'lib/animations/animation_checkok.json',
              controller: _checkcontroller,
              onLoaded: (composition) {
                _checkcontroller
                  ..duration = composition.duration
                  ..addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      _checkcontroller.reset();
                      Navigator.of(context).pop();
                    }
                  });
              },
              width: 200,
              height: 200,
            ),
          ),
          Center(
            child: Lottie.asset(
              'lib/animations/animation_notok.json',
              controller: _nocontroller,
              onLoaded: (composition) {
                _nocontroller
                  ..duration = composition.duration
                  ..addStatusListener((status) {
                    if (status == AnimationStatus.completed) {
                      _nocontroller.reset();
                    }
                  });
              },
              width: 200,
              height: 200,
            ),
          ),
        ]),
        Padding(
          child: ContactForm(showSuccess: showSuccess, showFail: showFailure),
          padding: EdgeInsets.only(
            bottom: 100,
            left: 50,
            right: 50,
          ),
        ),
      ])
    ]));
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm(
      {super.key, required this.showSuccess, required this.showFail});

  final Function() showSuccess;
  final Function() showFail;
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter your email"),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Email cannot be empty.';
                } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Please enter a valid email.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Subject"),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Subject cannot be empty.';
                } else if (value.length > 150) {
                  return 'Subject is too long.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Text"),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Text cannot be empty.';
                } else if (value.length > 500) {
                  return 'Text is too long.';
                }
                return null;
              },
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("successfully processed.");
                      widget.showSuccess();
                    } else {
                      widget.showFail();
                    }
                  },
                  child: const Text("Submit!"),
                ))
          ],
        ));
  }
}
