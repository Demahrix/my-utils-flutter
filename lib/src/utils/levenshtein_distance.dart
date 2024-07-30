
int levenshteinDistance(String a, String b) {
  if (a == b)
    return 0;

    if (a.length > b.length) {
      var tmp = a;
      a = b;
      b = tmp;
    }

    var la = a.length;
    var lb = b.length;

    while (la > 0 && (a.codeUnitAt(la - 1) == b.codeUnitAt(lb - 1))) {
      la--;
      lb--;
    }

    int offset = 0;

    while (offset < la && (a.codeUnitAt(offset) == b.codeUnitAt(offset))) {
      offset++;
    }

    la -= offset;
    lb -= offset;

    if (la == 0 || lb < 3) {
      return lb;
    }

    int x = 0;
    int y;
    int d0;
    int d1;
    int d2;
    int d3;
    int dd = -1;
    int dy;
    int ay;
    int bx0;
    int bx1;
    int bx2;
    int bx3;

    var vector = <int>[];

    for (y = 0; y < la; y++) {
      vector.add(y + 1);
      vector.add(a.codeUnitAt(offset + y));
    }

    var len = vector.length - 1;

    for (; x < lb - 3;) {
      bx0 = b.codeUnitAt(offset + (d0 = x));
      bx1 = b.codeUnitAt(offset + (d1 = x + 1));
      bx2 = b.codeUnitAt(offset + (d2 = x + 2));
      bx3 = b.codeUnitAt(offset + (d3 = x + 3));
      dd = (x += 4);
      for (y = 0; y < len; y += 2) {
        dy = vector[y];
        ay = vector[y + 1];
        d0 = _min(dy, d0, d1, bx0, ay);
        d1 = _min(d0, d1, d2, bx1, ay);
        d2 = _min(d1, d2, d3, bx2, ay);
        dd = _min(d2, d3, dd, bx3, ay);
        vector[y] = dd;
        d3 = d2;
        d2 = d1;
        d1 = d0;
        d0 = dy;
      }
    }

    for (; x < lb;) {
      bx0 = b.codeUnitAt(offset + (d0 = x));
      dd = ++x;
      for (y = 0; y < len; y += 2) {
        dy = vector[y];
        vector[y] = dd = _min(dy, d0, dd, bx0, vector[y + 1]);
        d0 = dy;
      }
    }

    return dd;
}

int _min(int d0, int d1, int d2, int bx, int ay) {
  return d0 < d1 || d2 < d1
    ? d0 > d2
      ? d2 + 1
      : d0 + 1
    : bx == ay
      ? d1
      : d1 + 1;
}
