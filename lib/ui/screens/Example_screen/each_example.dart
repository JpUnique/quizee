import 'package:flutter/material.dart';

class eachExample extends StatefulWidget {
  const eachExample({super.key});

  @override
  State<eachExample> createState() => _eachExampleState();
}

class _eachExampleState extends State<eachExample> {
  @override
  Widget build(BuildContext context) {
    return AndroidSmall4();
  }
}
class AndroidSmall4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.maxFinite,
      child: Column(
        children: [
          Transform(
            transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
            child: Container(
              width: 360,
              height: 801,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 94.50,
                    top: 21.50,
                    child: Container(
                      width: 223,
                      height: 96,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 128,
                            top: 0,
                            child: Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                              child: Container(
                                width: 96,
                                height: 37,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/Examples/STEP1.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 41,
                            top: 13,
                            child: Transform(
                              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                              child: Container(
                                width: 70,
                                height: 41,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Transform(
                                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                        child: Container(
                                          width: 70,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage("https://via.placeholder.com/70x38"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: -38,
                                      top: 17,
                                      child: SizedBox(
                                        width: 35,
                                        height: 3,
                                        child: Transform(
                                          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                                          child: Text(
                                            'Powered by',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 6,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 178,
                            top: 25,
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: ShapeDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: OvalBorder(
                                  side: BorderSide(width: 0.50, color: Color(0xFF2F2F2F)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 360.50,
                    top: 140.50,
                    child: Transform(
                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                      child: Container(
                        width: 360,
                        height: 360,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/360x360"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 360.50,
                    top: 500.50,
                    child: Transform(
                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(1.57),
                      child: Container(
                        width: 301,
                        height: 360,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 65,
                              top: 36,
                              child: Container(
                                width: 171,
                                height: 257,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 36,
                                      top: 0,
                                      child: Text(
                                        'STEP 1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 6,
                                      top: 42,
                                      child: Text(
                                        'Brushing Teeth',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 6,
                                      top: 117,
                                      child: SizedBox(
                                        width: 159,
                                        child: Text(
                                          'Use a children toothbrush',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 210,
                                      child: Container(
                                        width: 171,
                                        height: 47,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 171,
                                                height: 47,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFB7B7B7),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 25,
                                              top: 10,
                                              child: Text(
                                                'NEXT STEP',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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