// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genesia_demo/extensions/build_context_ext.dart';
import 'package:genesia_demo/extensions/int_ext.dart';

enum _ClickType { icon, material, cupertino }

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? pressedOpacity;
  late final _ClickType clickType;

  CommonButton.icon({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) {
    clickType = _ClickType.icon;
  }

  CommonButton.material({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) {
    clickType = _ClickType.material;
  }

  CommonButton.cupertino({
    super.key,
    required this.onTap,
    required this.child,
    this.padding,
    this.radius,
    this.pressedOpacity,
  }) {
    clickType = _ClickType.cupertino;
  }

  @override
  Widget build(BuildContext context) {
    switch (clickType) {
      case _ClickType.icon:
        return _IconButton(
          onTap: onTap,
          padding: padding,
          child: child,
        );
      case _ClickType.material:
        return _MaterialButton(
          onTap: onTap,
          radius: radius,
          padding: padding,
          child: child,
        );
      case _ClickType.cupertino:
        return _CupertinoButton(
          onTap: onTap,
          padding: padding,
          pressedOpacity: pressedOpacity,
          child: child,
        );
    }
  }
}

class _IconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const _IconButton({required this.onTap, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: IconButton(
          // constraints: const BoxConstraints(),
          // splashRadius: 2,
          alignment: Alignment.center,
          padding: padding ?? EdgeInsets.zero,
          highlightColor: context.colorScheme.surfaceTint.withOpacity(.6),
          onPressed: onTap,
          icon: child),
    );
  }
}

class _MaterialButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  const _MaterialButton(
      {required this.onTap,
      required this.child,
      this.radius,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    final animationDuration = 150.milliseconds;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Stack(children: [
        child,
        Positioned.fill(
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 0)),
            padding: EdgeInsets.zero,
            animationDuration: animationDuration,
            onPressed: () {
              Timer(animationDuration, () {
                if (onTap != null) {
                  onTap!();
                }
              });
            },
          ),
        ),
      ]),
    );
  }
}

class _CupertinoButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final double? pressedOpacity;
  final EdgeInsetsGeometry? padding;

  const _CupertinoButton(
      {required this.onTap,
      required this.child,
      this.pressedOpacity,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 10,
      pressedOpacity: pressedOpacity ?? .7,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onTap,
      child: child,
    );
  }
}
