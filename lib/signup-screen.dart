import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 bool _securetext = true;
 TextEditingController nameController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController pswdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              color: Colors.deepPurpleAccent,
              child: const Center(
                child:  CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: Text("SIGNUP",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    color: Colors.deepPurpleAccent,
                    fontSize: 25),),),),),
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.6,
              decoration:  const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80),
                  topLeft: Radius.circular(80)),),
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  field(nameController, "Username", Icons.person, TextInputType.name),
                  field(emailController, "Email Address", Icons.email_sharp, TextInputType.emailAddress),
                  TextField(
                    cursorColor: Colors.deepPurpleAccent,
                    cursorHeight: 28,
                    controller: pswdController,
                    decoration:   InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.8),),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2.3),),
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.grey),
                      helperText: "Atleast 6 characters",
                      helperStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                      counterStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                      prefixIcon: const Icon(Icons.lock_sharp, color: Colors.grey,),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _securetext = !_securetext;
                          });
                        }, 
                        icon: Icon(_securetext ? Icons.visibility_off: Icons.visibility,
                        color: Colors.deepPurpleAccent,),),),
                    keyboardType: TextInputType.number,
                    obscureText: _securetext,
                    maxLength: 6,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.07,
                    width:  MediaQuery.of(context).size.width*0.8,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent),
                      onPressed: (){}, 
                      icon: const Icon(Icons.login_sharp,size: 35,), 
                      label: const Text("Signup",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,),)),
                  )
                ]),
            ),
          ]),
      ),
    );
  }
}
Widget field(TextEditingController controller, String text, IconData icon, TextInputType type){
  return TextField(
    controller: controller,
    cursorColor: Colors.deepPurpleAccent,
    cursorHeight: 28,
    decoration:  InputDecoration(
    enabledBorder:  const UnderlineInputBorder(
     borderSide: BorderSide(
      color: Colors.grey,
      width: 1.8),),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
       color: Colors.deepPurpleAccent,
       width: 2.3)
       ),
      labelText: text,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: Colors.grey,),),
      keyboardType: type,
      );
}