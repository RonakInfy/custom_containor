library custom_containor;

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

typedef IntCallback = void Function(int val);

class CustomContainer extends StatefulWidget {
  final List<Color>? gradientColor;
  final Color? color;
  final double? width;
  final double? height;
  final Color? color1;
  final Color? color2;
  final EdgeInsetsGeometry? padding;
  final bool? gradient;
  final Color? selectItemColor;
  final Color? unselectedItemColor;
  final IntCallback onTap;
  final int selectItem;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final BoxDecoration? backgroundBoxDecoration;
  final TextStyle? selectLabelTextStyle;
  final TextStyle? unSelectLabelTextStyle;
  final List<BottomBarItem> itemList;

  const CustomContainer({
    Key? key,
    this.gradientColor,
    this.color,
    this.width,
    this.height,
    this.color1,
    this.color2,
    this.padding,
    this.gradient = false,
    this.selectItemColor,
    this.unselectedItemColor,
    required this.onTap,
    required this.selectItem,
    this.animationDuration,
    this.animationCurve,
    this.backgroundBoxDecoration,
    this.selectLabelTextStyle,
    this.unSelectLabelTextStyle,
    required this.itemList,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  final controller = NotchBottomBarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(14),
      child: Container(
        height: widget.height ?? MediaQuery.of(context).size.height * 0.08,
        width: widget.width ?? MediaQuery.of(context).size.width,
        decoration: widget.backgroundBoxDecoration ??
            BoxDecoration(
              color: widget.color ?? Colors.white,
              gradient: widget.gradient == true ? LinearGradient(colors: widget.gradientColor ?? []) : null,
              borderRadius: BorderRadius.circular(20),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => widget.onTap(index),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: SizedBox(
                      width: width * 0.12,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: AnimatedContainer(
                              duration: widget.animationDuration ?? const Duration(milliseconds: 1000),
                              margin: EdgeInsets.only(bottom: widget.selectItem == index ? 0 : width * 0.18),
                              curve: widget.animationCurve ?? Curves.fastEaseInToSlowEaseOut,
                              decoration: BoxDecoration(
                                  color: widget.selectItemColor ?? Colors.black,
                                  borderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(8),
                                  )),
                              height: 5,
                              width: width * 0.11,
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.selectItem == index
                                    ? Icon(
                                        widget.itemList[index].icon,
                                        color: widget.selectItemColor ?? Colors.black,
                                        size: 30,
                                      )
                                    : Icon(
                                        widget.itemList[index].icon,
                                        color: widget.unselectedItemColor ?? Colors.grey,
                                      ),
                                Text(
                                  "${widget.itemList[index].name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: widget.selectItem == index
                                      ? widget.selectLabelTextStyle ??
                                          const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          )
                                      : widget.unSelectLabelTextStyle ?? const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class BottomBarItem {
  final IconData? icon;
  final String? name;

  BottomBarItem({
    required this.icon,
    required this.name,
  });
}

// export 'src/custom_containor.dart';
