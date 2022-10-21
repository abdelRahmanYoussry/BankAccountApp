import 'package:basic_banking_app/presentaion/controller/app_cubit.dart';
import 'package:basic_banking_app/presentaion/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/my_button.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bank_mobile.jpg"),
                fit: BoxFit.cover,
              )),

          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaQuery.height / 11,
                      ),
                      Image.asset(
                        'assets/images/bank_logo.png',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "BankingApp",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.teal,fontWeight: FontWeight.bold
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Transfer Money in Click",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.teal,
                              fontSize: 20.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                MyButton(
                  text: "Get Started",
                  height: 50.0,
                  width: 300.0,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  HomeScreen()));
                  },
                  borderRadius: 15,
                ),
              ],
            ),
          ),
        ));
  },
);
  }
}
