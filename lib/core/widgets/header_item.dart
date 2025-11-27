import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBack;
  final Widget? trailing;

  const BuildHeader({super.key, this.title, this.onBack, this.trailing});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: topPadding + 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: onBack ?? () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: AppColors.PrimaryColor,
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    title!,
                    style: AppTextStyle.semiBold17black,
                    textAlign: TextAlign.center,
                  ),
                ),

                if (trailing != null)
                  Align(alignment: Alignment.centerRight, child: trailing),
              ],
            ),
          ),

          const SizedBox(height: 12),

          const Divider(
            thickness: 1,
            height: 1,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
