import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

class NetworkNotifier {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  late bool isWifiConnected;
  late String ipAddress;

  StreamController<bool> _wifiStatusController =
      StreamController<bool>.broadcast();
  Stream<bool> get wifiStatusStream => _wifiStatusController.stream;

  StreamController<String> _ipAddressController =
      StreamController<String>.broadcast();
  Stream<String> get ipAddressStream => _ipAddressController.stream;

  NetworkNotifier() {
    isWifiConnected = false;
    ipAddress = '';

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      _updateNetworkInfo(result);
    });

    _updateNetworkInfo(ConnectivityResult.none); // Initialize with no network
  }

  void _updateNetworkInfo(ConnectivityResult result) async {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      ipAddress = await getCurrentIPAddress();
    }

    if (result == ConnectivityResult.wifi) {
      isWifiConnected = true;
    } else {
      isWifiConnected = false;
    }

    _wifiStatusController.add(isWifiConnected);
    _ipAddressController.add(ipAddress);
  }

  Future<String> getCurrentIPAddress() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4 &&
              !addr.isLoopback &&
              !addr.isLinkLocal &&
              !addr.isMulticast) {
            return addr.address;
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
    return '';
  }

  void dispose() {
    _connectivitySubscription.cancel();
    _wifiStatusController.close();
    _ipAddressController.close();
  }
}
