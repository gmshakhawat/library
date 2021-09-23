import 'package:cant_lib/src/constents/skt_colors.dart';
import 'package:flutter/material.dart';

class StatusTabBar extends StatefulWidget {
  final Function onSelection;
  const StatusTabBar({ Key? key,required this.onSelection }) : super(key: key);

  @override
  State<StatusTabBar> createState() => _StatusTabBarState();
}

class _StatusTabBarState extends State<StatusTabBar>  with SingleTickerProviderStateMixin{
   TabController? _tabController;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController=TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return           Container(
        
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
               color: SktColors.pending,
            ),
           
            child: TabBar(
              labelColor: SktColors.text,
              indicatorWeight: 10,
              indicatorColor: SktColors.background,
              unselectedLabelColor: SktColors.background,
                        tabs: [
                          Tab(
                            text: "All",

                          ),
                          Tab(
                            text: "Borrowed",
                          ),

                          Tab(
                            text: "Returned",
                          ),
                        ],
                        onTap: (index){
                          print(index.toString());
                            widget.onSelection(index);
                        },
                        controller: _tabController,


                      ),
          );
;
  }
}