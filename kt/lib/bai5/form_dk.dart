import 'package:flutter/material.dart';

class FormDangKy extends StatefulWidget {
  const FormDangKy({super.key});
  @override
  State<FormDangKy> createState() => _FormDangKyState();
}

class _FormDangKyState extends State<FormDangKy> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController(), _email = TextEditingController();
  final _pass = TextEditingController(), _confirm = TextEditingController();
  bool _showPass = false, _showConfirm = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Đăng ký thành công!'),
        backgroundColor: Colors.green,
      ));
    }
  }

  InputDecoration _dec(String label, IconData icon, {bool? toggle, VoidCallback? onTap}) =>
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
        title: const Text("Form Đăng ký tài khoản"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  decoration: _dec('Họ tên', Icons.person_outline),
                  validator: (v) => v!.isEmpty ? 'Vui lòng nhập họ tên' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _email,
                  decoration: _dec('Email', Icons.email_outlined),
                  validator: (v) => v!.contains('@') ? null : 'Email không hợp lệ',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _pass,
                  obscureText: !_showPass,
                  decoration: _dec('Mật khẩu', Icons.lock_outline,
                      toggle: !_showPass, onTap: () => setState(() => _showPass = !_showPass)),
                  validator: (v) =>
                      v!.length < 6 ? 'Mật khẩu ít nhất 6 ký tự' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirm,
                  obscureText: !_showConfirm,
                  decoration: _dec('Xác nhận mật khẩu', Icons.lock_outline,
                      toggle: !_showConfirm,
                      onTap: () => setState(() => _showConfirm = !_showConfirm)),
                  validator: (v) => v != _pass.text ? 'Mật khẩu không trùng khớp' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.person_add_alt_1),
                    label: const Text('Đăng ký',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
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