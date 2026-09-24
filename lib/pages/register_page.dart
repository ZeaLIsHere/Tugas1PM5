import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';
import '../widgets/neo_button.dart';
import '../widgets/neo_card.dart';
import '../widgets/neo_link.dart';
import '../widgets/neo_logo.dart';
import '../widgets/neo_page_shell.dart';
import '../widgets/neo_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return NeoPageShell(
      child: NeoCard(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const NeoLogo(size: 52),
            const SizedBox(height: 24),
            Text('Register', style: NeoText.heading),
            const SizedBox(height: 10),
            Text(
              'Buat akun baru untuk mulai menggunakan aplikasi.',
              style: NeoText.body.copyWith(
                color: NeoColors.foreground.withValues(alpha: 0.75),
              ),
            ),
            const SizedBox(height: 28),
            const NeoTextField(
              label: 'Nama Lengkap',
              hintText: 'Nama kamu',
              prefixIcon: Icons.person_outline,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
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
              hintText: 'Minimal 8 karakter',
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            const NeoTextField(
              label: 'Konfirmasi Password',
              hintText: 'Ulangi password',
              prefixIcon: Icons.lock_reset_outlined,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 30),
            // Halaman statis: tombol sengaja tanpa logika register.
            NeoButton(label: 'Register', icon: Icons.person_add_alt_1, onPressed: () {}),
            const SizedBox(height: 24),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 4,
                children: <Widget>[
                  Text(
                    'Sudah punya akun?',
                    style: NeoText.body.copyWith(fontSize: 14),
                  ),
                  NeoLink(
                    text: 'Login',
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
