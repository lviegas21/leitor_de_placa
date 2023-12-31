import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_cicero/controller/home_page_controller.dart';

import 'components/text_field_components.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();

    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(
          'Leitor de Placas',
          style: TextStyle(
            fontSize: 24, // Tamanho da fonte
            fontWeight: FontWeight.bold, // Negrito
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => !controller.isButton.value
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.indigo],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedContainer(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              controller.isButton.value = true;
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 48, // Tamanho do ícone aumentado
                            ),
                            label: Text(
                              'Iniciar Leitor de Placas',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          )),
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Toque no Botão para iniciar o leitor de placas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24, // Aumentei o tamanho da fonte para 24
                            fontWeight: FontWeight.bold, // Negrito
                            fontStyle: FontStyle.italic, // Itálico
                            letterSpacing: 1.2, // Espaçamento entre letras
                            wordSpacing: 2.0, // Espaçamento entre palavras
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.indigo,
                            width: 4.0, // Largura da borda
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: controller.controller.value.aspectRatio,
                          child: CameraPreview(controller.controller),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton(
                        onPressed: () => controller.takePicture(context),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // Cor de fundo
                          onPrimary: Colors.white, // Cor do texto
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Borda arredondada
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12), // Espaçamento interno
                        ),
                        child: Text(
                          'Capturar Placa',
                          style: TextStyle(
                            fontSize: 20, // Tamanho da fonte
                            fontWeight: FontWeight.bold, // Negrito
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
