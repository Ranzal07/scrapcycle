import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrapcycle/pages/body.dart';
import 'package:scrapcycle/pages/pending.dart';
import 'package:scrapcycle/pages/profile.dart';
import 'package:scrapcycle/widgets/appbar.dart';
import 'package:scrapcycle/pages/pricelist.dart';
import 'package:scrapcycle/widgets/botnavbar.dart';
import 'package:scrapcycle/change_notifier/change_notifier.dart';

class TabViewWidget extends StatefulWidget {
    const TabViewWidget({Key? key}) : super(key: key);
    @override
    State<TabViewWidget> createState() => _TabViewWidgetState();
}

class _TabViewWidgetState extends State<TabViewWidget> {

    @override
    Widget build(BuildContext context) {
        context.read<ChangePage>().checkComplete();
        return DefaultTabController(
            length: 3,
            child: TabBarView(      
                children: [
                    Scaffold(        
                        appBar: const AppBarWidget(),   
                        body: context.watch<ChangePage>().isCompleted == true ? const BodyPage() : const PendingPage(),       // change doc('Admin') -> isCompleted : 'false' to 'true' in the database to return to the the BodyPage
                        bottomNavigationBar: const BotNavWidget(),
                    ),
                    const Scaffold(        
                        appBar: AppBarWidget(),   
                        body: PriceListPage(),
                        bottomNavigationBar: BotNavWidget(),
                    ),
                    const Scaffold(        
                        appBar: AppBarWidget(),   
                        body: ProfilePage(),
                        bottomNavigationBar: BotNavWidget(),
                    ),
                ],
            ),
        );
    }
}