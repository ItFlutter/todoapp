import 'package:flutter/material.dart';
import 'package:to_do_app/core/constant/color.dart';
import 'package:to_do_app/core/constant/dimensions_screen.dart';

class CustomDropDownButton extends StatelessWidget {
  final List dropDownList;
  final void Function(Object?)? onChanged;
  const CustomDropDownButton(this.dropDownList, this.onChanged, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: widthScreen / 40),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            borderRadius: BorderRadius.circular(10),
            dropdownColor: Colors.blueGrey,
            icon: const Icon(Icons.expand_more, size: 35, color: AppColor.grey),
            alignment: Alignment.bottomRight,
            items: dropDownList
                .map((e) => DropdownMenuItem(
                      // alignment: Alignment.bottomRight,
                      value: e,
                      child: Text(
                        "$e",
                        style: const TextStyle(color: AppColor.white),
                      ),
                    ))
                .toList(),
            onChanged: onChanged
            // value: controller.selectedRemind,
            ),
      ),
    );
  }
}
