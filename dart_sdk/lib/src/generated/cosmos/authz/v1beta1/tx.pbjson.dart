///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'authz.pbjson.dart' as $3;
import '../../../google/protobuf/any.pbjson.dart' as $0;
import '../../../google/protobuf/timestamp.pbjson.dart' as $1;

@$core.Deprecated('Use msgGrantDescriptor instead')
const MsgGrant$json = const {
  '1': 'MsgGrant',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {
      '1': 'grant',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cosmos.authz.v1beta1.Grant',
      '8': const {},
      '10': 'grant'
    },
  ],
};

/// Descriptor for `MsgGrant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGrantDescriptor = $convert.base64Decode(
    'CghNc2dHcmFudBIYCgdncmFudGVyGAEgASgJUgdncmFudGVyEhgKB2dyYW50ZWUYAiABKAlSB2dyYW50ZWUSNwoFZ3JhbnQYAyABKAsyGy5jb3Ntb3MuYXV0aHoudjFiZXRhMS5HcmFudEIEyN4fAFIFZ3JhbnQ=');
@$core.Deprecated('Use msgExecResponseDescriptor instead')
const MsgExecResponse$json = const {
  '1': 'MsgExecResponse',
  '2': const [
    const {'1': 'results', '3': 1, '4': 3, '5': 12, '10': 'results'},
  ],
};

/// Descriptor for `MsgExecResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgExecResponseDescriptor = $convert.base64Decode(
    'Cg9Nc2dFeGVjUmVzcG9uc2USGAoHcmVzdWx0cxgBIAMoDFIHcmVzdWx0cw==');
@$core.Deprecated('Use msgExecDescriptor instead')
const MsgExec$json = const {
  '1': 'MsgExec',
  '2': const [
    const {'1': 'grantee', '3': 1, '4': 1, '5': 9, '10': 'grantee'},
    const {
      '1': 'msgs',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Any',
      '8': const {},
      '10': 'msgs'
    },
  ],
};

/// Descriptor for `MsgExec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgExecDescriptor = $convert.base64Decode(
    'CgdNc2dFeGVjEhgKB2dyYW50ZWUYASABKAlSB2dyYW50ZWUSSgoEbXNncxgCIAMoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlCIMq0LRxzZGsuTXNnLCBhdXRoei5BdXRob3JpemF0aW9uUgRtc2dz');
@$core.Deprecated('Use msgGrantResponseDescriptor instead')
const MsgGrantResponse$json = const {
  '1': 'MsgGrantResponse',
};

/// Descriptor for `MsgGrantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGrantResponseDescriptor =
    $convert.base64Decode('ChBNc2dHcmFudFJlc3BvbnNl');
@$core.Deprecated('Use msgRevokeDescriptor instead')
const MsgRevoke$json = const {
  '1': 'MsgRevoke',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'msg_type_url', '3': 3, '4': 1, '5': 9, '10': 'msgTypeUrl'},
  ],
};

/// Descriptor for `MsgRevoke`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRevokeDescriptor = $convert.base64Decode(
    'CglNc2dSZXZva2USGAoHZ3JhbnRlchgBIAEoCVIHZ3JhbnRlchIYCgdncmFudGVlGAIgASgJUgdncmFudGVlEiAKDG1zZ190eXBlX3VybBgDIAEoCVIKbXNnVHlwZVVybA==');
@$core.Deprecated('Use msgRevokeResponseDescriptor instead')
const MsgRevokeResponse$json = const {
  '1': 'MsgRevokeResponse',
};

/// Descriptor for `MsgRevokeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRevokeResponseDescriptor =
    $convert.base64Decode('ChFNc2dSZXZva2VSZXNwb25zZQ==');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {
      '1': 'Grant',
      '2': '.cosmos.authz.v1beta1.MsgGrant',
      '3': '.cosmos.authz.v1beta1.MsgGrantResponse'
    },
    const {
      '1': 'Exec',
      '2': '.cosmos.authz.v1beta1.MsgExec',
      '3': '.cosmos.authz.v1beta1.MsgExecResponse'
    },
    const {
      '1': 'Revoke',
      '2': '.cosmos.authz.v1beta1.MsgRevoke',
      '3': '.cosmos.authz.v1beta1.MsgRevokeResponse'
    },
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    MsgServiceBase$messageJson = const {
  '.cosmos.authz.v1beta1.MsgGrant': MsgGrant$json,
  '.cosmos.authz.v1beta1.Grant': $3.Grant$json,
  '.google.protobuf.Any': $0.Any$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.cosmos.authz.v1beta1.MsgGrantResponse': MsgGrantResponse$json,
  '.cosmos.authz.v1beta1.MsgExec': MsgExec$json,
  '.cosmos.authz.v1beta1.MsgExecResponse': MsgExecResponse$json,
  '.cosmos.authz.v1beta1.MsgRevoke': MsgRevoke$json,
  '.cosmos.authz.v1beta1.MsgRevokeResponse': MsgRevokeResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode(
    'CgNNc2cSTwoFR3JhbnQSHi5jb3Ntb3MuYXV0aHoudjFiZXRhMS5Nc2dHcmFudBomLmNvc21vcy5hdXRoei52MWJldGExLk1zZ0dyYW50UmVzcG9uc2USTAoERXhlYxIdLmNvc21vcy5hdXRoei52MWJldGExLk1zZ0V4ZWMaJS5jb3Ntb3MuYXV0aHoudjFiZXRhMS5Nc2dFeGVjUmVzcG9uc2USUgoGUmV2b2tlEh8uY29zbW9zLmF1dGh6LnYxYmV0YTEuTXNnUmV2b2tlGicuY29zbW9zLmF1dGh6LnYxYmV0YTEuTXNnUmV2b2tlUmVzcG9uc2U=');