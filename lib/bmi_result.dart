import 'dart:math';

class BMI {
  double h;
  double w;

  //double result;

  getResult() {
    double result = this.w / pow(this.h / 100, 2);
    return result;
  }

  type() {
    double num = this.w / pow(this.h / 100, 2);
    //String text = "thin";
    if (num > 25) {
      return "Overweight";
    } else if (num > 18.5) {
      return "Normal";
    } else {
      return "thin";
    }
    // return text;
  }

  advice() {
    double num = this.w / pow(this.h / 100, 2);
    //String text = "thin";
    if (num > 25) {
      return "5es shwaya";
    } else if (num > 18.5) {
      return "3la wd3ak";
    } else {
      return "et9za shwaya";
    }
  }

  BMI(this.w, this.h);
}
