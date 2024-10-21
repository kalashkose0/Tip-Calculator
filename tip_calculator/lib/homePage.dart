import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController billAmtController = TextEditingController();

  int perCount = 1;
  int tipPercent = 0;
  num totalBillAmt = 0.0;
  num totalTipAmt = 0.0;
  num totalAmt = 0.0;
  num perPersonAmt = 0.0;
  bool isCustomtip = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F3F4),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/hat.png",
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(width: 11),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text.rich(TextSpan(
                          text: "Mr",
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                                text: "Tip",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w900)),
                          ],
                        )),
                        Text(
                          "Calculator",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Container(
                    height: 235,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total p/person",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text.rich(TextSpan(
                            text: "\$",
                            style: TextStyle(
                                fontSize: 47, fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(
                                text:
                                    "${perPersonAmt == 0.0 ? "000" : perPersonAmt.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 47, fontWeight: FontWeight.w900),
                              ),
                            ],
                          )),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Total bill",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text.rich(TextSpan(
                                    text: "\$",
                                    style: const TextStyle(
                                        fontSize: 16, color: Color(0xFF03C9BD)),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${totalBillAmt == 0.0 ? "000" : totalBillAmt.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Total tip",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text.rich(TextSpan(
                                    text: "\$",
                                    style: const TextStyle(
                                        fontSize: 16, color: Color(0xFF03C9BD)),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${totalTipAmt == 0.0 ? "000" : totalTipAmt.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Text.rich(TextSpan(
                        text: "Enter \n",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: "Your bill",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: billAmtController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixText: "\$ ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              style: BorderStyle.none,
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Text.rich(TextSpan(
                        text: "Choose \n",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: "Your tip",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      tipPercent = 10;
                                      updateTheResult();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Color(0xFF03C9BD),
                                      ),
                                      child: const Center(
                                        child: Text.rich(TextSpan(
                                          text: "10",
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                          children: [
                                            TextSpan(
                                                text: "%",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    tipPercent = 15;
                                    updateTheResult();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xFF03C9BD),
                                    ),
                                    child: const Center(
                                      child: Text.rich(TextSpan(
                                        text: "15",
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                        children: [
                                          TextSpan(
                                              text: "%",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    tipPercent = 20;
                                    updateTheResult();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xFF03C9BD),
                                    ),
                                    child: const Center(
                                      child: Text.rich(TextSpan(
                                        text: "20",
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white),
                                        children: [
                                          TextSpan(
                                              text: "%",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFF03C9BD),
                            ),
                            child: const Center(
                              child: Text(
                                "Custom tip",
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      child: Text.rich(TextSpan(
                        text: "Spit \n",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: "the total",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ],
                      )),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              if (perCount > 1) {
                                perCount--;
                              }
                              updateTheResult();
                            },
                            child: Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFF03C9BD),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16)),
                              ),
                              child: const Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                "$perCount",
                                style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              perCount++;
                              updateTheResult();
                            },
                            child: Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color(0xFF03C9BD),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16)),
                              ),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xFF03C9BD),
                    ),
                    child: const Center(
                      child: Text(
                        "Save tip",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateTheResult() {
    if (billAmtController.text != "") {
      totalBillAmt = double.parse(billAmtController.text.toString());
      totalTipAmt = totalBillAmt * (tipPercent / 100);
      totalAmt = totalBillAmt + totalTipAmt;
      perPersonAmt = totalAmt / perCount;

      setState(() {});
    } else {
      perCount = 1;
    }
  }
}
