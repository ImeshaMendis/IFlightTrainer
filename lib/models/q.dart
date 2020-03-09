class Q{
  final String q;
  final String a;
  final String b;
  final String c;
  final String d;
  final String correct;

  Q({this.q, this.a, this.b, this.c,this.d, this.correct});


  factory Q.fromJson(Map<String,dynamic> json){
      return Q(
        q:json['question'] as String,
        a:json['a'] as String,
        b:json['b'] as String,
        c:json['c'] as String,
        d:json['d'] as String,
        correct:json['correct'] as String,

      );
  }
}