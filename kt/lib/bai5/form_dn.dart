import 'package:flutter/material.dart';

class FormDangNhap extends StatefulWidget {
  const FormDangNhap({super.key});
  @override
  State<FormDangNhap> createState() => _FormDangNhapState();
}

class _FormDangNhapState extends State<FormDangNhap> {
  final _formKey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _pass = TextEditingController();
  bool _showPass = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Đăng nhập thành công!'),
        backgroundColor: Colors.green,
      ));
    }
  }

  InputDecoration _dec(String label, IconData icon,
          {bool? toggle, VoidCallback? onTap}) =>
      InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        suffixIcon: toggle == null
            ? null
            : IconButton(
                icon: Icon(toggle ? Icons.visibility_off : Icons.visibility),
                onPressed: onTap,
              ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Đăng nhập"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _user,
                  decoration: _dec('Tên đăng nhập', Icons.person_outline),
                  validator: (v) =>
                      v!.isEmpty ? 'Vui lòng nhập tên đăng nhập' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _pass,
                  obscureText: !_showPass,
                  decoration: _dec('Mật khẩu', Icons.lock_outline,
                      toggle: !_showPass,
                      onTap: () => setState(() => _showPass = !_showPass)),
                  validator: (v) =>
                      v!.isEmpty ? 'Vui lòng nhập mật khẩu' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.login),
                    label: const Text('Đăng nhập',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}