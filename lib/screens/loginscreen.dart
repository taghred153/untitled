import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/registerprovider.dart';
import 'package:untitled/screens/homescreen.dart';
import 'package:untitled/screens/signupscreen.dart';
import 'package:untitled/widgets/registerwidget.dart';

class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Login", style: TextStyle(fontSize: 24)),
        ),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 95,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/002/737/799/large_2x/online-registration-illustration-concept-free-vector.jpg"),
                ),
              ),
              const SizedBox(height: 40),
              RegisterWidget(
                  controller: emailcontroller,
                  labeltext: "Email",
                  icon: Icons.email
              ),
              const SizedBox(height: 10),
              RegisterWidget(
                  controller: passwordcontroller,
                  labeltext: "Password",
                  icon: Icons.password,
                obscuretext: true,
              ),
              const SizedBox(height: 20),
              Consumer<RegisterProvider>(
                  builder: (context, value, child){
                    return ElevatedButton(
                        onPressed: () async{
                          if (formkey.currentState!.validate()){
                            await value.loginprovider(
                                email: emailcontroller.text,
                                password: passwordcontroller.text
                            );
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => HomeScreen())
                            );
                          }
                    },
                        child: const Text("Login"));
                  },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => SignupScreen())
                        );
                      },
                      child: const Text("Signup"),
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
