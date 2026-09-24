import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';
import '../widgets/neo_button.dart';
import '../widgets/neo_card.dart';
import '../widgets/neo_link.dart';
import '../widgets/neo_logo.dart';
import '../widgets/neo_page_shell.dart';
import '../widgets/neo_text_field.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.sizeOf(context).width >= 900;

    return NeoPageShell(
      maxWidth: isWide ? 980 : 460,
      child: isWide
          // Kedua panel disamakan tinggi: stretch butuh tinggi terbatas.
          ? const IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(flex: 5, child: _BrandPanel()),
                  SizedBox(width: 28),
                  Expanded(flex: 6, child: _LoginForm(showLogo: false)),
                ],
              ),
            )
          : const _LoginForm(showLogo: true),
    );
  }
}

class _BrandPanel extends StatelessWidget {
  const _BrandPanel();

  @override
  Widget build(BuildContext context) {
    return NeoCard(
      color: NeoColors.main,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const NeoLogo(size: 56),
              const SizedBox(height: 30),
              Text(
                'Halo,\nSelamat Datang!',
                style: NeoText.heading.copyWith(fontSize: 38, height: 1.15),
              ),
              const SizedBox(height: 16),
              Text(
                'Masuk ke akunmu untuk melanjutkan belajar membangun '
                'aplikasi mobile dengan Flutter.',
                style: NeoText.body.copyWith(height: 1.6),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const NeoSwatches(),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({required this.showLogo});

  final bool showLogo;

  void _openRegisterPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RegisterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeoCard(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (showLogo) ...<Widget>[
            const NeoLogo(size: 52),
            const SizedBox(height: 24),
          ],
          Text('Login', style: NeoText.heading),
          const SizedBox(height: 10),
          Text(
            'Masukkan email dan password untuk mengakses akunmu.',
            style: NeoText.body.copyWith(
              color: NeoColors.foreground.withValues(alpha: 0.75),
            ),
          ),
          const SizedBox(height: 28),
          const NeoTextField(
            label: 'Email',
            hintText: 'nama@email.com',
            prefixIcon: Icons.alternate_email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          const NeoTextField(
            label: 'Password',
            hintText: 'Masukkan password',
            prefixIcon: Icons.lock_outline,
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 30),
          // Halaman statis: tombol sengaja tanpa logika login.
          NeoButton(label: 'Login', icon: Icons.login, onPressed: () {}),
          const SizedBox(height: 24),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: <Widget>[
                Text(
                  'Belum punya akun?',
                  style: NeoText.body.copyWith(fontSize: 14),
                ),
                NeoLink(
                  text: 'Register',
                  onTap: () => _openRegisterPage(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
