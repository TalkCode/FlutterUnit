import 'package:app/app.dart';
import 'package:go_router/go_router.dart';
import 'package:l10n/l10n.dart';
import 'package:toly_ui/toly_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_setting.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget divider = Divider(height: 1);

    return DragToMoveWrapper(
      child: Scaffold(
        appBar: AppBar(title: Text(context.l10n.appSettings)),
        body: ListView(
          children: <Widget>[
            Container(height: 15),
            ListTile(
              leading: Icon(
                Icons.style,
                color: Theme.of(context).primaryColor,
              ),
              title:
                  Text(context.l10n.darkMode, style: TextStyle(fontSize: 16)),
              subtitle: BlocBuilder<AppConfigBloc, AppConfig>(
                builder: (_, state) {
                  String info = switch (state.themeMode) {
                    ThemeMode.system => context.l10n.followSystem,
                    ThemeMode.light => context.l10n.lightMode,
                    ThemeMode.dark => context.l10n.darkMode,
                  };
                  return Text(info,
                      style: const TextStyle(fontSize: 12, color: Colors.grey));
                },
              ),
              trailing: _nextIcon(context),
              onTap: () => context.push('/settings/dark_mode'),
            ),
            divider,
            ListTile(
              leading: Icon(
                Icons.palette,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(context.l10n.themeColorSetting,
                  style: TextStyle(fontSize: 16)),
              subtitle: BlocBuilder<AppConfigBloc, AppConfig>(
                builder: (_, state) => Text(
                  state.themeColor.label(context),
                  style: TextStyle(color: state.themeColor.color, fontSize: 12),
                ),
              ),
              trailing: _nextIcon(context),
              onTap: () => context.push('/settings/theme_color'),
            ),
            // divider,
            Container(height: 10),
            ListTile(
              leading: Icon(
                Icons.translate,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(context.l10n.fontSetting,
                  style: TextStyle(fontSize: 16)),
              subtitle: BlocBuilder<AppConfigBloc, AppConfig>(
                builder: (_, state) => Text(
                  state.fontFamily,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              trailing: _nextIcon(context),
              onTap: () => context.push('/settings/font_setting'),
            ),
            divider,
            const LanguageSwitchTile(),
            divider,
            ListTile(
              leading: Icon(
                TolyIcon.icon_code,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(context.l10n.codeHighlightStyle,
                  style: TextStyle(fontSize: 16)),
              trailing: _nextIcon(context),
              onTap: () => context.push('/settings/code_style'),
            ),
            // divider,
            Container(
              height: 10,
            ),
            // _buildShowBg(context),
            divider,
            _buildShowOver(context),
            // divider,
            // _buildShowTool(context),
            divider,
            // Container( height: 10),
            VersionTiled(),
          ],
        ),
      ),
    );
  }

  Widget _buildShowOver(BuildContext context) =>
      BlocBuilder<AppConfigBloc, AppConfig>(
          builder: (_, state) => TolySwitchListTile(
                secondary: Icon(
                  TolyIcon.icon_background,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(context.l10n.displayPerformanceFloatingLayer,
                    style: TextStyle(fontSize: 16)),
                value: state.showPerformanceOverlay,
                onChanged: (bool value) {
                  BlocProvider.of<AppConfigBloc>(context).switchShowOver(value);
                },
              ));

  Widget _nextIcon(BuildContext context) =>
      Icon(Icons.chevron_right, color: Theme.of(context).primaryColor);
}

class VersionTiled extends StatelessWidget {
  const VersionTiled({super.key});

  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).primaryColor;
    Widget title = Text(context.l10n.versionInformation, style: TextStyle(fontSize: 16));


    return ListTile(
      leading: Icon(Icons.info, color: themeColor),
      title: title,
      trailing: Icon(Icons.chevron_right, color: themeColor),
      onTap: () => context.push('/settings/version'),
    );
  }
}

