#include "common.h"

unsigned int mcd(unsigned int m, unsigned int n) {
    if ( n == 0 ) {
        return m;
    }
    return mcd(n, m % n);
}

unsigned int mcm(unsigned int m, unsigned int n) {
    return ( m * n ) / mcd(m, n);
}
