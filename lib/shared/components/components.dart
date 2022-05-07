import 'package:flutter/material.dart';
import '../../model/list_item_model.dart';
import '../style/color.dart';


class NamedIcon extends StatelessWidget {
  final IconData iconData;
  final String? text;
  final VoidCallback? onTap;
  final int notificationCount;

  const NamedIcon({
    Key? key,
    this.onTap,
    this.text,
    required this.iconData,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(iconData),
                if (text != null) Text(text!, overflow: TextOverflow.ellipsis),
              ],
            ),
            Positioned(
              top: -8,
              right: -5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: ColorManager.primaryColor),
                alignment: Alignment.center,
                child: Text(
                  '$notificationCount',
                  style: const TextStyle(
                    color: ColorManager.white,
                    fontSize: 11,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




class ListItemWidget extends StatelessWidget {
  final ListItemModel itemModel;
  const ListItemWidget({Key? key, required this.itemModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Icon(itemModel.icon,size: 20 ,),
      title: Text(
        itemModel.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ColorManager.white,
        ),
      ),
      onTap: () {
        //  Navigator.pushNamed(context, itemModel.routes);
      },
    );
  }
}



Widget bodyTableTitle({required String title}) {
  return Expanded(
    flex: 2,
    child: Text(
      title,
      style: const TextStyle(color: ColorManager.white),
    ),
  );
}

Widget headTableTitle({required String title}) => Expanded(
  flex: 2,
  child: Text(
    title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorManager.white,
    ),
  ),
);

Widget completeStar(double numOfStars) => Row(
  children: [
    ...List.generate(
        numOfStars.toInt(),
            (index) => const Padding(
          padding: EdgeInsets.only(right: 5.0),
          child: Icon(Icons.star,size: 15),
        )),
    ...List.generate(
      numOfStars.round() - numOfStars.floor(),
          (index) => const Padding(
        padding: EdgeInsets.only(right: 5.0),
        child: Icon(Icons.star_half,size: 15),
      ),
    )
  ],
);

Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(vertical: 3.0),
  child: Divider(color: ColorManager.white.withOpacity(0.2)),
);