import 'package:fl_wedding_bells/localizations/localization_const.dart';
import 'package:fl_wedding_bells/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        foregroundColor: blackColor2,
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(getTranslate(context, 'credit_card.payment_information')),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          carditcard(size),
          creditCardFields(),
          heightSpace,
          heightSpace,
          heightSpace,
          paymentButton(size),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  paymentButton(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/success');
      },
      child: Container(
        height: size.height * 0.07,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
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
          getTranslate(context, 'credit_card.payment'),
          style: bold18White,
        ),
      ),
    );
  }

  creditCardFields() {
    return CreditCardForm(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      obscureCvv: true,
      themeColor: primaryColor,
      formKey: formKey,
      cardHolderDecoration: InputDecoration(
        hintText: getTranslate(context, 'credit_card.enter_holder_name'),
        hintStyle: semibold15Grey,
        labelText: getTranslate(context, 'credit_card.name_card'),
        labelStyle: semibold18black2,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey94Color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        alignLabelWithHint: true,
      ),
      cardNumberDecoration: InputDecoration(
        hintText: getTranslate(context, 'credit_card.enter_card_number'),
        hintStyle: semibold15Grey,
        labelText: getTranslate(context, 'credit_card.card_number'),
        labelStyle: semibold18black2,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey94Color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        alignLabelWithHint: true,
      ),
      cvvCodeDecoration: InputDecoration(
        hintText: getTranslate(context, 'credit_card.cvv'),
        hintStyle: semibold15Grey,
        labelText: getTranslate(context, 'credit_card.cvv'),
        labelStyle: semibold18black2,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey94Color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        alignLabelWithHint: true,
      ),
      expiryDateDecoration: InputDecoration(
        hintText: "MM/YY",
        hintStyle: semibold15Grey,
        labelText: getTranslate(context, 'credit_card.expire_date'),
        labelStyle: semibold18black2,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: grey94Color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        alignLabelWithHint: true,
      ),
      onCreditCardModelChange: (CreditCardModel creditCardModel) {
        setState(() {
          cardNumber = creditCardModel.cardNumber;
          expiryDate = creditCardModel.expiryDate;
          cardHolderName = creditCardModel.cardHolderName;
          cvvCode = creditCardModel.cvvCode;
          isCvvFocused = creditCardModel.isCvvFocused;
        });
      },
    );
  }

  carditcard(Size size) {
    return CreditCardWidget(
      height: size.height * 0.3,
      bankName: getTranslate(context, 'credit_card.credit_card'),
      backgroundImage: "assets/creditCard/Group 1729.png",
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardType: CardType.mastercard,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: isCvvFocused,
      isHolderNameVisible: true,
      cardBgColor: whiteColor,
      isChipVisible: false,
      obscureCardCvv: true,
      obscureCardNumber: true,
      labelCardHolder: getTranslate(context, 'credit_card.card_holder'),
      customCardTypeIcons: [
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            "assets/creditCard/Ask Mastercard Logo.png",
          ),
        )
      ],
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
    );
  }
}
