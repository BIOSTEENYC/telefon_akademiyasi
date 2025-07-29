import 'dart:typed_data';

class ObfuscationUtil {
  static const int _xorKey = 0x5A; 

  static Uint8List deobfuscate(Uint8List data) {
    final deobfuscatedData = Uint8List(data.length);
    for (int i = 0; i < data.length; i++) {
      deobfuscatedData[i] = data[i] ^ _xorKey;
    }
    return deobfuscatedData;
  }

  static Uint8List obfuscate(Uint8List data) {
    final obfuscatedData = Uint8List(data.length);
    for (int i = 0; i < data.length; i++) {
      obfuscatedData[i] = data[i] ^ _xorKey;
    }
    return obfuscatedData;
  }
}