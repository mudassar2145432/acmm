// import 'package:acm/HomeScreens/Dashboard.dart';
// import 'package:acm/Widgets/Auth/fields.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Login extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<Login> {
//   String _userID = '';
//   String _password = '';
//   String _message = '';

//   Future<void> _login() async {
//     final String apiUsername = 'abapdev'; // replace with actual API username
//     final String apiPassword = 'pakistan'; // replace with actual API password
//     final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiUsername:$apiPassword'));

//     try {
//       final response = await http.get(
//         Uri.parse('http://paldev.volta.com.pk:8100/sap/opu/odata/sap/ZXPL_MOBILE_API_SRV/LoginSet?sap-client=300'),
//         headers: {
//           'Authorization': basicAuth,
//           'Accept': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//         final List<dynamic> entries = responseData['d']['results'];

//         bool userFound = false;
//         for (var entry in entries) {
//           if (entry['Username'] == _userID && entry['Password'] == _password) {
//             userFound = true;
//             break;
//           }
//         }

//         if (userFound) {
//           setState(() {
//             _message = 'You are logged in';
//           });
//           print("Navigating to Dashboard"); // Debug print statement
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Dashboard(),
//             ),
//           );
//         } else {
//           setState(() {
//             _message = 'User data wrong';
//           });
//         }
//       } else {
//         setState(() {
//           _message = 'Error fetching user data: ${response.statusCode}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _message = 'An error occurred: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isButtonEnabled = _userID.isNotEmpty && _password.isNotEmpty;
//     final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     SizedBox(height: MediaQuery.of(context).padding.top + 30),
//                     Container(
//                       height: 150,
//                       child: Image.asset("assets/logo.png"),
//                     ),
//                     SizedBox(height: 10),
//                     Icon(
//                       Icons.account_circle_outlined,
//                       size: 100,
//                       color: Color.fromARGB(255, 148, 148, 148),
//                     ),
//                     SizedBox(height: 20),
//                     Authfields(
//                       label: "User ID",
//                       obscuretext: false,
//                       onChanged: (value) {
//                         setState(() {
//                           _userID = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     Authfields(
//                       label: "Password",
//                       obscuretext: true,
//                       onChanged: (value) {
//                         setState(() {
//                           _password = value;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 15),
//                     Container(
//                       height: 40,
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: isButtonEnabled ? _login : null,
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                             isButtonEnabled
//                                 ? Colors.blue.shade900
//                                 : Color.fromARGB(255, 250, 249, 249),
//                           ),
//                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                         ),
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: isButtonEnabled
//                                 ? Colors.white
//                                 : Color.fromARGB(246, 201, 200, 200),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       "Forgot Password?",
//                       style: TextStyle(color: Colors.blue.shade900, fontSize: 13),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       _message,
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Image.asset(
//             "assets/sap.png",
//             height: 50,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:acm/HomeScreens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  String _userID = '';
  String _password = '';
  String _message = '';

 /* Future<void> _login() async {
    final String apiUsername = 'abapdev'; // replace with actual API username
    final String apiPassword = 'pakistan'; // replace with actual API password
    final String basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiUsername:$apiPassword'));

    try {
      final response = await http.get(
        Uri.parse('http://paldev.volta.com.pk:8100/sap/opu/odata/sap/ZXPL_MOBILE_API_SRV/LoginSet?sap-client=300'),
        headers: {
          'Authorization': basicAuth,
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> entries = responseData['d']['results'];

        bool userFound = false;
        for (var entry in entries) {
          if (entry['Username'] == _userID && entry['Password'] == _password) {
            userFound = true;
            break;
          }
        }

        if (userFound) {
          setState(() {
            _message = 'You are logged in';
          });
          print("Navigating to Dashboard"); // Debug print statement
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(),
            ),
          );
        } else {
          setState(() {
            _message = 'User data wrong';
          });
        }
      } else {
        setState(() {
          _message = 'Error fetching user data: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'An error occurred: $e';
      });
    }
  }*/

  final ApiService apiService = ApiService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled = _userID.isNotEmpty && _password.isNotEmpty;
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + 30),
                    Container(
                      height: 150,
                      child: Image.asset("assets/logo.png"),
                    ),
                    SizedBox(height: 10),
                    Icon(
                      Icons.account_circle_outlined,
                      size: 100,
                      color: Color.fromARGB(255, 148, 148, 148),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Email'
                      )
                      ,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Password'
                      )
                      ,
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: ()async{
                          await apiService.fetchData(email.text,password.text);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                                 Color.fromARGB(255, 250, 249, 249),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isButtonEnabled
                                ? Colors.white
                                : Color.fromARGB(246, 201, 200, 200),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue.shade900, fontSize: 13),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _message,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/sap.png",
            height: 50,
          ),
        ],
      ),
    );
  }
}

class ApiService {

  Future<void> fetchData(String email, String pass) async {
    final String url = "http://paldev.volta.com.pk:8100/sap/opu/odata/sap/ZXPL_MOBILE_API_SRV/LoginSet(ImUserName='${email.toString()}',ImPassword='${pass.toString()}')?sap-client=300";

    var headers = {
      'Authorization': 'Basic QWJhcGRldjpwYWtpc3Rhbg==',
      'Cookie': 'MYSAPSSO2=AjQxMDMBABhBAEIAQQBQAEQARQBWACAAIAAgACAAIAACAAYzADAAMAADABBQAEEARAAgACAAIAAgACAABAAYMgAwADIANAAwADUAMwAxADAANQAzADYABQAEAAAACAYAAlgACQACRQD%2fAPswgfgGCSqGSIb3DQEHAqCB6jCB5wIBATELMAkGBSsOAwIaBQAwCwYJKoZIhvcNAQcBMYHHMIHEAgEBMBowDjEMMAoGA1UEAxMDUEFEAggKIBUIJRJFATAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNTMxMDUzNjQxWjAjBgkqhkiG9w0BCQQxFgQUq1q2u0Uyz2eHxLjl%21G0%21w4SJKHowCQYHKoZIzjgEAwQuMCwCFBIMXS%2fKgekVcrVTo22G0bsIaAusAhRq1warfOXZ4akfj33Dj0E2DnA8Hw%3d%3d; SAP_SESSIONID_PAD_300=NVM1FTJr7vnrPnXinsDgb4m8Cj0fGRHvgWQAUFarMyE%3d; sap-usercontext=sap-client=300'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      Get.to(()=> Dashboard());
      Get.snackbar('Successfully Sign in', 'Enjoy your sap app!');

    } else {
      print(response.reasonPhrase);
      Get.snackbar('Failed Sign in', response.body.toString());

    }
  }
}