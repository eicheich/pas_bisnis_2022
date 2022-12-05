import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pas_bisnis_2022/view/Home.dart';
import 'package:pas_bisnis_2022/view/Login.dart';
import 'package:pas_bisnis_2022/shared/Share.dart';
import 'package:pas_bisnis_2022/view/Navigation.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  PreferredSize(
                    preferredSize: Size.fromHeight(0.0),
                    child: SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      stretch: false,
                      pinned: true,
                      floating: false,
                      // expandedHeight: 377,
                      collapsedHeight:
                          MediaQuery.of(context).size.height / 2.38,
                      elevation: 3,
                      shadowColor: Color(0xFF1B1B1B).withOpacity(0.25),
                      title: Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "Profile",
                          style: SharedCode().textStyle(
                              "Lexend", 20, Color(0xFF1B1B1B), FontWeight.w400),
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                        children: [
                          SizedBox(height: 125),
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("assets/images/account.png"),
                          ),
                          Container(
                            width: 250,
                            margin: EdgeInsets.only(top: 15),
                            child: Text(
                              snapshot.data?.email != null
                                  ? snapshot.data!.email!
                                      .replaceAll("@gmail.com", "")
                                      .replaceAll(".", " ")
                                      .toTitleCase()
                                  : "guest " + snapshot.data!.uid,
                              style: SharedCode().textStyle("Lexend", 18,
                                  Color(0xFF1B1B1B), FontWeight.w500),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3.5),
                            child: Text(
                              snapshot.data?.email != null
                                  ? snapshot.data!.email!
                                  : "",
                              style: SharedCode().textStyle("Lexend", 15,
                                  Color(0xFF1B1B1B), FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 34,
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 3, top: 3),
                                alignment: Alignment.center,
                                height: 27,
                                width: 190,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(24, 23, 19, 1),
                                    width: 1.5,
                                  ),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              snapshot.data?.email != null
                                  ? GestureDetector(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 27,
                                        width: 190,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1B1B1B),
                                        ),
                                        child: Text(
                                          "Edit Profile",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Lexend',
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 27,
                                        width: 190,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1B1B1B),
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Lexend',
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      )),
                    ),
                  )
                ],
                body: snapshot.data!.email != null
                    ? SingleChildScrollView(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 24, right: 24),
                                child: Text(
                                  "Account Settings",
                                  style: SharedCode().textStyle("Lexend", 20,
                                      Color(0xFF1B1B1B), FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              SharedCode().listProfileSetting(
                                  "assets/images/address.png",
                                  "Address Book",
                                  "Manage your address info",
                                  Colors.white),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Divider(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              SharedCode().listProfileSetting(
                                  "assets/images/language.png",
                                  "Language",
                                  "Change your language",
                                  Colors.white),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Divider(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              SharedCode().listProfileSetting(
                                  "assets/images/notification.png",
                                  "Notification",
                                  "Manage notifications setting",
                                  Colors.white),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 24, right: 24),
                                child: Text(
                                  "Information",
                                  style: SharedCode().textStyle("Lexend", 20,
                                      Color(0xFF1B1B1B), FontWeight.w500),
                                ),
                              ),
                              SharedCode().listProfileInformation(
                                  "assets/images/information.png",
                                  "General Help",
                                  Colors.white),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Divider(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              SharedCode().listProfileInformation(
                                  "assets/images/terms.png",
                                  "Terms and Conditions",
                                  Colors.white),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, right: 24),
                                child: Divider(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              SharedCode().listProfileInformation(
                                  "assets/images/shield.png",
                                  "Privacy Policy",
                                  Colors.white),
                              SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // show dialog logout
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Logout"),
                                          content: Text(
                                              "Are you sure to logout? :("),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel")),
                                            TextButton(
                                                onPressed: () {
                                                  FirebaseAuth.instance
                                                      .signOut();
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Login()));
                                                },
                                                child: Text("Logout")),
                                          ],
                                        );
                                      });
                                },
                                child: SharedCode().listProfileInformation(
                                    "assets/images/logout.png",
                                    "Log Out",
                                    Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              );
            } else {
              return Text("");
            }
          }),
    );
  }
}
