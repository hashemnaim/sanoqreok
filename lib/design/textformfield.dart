import 'package:flutter/material.dart';

import '../controller/controller.dart';

controller control = controller();

class mytextformfield {
  TextFormField passField = TextFormField(
    obscureText: true,
    obscuringCharacter: "*",
    decoration: const InputDecoration(
        icon: Icon(Icons.lock_outline),
        hintText: "ادخل كلمة المرور",
        labelText: "كلمة المرور"),
    onSaved: (val) {
      control.password = val!;
    },
    validator: (val) {
      if (val!.length > 20) {
        return "يجب ان تكون كلمة المرور أقل من 20 حرف/رقم";
      }
      if (val.length < 6) {
        return "لا يمكن ان تكون كلمة المرور أقل من 6 أحرف/أرقام";
      }
      return null;
    },
  );

  TextFormField userField = TextFormField(
    decoration: const InputDecoration(
        icon: Icon(Icons.email),
        hintText: "ادخل البريد الالكتروني",
        labelText: " البريد الالكتروني"),
    onSaved: (val) {
      control.email = val!;
    },
    validator: (val) {
      control.isEmail(val!);
      return null;
    },
  );

  TextFormField nameFiled = TextFormField(
    decoration: const InputDecoration(
        icon: Icon(Icons.person),
        hintText: "ادخل اسمك الثلاثي ",
        labelText: " اسمك "),
    onSaved: (val) {
      control.name = val!;
    },
    validator: (val) {
      if (val!.length > 50) {
        return "لايمكن ان يكون الاسم اكثر من 50 حرفاَ";
      }
      if (val.length < 2) {
        return "لايمكن ان يكون الاسم اقل من حرفين";
      }
      return null;
    },
  );
}
