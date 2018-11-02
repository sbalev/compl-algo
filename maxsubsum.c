#include <stdio.h>
#include <stdlib.h>
#include <sys/times.h>
#include <unistd.h>

int calc2(int *x, int n) {
  int l, r, s, max_s;

  max_s = 0;
  for (l = 0; l < n; l++) {
    s = 0;
    for (r = l; r < n; r++) {
      s += x[r];
      if (s > max_s) max_s = s;
    }
  }
  return max_s;
}

void init(int *x, int n, int seed) {
  int i;

  srand(seed);
  for (i = 0; i < n; i++) x[i] = -100 + rand() % 200;
}

int main() {
  int n_max = 100000;
  int n_step = 1000;
  int n, *x;
  clock_t t_start, t_end;
  double t2;

  x = malloc(n_max * sizeof(int));
  init(x, n_max, 666);

  for (n = n_step; n <= n_max; n += n_step) {
    t_start = times(NULL);
    calc2(x, n);
    t_end = times(NULL);
    t2 = (double)(t_end - t_start) / sysconf(_SC_CLK_TCK);
    printf("%10d%10.2f\n", n, t2);
  }
  return 0;
}
