import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import '../widget/app_widgets.dart';

class AppOverlayHelper {
  static   void showTermsAndConditionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (ctx) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 25, right: 25, bottom: 25),
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: AppColors.primary,
                        size: 25,
                      )),
                  const Divider(color: AppColors.primary),
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Terms And',
                        ),
                        Text(
                          'Conditions',
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.primary),
                  const Padding(
                    padding: EdgeInsets.only(right: 25.0, left: 25.0),
                    child: Center(
                      child: Text(
                        'Sint aliquip quis ea elit sint commodo consectetur aute culpa do ullamco. Minim aute elit culpa aliqua. Occaecat incididunt aute officia id Lorem culpa consequat velit dolor id. In enim cupidatat amet id id ea deserunt est labore culpa non. Fugiat Lorem nulla officia esse ut tempor ipsum. Duis officia tempor aute dolore non tempor nostrud ullamco enim adipisicing aliqua reprehenderit cillum. Incididunt sunt est excepteur quis minim eiusmod dolore nisi quis incididunt nulla id.',
                 
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const AppLogo(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}