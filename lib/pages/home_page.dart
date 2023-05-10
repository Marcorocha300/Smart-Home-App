// ignore: file_names
import 'package:flutter/material.dart';

import '/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Padding Constants
  final double horizontalPadding = 10;
  final double verticalPadding = 5;

  List mySmartDevices = [
    //smartDevicesName, iconPath, powerStatus
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-condicioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/smart-fan.png", true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom App Bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Color.fromARGB(255, 196, 82, 82),
                  ),
                  //account icon
                  Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            //welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome to your Home"),
                  Text(
                    "Marco mike Rocha",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            //smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text("Smart Devices"),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
