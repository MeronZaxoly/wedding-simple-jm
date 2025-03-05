import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:fl_wedding_bells/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  TextEditingController budgetController = TextEditingController();

  TextEditingController addExpenseController = TextEditingController();

  TextEditingController enterExpenseController = TextEditingController();

  final expenselist = [
    {
      "name": "Venues",
      "price": 1000,
    },
    {
      "name": "Makup artist",
      "price": 800,
    },
    {
      "name": "Jewellery",
      "price": 400,
    },
    {
      "name": "Caterers",
      "price": 1000,
    },
    {
      "name": "Bridal wear",
      "price": 900,
    },
    {
      "name": "Bridal jewllery",
      "price": 400,
    },
    {
      "name": "Groom wear",
      "price": 800,
    },
    {
      "name": "Photographer",
      "price": 2400,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: whiteColor,
        elevation: 0,
        foregroundColor: blackColor2,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(getTranslate(context, 'budgets.budgets')),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          topcontainer(size),
          expenseTitleorAdd(context, size),
          expanselistview()
        ],
      ),
    );
  }

  expanselistview() {
    return ColumnBuilder(
      itemCount: expenselist.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
          child: Column(
            children: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  expenselist[index]['name'].toString(),
                  style: semibold14black2,
                ),
                trailing: Text(
                  "\$${expenselist[index]['price']}",
                  style: semibold14black2,
                ),
              ),
              expenselist.length - 1 == index
                  ? const SizedBox()
                  : Container(
                      height: 1,
                      width: double.maxFinite,
                      color: const Color(0xffD9D9D9),
                    ),
            ],
          ),
        );
      },
    );
  }

  expenseTitleorAdd(BuildContext context, Size size) {
    return Container(
      width: double.infinity,
      color: const Color(0xffEFEDED),
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding, horizontal: fixPadding * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getTranslate(context, 'budgets.expenses'),
            style: bold16Primary,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(fixPadding * 2),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Text(
                            getTranslate(context, 'budgets.add_expenses'),
                            style: semibold18black2,
                            textAlign: TextAlign.center,
                          ),
                          heightSpace,
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                  primary: primaryColor),
                            ),
                            child: TextField(
                              controller: enterExpenseController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                hintText: getTranslate(
                                    context, 'budgets.enter_title'),
                                hintStyle: semibold14black2,
                              ),
                            ),
                          ),
                          heightSpace,
                          heightSpace,
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                  primary: primaryColor),
                            ),
                            child: TextField(
                              controller: addExpenseController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(),
                                hintText: getTranslate(
                                    context, 'budgets.enter_expenses'),
                                hintStyle: semibold14black2,
                              ),
                            ),
                          ),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          GestureDetector(
                            onTap: () {
                              if (addExpenseController.text.isNotEmpty &&
                                  enterExpenseController.text.isNotEmpty) {
                                setState(() {
                                  expenselist.add({
                                    "name": enterExpenseController.text,
                                    "price": addExpenseController.text,
                                  });
                                });
                              }
                              expenselist;
                              addExpenseController.clear();
                              enterExpenseController.clear();
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: size.height * 0.07,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.25),
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                getTranslate(context, 'budgets.add'),
                                style: bold18White,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.add_circle_outline_outlined,
                  size: 22,
                  color: primaryColor,
                ),
                width5Space,
                Text(
                  getTranslate(context, 'budgets.add_expenses'),
                  style: semibold14black2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  topcontainer(Size size) {
    return Container(
      margin: const EdgeInsets.only(
        top: fixPadding / 2,
        left: fixPadding * 2,
        right: fixPadding * 2,
        bottom: fixPadding * 2,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: fixPadding / 2,
              right: fixPadding / 2,
              top: fixPadding / 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(fixPadding * 2),
                            decoration: const BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                Text(
                                  getTranslate(context, 'budgets.add_budget'),
                                  style: semibold18black2,
                                  textAlign: TextAlign.center,
                                ),
                                heightSpace,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: fixPadding),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                          primary: primaryColor),
                                    ),
                                    child: TextField(
                                      controller: budgetController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        hintText: getTranslate(
                                            context, 'budgets.enter_budgets'),
                                        hintStyle: semibold14black2,
                                      ),
                                    ),
                                  ),
                                ),
                                heightSpace,
                                heightSpace,
                                heightSpace,
                                GestureDetector(
                                  onTap: () {
                                    budgetController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: size.height * 0.07,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: primaryColor.withOpacity(0.25),
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      getTranslate(context, 'budgets.add'),
                                      style: bold18White,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(
                    LineAwesomeIcons.edit_1,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          CircularPercentIndicator(
            radius: 60,
            backgroundColor: const Color(0xffDBCD54),
            lineWidth: 8,
            percent: 0.4,
            progressColor: primaryColor,
            center: Padding(
              padding: const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      getTranslate(context, 'budgets.total_estimate'),
                      style: semibold12Grey,
                    ),
                  ),
                  height5Space,
                  FittedBox(
                    child: Text(
                      "\$ 60,000",
                      style: bold18Primary.copyWith(color: blackColor2),
                    ),
                  )
                ],
              ),
            ),
            footer: Padding(
              padding: const EdgeInsets.symmetric(vertical: fixPadding),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: size.height * 0.06,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "40%",
                            style: bold14White,
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Text(
                            getTranslate(context, 'budgets.spent'),
                            style: semibold14Grey94,
                          ),
                        ),
                        const Text(
                          "\$25000",
                          style: semibold16Black,
                        ),
                      ],
                    ),
                  ),
                  heightSpace,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: fixPadding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.06,
                          width: size.height * 0.06,
                          decoration: const BoxDecoration(
                            color: Color(0xffDBCD54),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "60%",
                            style: bold14White,
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Text(
                            getTranslate(context, 'budgets.remaining'),
                            style: semibold14Grey94,
                          ),
                        ),
                        const Text(
                          "\$45000",
                          style: semibold16Black,
                        ),
                      ],
                    ),
                  ),
                  heightSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
