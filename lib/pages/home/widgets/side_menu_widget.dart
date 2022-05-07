import 'package:flutter/material.dart';
import 'package:flutter_web/shared/style/color.dart';
import '../../../model/list_item_model.dart';
import '../../../shared/components/components.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({Key? key}) : super(key: key);

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: ColorManager.darkColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  children: const [
                    Icon(
                      Icons.dashboard,
                      color: ColorManager.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    // Spacer(),
                    // Icon(
                    //   Icons.circle_notifications,
                    //   color: ColorManager.primaryColor,
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (context,index)=> ListItemWidget(itemModel: listItems[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

