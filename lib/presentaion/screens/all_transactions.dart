import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/app_cubit.dart';
import '../widget/my_button.dart';

class AllTranscationsScreen extends StatelessWidget {
  const AllTranscationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Spacer(),
                Text('All Transactions'),
                // Spacer(),
                // IconButton(
                //   icon: const Icon(Icons.person, size: 30),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(
                        height: 15,
                        color: Colors.yellow,
                      ),
                      itemCount:
                      AppCubit.get(context).allUsersWithoutFirstItem.length,
                      itemBuilder: (
                          context,
                          index,
                          ) =>
                          allUsersItem(
                              map: AppCubit.get(context)
                                  .allUsersWithoutFirstItem[index],
                              context: context)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget allUsersItem({required Map map, context}) {
    // map['transfersAmount']=transferAmount;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.2),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(10),
            left: Radius.circular(10),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Text(
                      '${map['name']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                    child: Text('${map['phone']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                        child: Text('${map['date']}'.split(' ')[0].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${map['transfersAmount']} \$',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red)),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
