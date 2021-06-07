import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LayoutAssignmentApp());

class LayoutAssignmentApp extends StatefulWidget {
  @override
  _LayoutAssignmentAppState createState() => _LayoutAssignmentAppState();
}

class _LayoutAssignmentAppState extends State<LayoutAssignmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent.shade100,
        appBar: AppBar(
          leading: Icon(Icons.touch_app_outlined),
          title: Text('My IoT Manager'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Device_Card(
                    deviceIcon: Icons.phone_iphone,
                    deviceName: 'Smartphone',
                    deviceStatus: true,
                  ),
                  Device_Card(
                    deviceIcon: Icons.tv,
                    deviceName: 'Smart TV',
                    deviceStatus: false,
                  ),
                  Device_Card(
                    deviceIcon: Icons.watch,
                    deviceName: 'Smart watch',
                    deviceStatus: true,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Device_Card(
                    deviceIcon: CupertinoIcons.eyeglasses,
                    deviceName: 'Smart glasses',
                    deviceStatus: false,
                  ),
                  Device_Card(
                    deviceIcon: Icons.laptop,
                    deviceName: 'Smart laptop',
                    deviceStatus: true,
                  ),
                  Device_Card(
                    deviceIcon: Icons.camera,
                    deviceName: 'Smart camera',
                    deviceStatus: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Device_Card extends StatefulWidget {
  IconData deviceIcon;
  String deviceName;
  bool deviceStatus;
  Color cardColor;

  Device_Card({this.deviceIcon, this.deviceName, this.deviceStatus});

  @override
  _Device_CardState createState() => _Device_CardState();
}

class _Device_CardState extends State<Device_Card> {
  @override
  Widget build(BuildContext context) {
    if (widget.deviceStatus == true) {
      widget.cardColor = Colors.white;
      if (widget.deviceIcon == Icons.mobile_off)
        widget.deviceIcon = Icons.phone_iphone;
      if (widget.deviceIcon == Icons.visibility_off)
        widget.deviceIcon = CupertinoIcons.eyeglasses;
      if (widget.deviceIcon == Icons.tv_off) widget.deviceIcon = Icons.tv;
      if (widget.deviceIcon == Icons.phonelink_off)
        widget.deviceIcon = Icons.laptop;
      if (widget.deviceIcon == Icons.timer_off) widget.deviceIcon = Icons.watch;
      if (widget.deviceIcon == Icons.motion_photos_off)
        widget.deviceIcon = Icons.camera;
    } else {
      widget.cardColor = Colors.grey.shade400;
      if (widget.deviceIcon == Icons.phone_iphone)
        widget.deviceIcon = Icons.mobile_off;
      if (widget.deviceIcon == CupertinoIcons.eyeglasses)
        widget.deviceIcon = Icons.visibility_off;
      if (widget.deviceIcon == Icons.tv) widget.deviceIcon = Icons.tv_off;
      if (widget.deviceIcon == Icons.laptop)
        widget.deviceIcon = Icons.phonelink_off;
      if (widget.deviceIcon == Icons.watch) widget.deviceIcon = Icons.timer_off;
      if (widget.deviceIcon == Icons.camera)
        widget.deviceIcon = Icons.motion_photos_off;
    }

    return RaisedButton(
      color: widget.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(33.0),
        child: Column(
          children: [
            Icon(widget.deviceIcon),
            Text(widget.deviceName),
            SizedBox(
              height: 11.0,
            ),
            Text(widget.deviceStatus == true ? 'ON' : 'OFF'),
          ],
        ),
      ),
      onPressed: () {
        setState(() {
          if (widget.deviceStatus == true) {
            widget.deviceStatus = false;
            widget.cardColor = Colors.blue;
          } else {
            widget.deviceStatus = true;
            widget.cardColor = Colors.white;
          }
        });
      },
    );
  }
}
