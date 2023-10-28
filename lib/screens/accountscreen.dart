import 'package:flutter/material.dart';
import 'package:login_form/utils/style.dart';

class AccountScreen extends StatefulWidget {
  final String? personEmail;

  const AccountScreen({super.key, this.personEmail});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<ServicesData> servicesList = [
    ServicesData(Icons.connected_tv_rounded, "television"),
    ServicesData(Icons.cloud_upload_outlined, "cloud Upload"),
    ServicesData(Icons.ac_unit, "ac Unit"),
    ServicesData(Icons.add_circle_outline, "doctor Appointment"),
    ServicesData(Icons.add_alarm_sharp, "alarm"),
    ServicesData(Icons.camera_alt_outlined, "camera"),
    ServicesData(Icons.account_balance_wallet_outlined, "wallet"),
    ServicesData(Icons.account_circle_outlined, "account"),
    ServicesData(Icons.connected_tv_rounded, "television"),
    ServicesData(Icons.cloud_upload_outlined, "cloud Upload"),
    ServicesData(Icons.ac_unit, "ac Unit"),
    ServicesData(Icons.add_circle_outline, "doctor Appointment"),
    ServicesData(Icons.add_alarm_sharp, "alarm"),
    ServicesData(Icons.camera_alt_outlined, "camera"),
    ServicesData(Icons.account_balance_wallet_outlined, "wallet"),
    ServicesData(Icons.account_circle_outlined, "account"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: shadowColor,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: blackColor,
                          ))),
                  const Expanded(
                      child: Center(
                          child: Text(
                    "account",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ))),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: blackColor, borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(60)),
                          child: const Icon(
                            Icons.person_outline,
                            color: blackColor,
                            size: 30,
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ritesh Kumar",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: whiteColor),
                        ),
                        const Text(
                          "7078277678",
                          style: TextStyle(fontSize: 12, color: whiteColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.personEmail!,
                              style: const TextStyle(
                                  fontSize: 12, color: whiteColor),
                            ),
                            Container(
                                padding: const EdgeInsets.all(3),
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.check,
                                  size: 10,
                                  color: whiteColor,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: whiteColor, width: 0.3),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: whiteColor,
                          size: 15,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            gradient: const LinearGradient(
                              colors: [redColor, orangeRedColor],
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.room_service,
                            color: whiteColor,
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "my services",
                        style: TextStyle(color: blackColor),
                      )
                    ],
                  )),
                  Expanded(
                    child: Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  gradient: const LinearGradient(
                                    colors: [redColor, orangeColor],
                                  ),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: const Icon(
                                  Icons.notifications_none,
                                  color: whiteColor,
                                )),
                            Positioned(
                                top: 0.0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 17,
                                  height: 17,
                                  padding: const EdgeInsets.all(3),
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Text(
                                    "1",
                                    style: TextStyle(
                                        color: whiteColor, fontSize: 11),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "notification",
                          style: TextStyle(color: blackColor),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            gradient: const LinearGradient(
                              colors: [primaryColor, blueColor],
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.settings,
                            color: whiteColor,
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "settings",
                        style: TextStyle(color: blackColor),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(servicesList.length, (index) {
                        return Container(
                          margin: const EdgeInsets.all(7),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: shadowColor,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Icon(
                                  servicesList[index].icon,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  servicesList[index].servicesName,
                                  style: const TextStyle(
                                      color: blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: grayColor,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesData {
  final IconData icon;
  final String servicesName;

  ServicesData(this.icon, this.servicesName);
}
