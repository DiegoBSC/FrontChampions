import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/models/rol_view.dart';

const primaryColor = Color(0xFF6aa84f);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const successColor = Color(0xFF4F66A8);
const dangerColor = Color(0xFFA84F6A);

const defaultPadding = 16.0;

const screenNew = 'SCREENNEW';
const screenList = 'SCREENLIST';
const screenVoid = 'SCREENVOID';

List<RolView> listRoles = [
  RolView(label: 'Administrador', name: 'ROLE_ADMIN', isSelect: false),
  RolView(label: 'Usuario', name: 'ROLE_USER', isSelect: false),
];
