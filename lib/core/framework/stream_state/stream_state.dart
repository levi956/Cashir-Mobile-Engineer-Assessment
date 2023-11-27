import 'dart:async';
import 'dart:io';

import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'stream_state.freezed.dart';

@freezed
class StreamState<T> with _$StreamState<T> {
  const factory StreamState.initial() = _Initial;
  const factory StreamState.loading() = _Loading;
  const factory StreamState.success(T data) = _Success;
  const factory StreamState.failure(Object error) = _Failure;
}

extension ListenBuild<T> on Stream<StreamState<T>> {
  StreamSubscription<StreamState<T>> listenWhen<K>({
    K? Function()? initial,
    K? Function()? loading,
    K? Function(T data)? success,
    K? Function(Object error)? failure,
  }) {
    return listen((event) {
      event.when(
        initial: initial ?? (() => null),
        loading: loading ?? (() => null),
        success: success ?? ((_) => null),
        failure: failure ?? ((_) => null),
      );
    });
  }

  Widget buildWhen({
    Widget Function()? initial,
    Widget Function()? loading,
    Widget Function(T data)? success,
    Widget Function(Object error)? failure,
  }) {
    return StreamBuilder(
      stream: this,
      builder: (context, snapshot) {
        const fallback = SizedBox.shrink();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return fallback;
        }
        final state = snapshot.requireData;
        return state.when(
          initial: initial ?? (() => fallback),
          loading: loading ?? (() => fallback),
          success: success ?? ((_) => fallback),
          failure: failure ?? ((_) => fallback),
        );
      },
    );
  }
}

extension AsStreamState<T> on Stream<T> {
  Stream<StreamState<T>> asStreamState({
    bool convertExceptionToString = true,
    bool isDebug = false,
    bool startsWithLoading = true,
  }) {
    var baseStream = map((data) {
      return StreamState<T>.success(data);
    });
    if (startsWithLoading) {
      baseStream = baseStream.startWith(StreamState<T>.loading());
    }
    if (!isDebug) {
      return baseStream.onErrorReturnWith(
        (error, _) {
          if (convertExceptionToString) {
            return StreamState<T>.failure(mapExceptionToString(
              error,
            ));
          }
          return StreamState<T>.failure(error);
        },
      );
    }
    return baseStream;
  }
}

const default_ = "Something went wrong";
String mapExceptionToString(Object error) {
  if (error is TimeoutException) {
    return 'Timeout';
  }
  if (error is SocketException) {
    return 'No internet connection';
  }
  if (error is AppException) {
    return error.message;
  }

  return error.toString();
}
