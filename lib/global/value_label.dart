class ValueLabel {
  static String stateLabel(String value) {
    switch (value) {
      case 'ACT':
        return 'Activo';
      case 'INA':
        return 'Inactivo';
      default:
        return '';
    }
  }
}
