import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/constants.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Reservas Mensuales",
    numOfFiles: 1328,
    svgSrc: "assets/icons/config.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Reservas ultima semana",
    numOfFiles: 1328,
    svgSrc: "assets/icons/config.svg",
    totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Reservas diarias",
    numOfFiles: 1328,
    svgSrc: "assets/icons/config.svg",
    totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Promedio",
    numOfFiles: 5328,
    svgSrc: "assets/icons/config.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
