// This program prints the C language standard your compiler is currently
// This program is an edited version of the learncpp.com version but for C
// Standards
// (https://www.learncpp.com/cpp-tutorial/what-language-standard-is-my-compiler-using/)

#include <stdio.h>

static const int   numCStandards = 5;
static const long  cStdCode[5]   = {199409L, 199901L, 201112L, 201710L, 202311L};
static const char* cStdName[5]   = {"C95", "C99", "C11", "C17", "C23"};

static long getCStandard(void) {
#if defined(__STDC_VERSION__)
	return __STDC_VERSION__;
#elif defined(__STDC__)
	return 198900L; // C89/C90
#else
	return -1;
#endif
}

int main(void) {
	const long standard = getCStandard();
	int        found    = 0;

	if (standard == -1) {
		printf("Error: Unable to determine your C language standard.\n");
		return 0;
	}

	for (int i = 0; i < numCStandards; i++) {
		if (standard == cStdCode[i]) {
			printf("Your compiler is using %s (standard code %ldL)\n", cStdName[i], standard);
			found = 1;
			break;
		}

		if (standard < cStdCode[i]) {
			printf("Your compiler is using a preview/pre-release of %s "
			       "(standard code %ldL)\n",
			       cStdName[i], standard);
			found = 1;
			break;
		}
	}

	if (!found) {
		if (standard == 198900L) {
			printf("Your compiler is using C89/C90 (standard code %ldL)\n", standard);
		} else {
			printf("Your compiler is using an unknown/future C standard (code "
			       "%ldL)\n",
			       standard);
		}
	}
	return 0;
}