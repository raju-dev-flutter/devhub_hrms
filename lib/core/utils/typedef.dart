import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../core.dart';
import '../networking/networking.dart';

typedef DataMap = Map<String, String>;

typedef JSON = Map<String, dynamic>;

typedef QueryParams = Map<String, String>;

typedef RouteBuilder = Widget Function(BuildContext);

typedef ItemBuilder<T> = Widget Function(BuildContext, T);

typedef ResultFuture<T> = Future<Either<CustomException, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMapString = Map<String, String>;

typedef PositionCallBack = Function(Position position);

typedef FutureVoid = Future<void>;

typedef FutureBool = Future<bool>;

typedef Bool = bool;
