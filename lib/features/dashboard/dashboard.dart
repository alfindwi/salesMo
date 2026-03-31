import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8BCF74),
                  Color(0xFFD4D95B),
                  Color(0xFFEDDD53),
                ],
                stops: [0.09, 0.85, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi Alvin Dwi!',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'wdqoqwudbwoqdbowi',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/images/gyj.jpg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 140,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 10),
                BoxShadow(blurRadius: 10, offset: const Offset(0, 2)),
              ],
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Rp. ',
                          style: TextStyle(
                            fontSize: 24,
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: obscure ? '••••••••••' : '1.000.000', // ganti titik titik sesuai dengan jumlah digit nominal
                          style: TextStyle(
                            fontSize: 24,
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: obscure
                        ? HugeIcon(
                            icon: HugeIcons.strokeRoundedViewOff,
                            color: Colors.black,
                            size: 25,
                          )
                        : HugeIcon(
                            icon: HugeIcons.strokeRoundedView,
                            color: Colors.black,
                            size: 25,
                          ),
                    onPressed: () {
                      setState(() => obscure = !obscure);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
