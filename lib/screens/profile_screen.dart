import 'package:corelab_app_challenge/model/address.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController rgController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();

  var maskCep = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  var maskPhone = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
  var maskRg = MaskTextInputFormatter(
      mask: '##.###.###-#', filter: {"#": RegExp(r'[0-9]')});

  @override
  void dispose() {
    nameController.dispose();
    rgController.dispose();
    phoneController.dispose();
    cepController.dispose();
    streetController.dispose();
    numberController.dispose();
    cityController.dispose();
    districtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              saveProfile();
            }
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF00B4CC)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: const Text(
            'Salvar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/user_image.jpg'),
                child: Icon(Icons.person, size: 60),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: rgController,
                decoration: const InputDecoration(
                  labelText: 'RG',
                  hintText: '00.000.000-0',
                ),
                inputFormatters: [maskRg],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um RG válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  hintText: '(00) 00000-0000',
                ),
                inputFormatters: [maskPhone],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um telefone válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: cepController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: '00000-000',
                ),
                inputFormatters: [maskCep],
                onChanged: (value) {
                  if (value.length == 9) {
                    fetchAddress(value).then((address) {
                      if (address != null) {
                        streetController.text = address.logradouro;
                        cityController.text = address.localidade;
                        districtController.text = address.bairro;
                      }
                    });
                  }
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: streetController,
                decoration: const InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma rua válida.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: numberController,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um número válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: cityController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma cidade válida.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: districtController,
                decoration: const InputDecoration(labelText: 'Bairro'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um bairro válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  void saveProfile() {
    showSuccessDialog(context);
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });

        return const AlertDialog(
          title: Text('Aviso'),
          content: Text('Salvo com sucesso'),
        );
      },
    );
  }
}
