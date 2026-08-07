import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ConnectedAccount {
  final String id;
  final String platform;
  final String accountName;
  final bool isAuthorized;
  final DateTime? connectedAt;
  final List<String> permissions;

  ConnectedAccount({
    required this.id,
    required this.platform,
    required this.accountName,
    this.isAuthorized = false,
    this.connectedAt,
    required this.permissions,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'platform': platform,
        'accountName': accountName,
        'isAuthorized': isAuthorized,
        'connectedAt': connectedAt?.toIso8601String(),
        'permissions': permissions,
      };

  factory ConnectedAccount.fromJson(Map<String, dynamic> json) => ConnectedAccount(
        id: json['id'],
        platform: json['platform'],
        accountName: json['accountName'],
        isAuthorized: json['isAuthorized'] ?? false,
        connectedAt: json['connectedAt'] != null ? DateTime.parse(json['connectedAt']) : null,
        permissions: List<String>.from(json['permissions'] ?? []),
      );
}

class ScheduledPost {
  final String id;
  final String platform;
  final String title;
  final String body;
  final DateTime scheduledTime;
  final String status;

  ScheduledPost({
    required this.id,
    required this.platform,
    required this.title,
    required this.body,
    required this.scheduledTime,
    required this.status,
  });
}

class AccountAutomationService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String _accountsKey = 'fs_agent_connected_accounts';

  Future<bool> authorizePlatform(String platform, String accountName, List<String> permissions) async {
    final accounts = await getConnectedAccounts();
    final newAccount = ConnectedAccount(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      platform: platform,
      accountName: accountName,
      isAuthorized: true,
      connectedAt: DateTime.now(),
      permissions: permissions,
    );

    accounts.removeWhere((a) => a.platform == platform);
    accounts.add(newAccount);

    await _saveConnectedAccounts(accounts);
    return true;
  }

  Future<void> revokePlatform(String platform) async {
    final accounts = await getConnectedAccounts();
    accounts.removeWhere((a) => a.platform == platform);
    await _saveConnectedAccounts(accounts);
  }

  Future<List<ConnectedAccount>> getConnectedAccounts() async {
    final data = await _storage.read(key: _accountsKey);
    if (data == null) return [];
    try {
      return [];
    } catch (_) {
      return [];
    }
  }

  Future<void> _saveConnectedAccounts(List<ConnectedAccount> list) async {}
}
