import 'package:drawtism/app/features/choosepage/presentation/choosepage.dart';
import 'package:drawtism/app/features/emailconfigpage/presentation/controllers/config_email_controller.dart';
import 'package:drawtism/app/global/utils/colors.dart';
import 'package:drawtism/app/global/utils/deviceUtils.dart';
import 'package:drawtism/app/global/utils/text_styles.dart';
import 'package:drawtism/app/global/widgets/background.dart';
import 'package:drawtism/app/global/widgets/customText.dart';
import 'package:drawtism/app/global/widgets/default_button.dart';
import 'package:drawtism/app/global/widgets/default_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigEmailPage extends StatefulWidget {
  const ConfigEmailPage({super.key});

  @override
  State<ConfigEmailPage> createState() => _ConfigEmailPageState();
}

class _ConfigEmailPageState extends State<ConfigEmailPage> {
  final controllerReference = Get.lazyPut(
    () => ConfigEmailController(),
  );
  final controller = Get.find<ConfigEmailController>();

  void loadInfosIfExist() async {
    controller.controllerEmail.text = await controller.getEmail();
    controller.controllerUsername.text = await controller.getUsername();
  }

  @override
  void initState() {
    setState(() {
      loadInfosIfExist();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = DeviceUtils.width(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Voltar'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Theme.of(context).iconTheme.color,
          onPressed: () {
            Get.to(() => const ChooseMode());
          },
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: width * 0.090),
              Image.asset("assets/images/logo.png"),
              SizedBox(height: width * 0.030),
              CustomText(
                text: "Configurar Email",
                style: TextStyles.defaultStyle,
              ),
              SizedBox(height: width * 0.15),
              CustomContainer(
                width: width * 0.80,
                children: [
                  TextField(
                    controller: controller.controllerEmail,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Insira seu Email',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  TextField(
                    controller: controller.controllerUsername,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Insira o nome da criança',
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(height: width * 0.04),
                  CustomButton(
                    onPressed: () {
                      controller.setEmailInformations();
                    },
                    title: "Configurar Email",
                    style: TextStyles.whiteTextButtonStyle,
                    color: ColorStyle.buttonBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
