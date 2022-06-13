import 'package:flutter/material.dart';
import 'package:google_signin/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Login")),
        ),
        body: loginUI());
  }

  loginUI() {
    return Consumer<LoginController>(builder: (context, model, child) {
      if (model.userDetails != null) {
        return loggedInUi(model);
      } else {
        return loginControllers(context);
      }
    });
  }

  loggedInUi(LoginController model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage:
                Image.network(model.userDetails!.photoUrl ?? "").image,
            radius: 50,
          ),
          Text(model.userDetails!.displayName ?? ""),
          Text(model.userDetails!.email ?? ""),
          ActionChip(
              avatar: const Icon(Icons.logout),
              label: const Text("logout"),
              onPressed: () {
                Provider.of<LoginController>(context, listen: false).logout();
              })
        ],
      ),
    );
  }

  loginControllers(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: Row(children: [
            const SizedBox(
              width: 30,
            ),
            Image.network(
              "https://avatars.githubusercontent.com/u/1342004?s=280&v=4",
              height: 50,
            ),
            const SizedBox(
              width: 30,
            ),
            const Text(
              "Sign in with Google",
              style: TextStyle(color: Colors.black),
            )
          ]),
          onPressed: () {
            Provider.of<LoginController>(context, listen: false).googleLogin();
          },
        ),
      ),
    );
  }
}
