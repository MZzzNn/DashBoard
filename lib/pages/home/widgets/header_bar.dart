import 'package:flutter/material.dart';
import '../../../shared/style/color.dart';
import 'dart:math'as math;
import '../../../shared/components/components.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: ColorManager.darkColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          /// Creating a row of icons with a function that is called when the icon is pressed.
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.post_add,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.email_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_today,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_border,
              color: ColorManager.orangeColor,
            ),
          ),

          const Spacer(),

          /// A custom widget that I created to show the notification count on the icon.
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.flag_outlined, color: ColorManager.iconColor),
            label: const Text(
              'Egypt',
              style: TextStyle(
                color: ColorManager.orangeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),

          /// A custom widget that I created to show the notification count on the icon.
          NamedIcon(
            iconData: Icons.shopping_cart,
            notificationCount: 3,
            onTap: () {},
          ),
          NamedIcon(
            iconData: Icons.notifications_active_outlined,
            notificationCount: 10,
            onTap: () {},
          ),
          const SizedBox(width: 10),

          /// A widget that is used to show the user's name & profile picture.
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Mazen Mohamed',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: ColorManager.primaryColor,
            child: Text('M', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}


class HeaderBarVertical extends StatelessWidget {
  const HeaderBarVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Creating a row of icons with a function that is called when the icon is pressed.
        rotateWidget(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.post_add,
            ),
          ),
        ),
        rotateWidget(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.email_outlined,
            ),
          ),
        ),
        rotateWidget(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_today,
            ),
          ),
        ),
        rotateWidget(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ),
        rotateWidget(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_border,
              color: ColorManager.orangeColor,
            ),
          ),
        ),

       const SizedBox(height: 20),
       //rotateWidget const Spacer(),

        /// A custom widget that I created to show the notification count on the icon.
        rotateWidget(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.flag_outlined, color: ColorManager.iconColor),
            label: const Text(
              '',
              style: TextStyle(
                color: ColorManager.orangeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        rotateWidget(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 20),
        Spacer(),
        /// A custom widget that I created to show the notification count on the icon.
        rotateWidget(
          child: NamedIcon(
            iconData: Icons.shopping_cart,
            notificationCount: 3,
            onTap: () {},
          ),
        ),
        const SizedBox(height: 20),
        rotateWidget(
          child: NamedIcon(
            iconData: Icons.notifications_active_outlined,
            notificationCount: 10,
            onTap: () {},
          ),
        ),



        const SizedBox(height: 25),
        rotateWidget(
          child: const CircleAvatar(
            backgroundColor: ColorManager.primaryColor,
            radius: 15,
            child: Text('M', style: TextStyle(color: Colors.white)),
          ),
        ),

        const SizedBox(height: 20),

      ],
    );
  }

  rotateWidget({required Widget child}) {
    return Transform.rotate(
      angle: 90 * math.pi / 180,
      child: child,
    );
  }
}