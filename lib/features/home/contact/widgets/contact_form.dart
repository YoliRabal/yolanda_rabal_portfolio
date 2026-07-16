import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  static const String formspreeEndpoint = 'https://formspree.io/f/mojgjgnl';

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final formState = _formKey.currentState;

    if (formState == null || !formState.validate()) {
      return;
    }

    setState(() {
      _isSending = true;
    });

    try {
      final response = await http.post(
        Uri.parse(ContactForm.formspreeEndpoint),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
          {
            'name': _nameController.text.trim(),
            'email': _emailController.text.trim(),
            'message': _messageController.text.trim(),
          },
        ),
      );

      if (!mounted) {
        return;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();

        _showSnackBar(
          message: 'Mensaje enviado correctamente. ¡Gracias por contactar!',
          isError: false,
        );
      } else {
        _showSnackBar(
          message:
          'No se ha podido enviar el mensaje. Inténtalo de nuevo en unos minutos.',
          isError: true,
        );
      }
    } catch (_) {
      if (!mounted) {
        return;
      }

      _showSnackBar(
        message:
        'Ha ocurrido un error al enviar el mensaje. También puedes escribirme directamente por email.',
        isError: true,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSending = false;
        });
      }
    }
  }

  void _showSnackBar({
    required String message,
    required bool isError,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: isError ? AppColors.error : AppColors.success,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.74),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.cyan.withValues(alpha: 0.18),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.cyan.withValues(alpha: 0.055),
            blurRadius: 24,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: AppColors.magenta.withValues(alpha: 0.04),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _ContactTextField(
              controller: _nameController,
              label: 'Nombre',
              hint: 'Tu nombre',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Introduce tu nombre';
                }

                return null;
              },
            ),
            const SizedBox(height: 22),
            _ContactTextField(
              controller: _emailController,
              label: 'Email',
              hint: 'tuemail@email.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                final email = value?.trim() ?? '';

                if (email.isEmpty) {
                  return 'Introduce tu email';
                }

                if (!email.contains('@') || !email.contains('.')) {
                  return 'Introduce un email válido';
                }

                return null;
              },
            ),
            const SizedBox(height: 22),
            _ContactTextField(
              controller: _messageController,
              label: 'Mensaje',
              hint: 'Hola, estoy interesado/a en tu perfil...',
              maxLines: 6,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Escribe un mensaje';
                }

                if (value.trim().length < 10) {
                  return 'El mensaje debe ser un poco más completo';
                }

                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isSending ? null : _sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cyan,
                  disabledBackgroundColor:
                  AppColors.cyan.withValues(alpha: 0.35),
                  foregroundColor: AppColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  elevation: 0,
                ),
                child: _isSending
                    ? SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    color: AppColors.background,
                  ),
                )
                    : Text(
                  'Enviar mensaje',
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.background,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactTextField extends StatelessWidget {
  const _ContactTextField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.cardTitle.copyWith(
            fontSize: 14.5,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          cursorColor: AppColors.cyan,
          style: AppTextStyles.body.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14,
          ),
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.body.copyWith(
              color: AppColors.textMuted,
              fontSize: 14,
            ),
            filled: true,
            fillColor: const Color(0xFF020611),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 17,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: AppColors.cyan.withValues(alpha: 0.18),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: AppColors.cyan.withValues(alpha: 0.65),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: AppColors.error.withValues(alpha: 0.8),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: AppColors.error.withValues(alpha: 0.9),
                width: 1,
              ),
            ),
            errorStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.error,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}