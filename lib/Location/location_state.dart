import '../models/locationModel.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final List<LocationModel> Address;

  AddressSuccess(this.Address);
}

class AddressFailure extends AddressState {
  final String msg;

  AddressFailure(this.msg);
}