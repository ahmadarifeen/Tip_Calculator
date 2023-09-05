import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  final formKey = GlobalKey<FormState>();
  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();
  static const Color containerColor = Color(0xFFF5F8FB);
  static const Color textBlack = Color(0xFF232323);
  static const Color textLightBlack = Color(0xFF717171);
  static const Color clearButtonColor = Color(0xFFFF7511);

  double totalBill = 0.00;
  int totalPersons = 5;
  double tipAmount = 20.00;

  Widget spacer(double height) {
    return SizedBox(height: height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tip Calculator",
          style: TextStyle(
            color: textBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Total Bill",
                        style: TextStyle(color: textLightBlack),
                      ),
                      Text(
                        "\$ ${totalBillController.text}",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: textBlack,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Persons",
                                style: TextStyle(color: textLightBlack),
                              ),
                              Text(
                                totalPersons.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: textBlack,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Tip Amount",
                                style: TextStyle(color: textLightBlack),
                              ),
                              Text(
                                "\$ ${tipAmount.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: textBlack,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount Per Person",
                        style: TextStyle(color: textLightBlack),
                      ),
                      Text(
                        "\$ 0.0",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: textBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                spacer(300),
                Text(
                  "Total Bill",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: textBlack,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: totalBillController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Please enter total bill",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: textLightBlack,
                    ),
                    suffixIcon: const Icon(
                      Icons.attach_money,
                      color: textBlack,
                    ),
                    filled: true,
                    fillColor: containerColor,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    if (value.isEmpty) {
                      totalBillController.text = "0.00";
                    }
                    totalBillController.text = value.toString();
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid amount";
                    }
                    return null;
                  },
                ),
                spacer(20),
                Text(
                  "Tip Percentage",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: textBlack,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: totalTipController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Please enter tip percentage", // Change hint text
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: textLightBlack,
                    ),
                    filled: true,
                    fillColor: containerColor,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    if (value.isEmpty) {
                      totalBillController.text = "0.00";
                    }
                    totalBillController.text = value.toString();
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid amount";
                    }
                    return null;
                  },
                ),
                Text(
                  "Number of People",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: textBlack,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: totalPeopleController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Please enter number of people",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: textLightBlack,
                    ),
                    suffixIcon: SizedBox.shrink(), // Remove the suffix icon
                    filled: true,
                    fillColor: containerColor,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    if (value.isEmpty) {
                      totalBillController.text = "0.00";
                    }
                    totalBillController.text = value.toString();
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid amount";
                    }
                    return null;
                  },
                ),
                spacer(20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          formKey.currentState!.validate();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Calculate",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 45,
                        ),
                        decoration: BoxDecoration(
                          color: clearButtonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Clear",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
