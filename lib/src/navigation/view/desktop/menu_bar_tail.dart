// Copyright 2014 The 张风捷特烈 . All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Author:      张风捷特烈
// CreateTime:  2024-05-13
// Contact Me:  1981462002@qq.com

import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unit/src/flutter_unit.dart';
import 'package:go_router/go_router.dart';
import 'package:toly_ui/toly_ui.dart';
import 'package:tolyui/basic/basic.dart';

import 'locale_change_menu.dart';
import 'theme_model_switch_icon.dart';

enum ActionType {
  settings(path: '/settings'),
  collection(path: '/collection');

  final String path;

  const ActionType({required this.path});
}

class MenuBarTail extends StatelessWidget {
  const MenuBarTail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(indent: 20, color: Colors.white, height: 1),
        const SizedBox(height: 8,),
        const LocaleChangeMenu(),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8,bottom: 8,top: 2),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              const SettingIcon(),
              TolyAction(
                style: const ActionStyle.dark(),
                onTap: () => context.push(ActionType.collection.path),
                child: const Icon(
                  TolyIcon.icon_collect,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const ThemeModelSwitchIcon(),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingIcon extends StatelessWidget {
  const SettingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    Color tipColor = Colors.redAccent;
    Widget child = TolyAction(
      style: const ActionStyle.dark(),
      onTap: () => context.push(ActionType.settings.path),
      child: const Icon(Icons.settings, color: Colors.white, size: 22),
    );
    return child;
  }
}
