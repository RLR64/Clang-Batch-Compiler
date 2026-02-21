// This program prints the C++ language standard your compiler is currently
// This program is an edited version of the learncpp.com version
// (https://www.learncpp.com/cpp-tutorial/what-language-standard-is-my-compiler-using/)

#include <iostream>
#include <string>

static const long stdCode[] = {199711L, 201103L, 201402L, 201703L,
							   202002L, 202302L, 202602L}; // Fixed C++26 date

static const std::string stdName[] = {"Pre-C++11", "C++11", "C++14", "C++17",
									  "C++20",	   "C++23", "C++26"};

// Calculate array size automatically
static const int numStandards = sizeof(stdCode) / sizeof(stdCode[0]);

static long getCPPStandard() {
#if defined(_MSVC_LANG)
	return _MSVC_LANG;
#elif defined(_MSC_VER)
	return -1;
#else
	return __cplusplus;
#endif
}

int main() {
	const long standard = getCPPStandard();

	if (standard == -1) {
		std::cout << "Error: Unable to determine your C++ language standard.\n";
		return 0;
	}

	bool found = false;

	for (int i = 0; i < numStandards; ++i) {
		if (standard == stdCode[i]) {
			std::cout << "Your compiler is using " << stdName[i]
					  << " (language standard code " << standard << "L)\n";
			found = true;
			break;
		}

		if (standard < stdCode[i]) {
			std::cout << "Your compiler is using a preview/pre-release of "
					  << stdName[i] << " (language standard code " << standard
					  << "L)\n";
			found = true;
			break;
		}
	}

	// Fallback for standards newer than this script knows about (e.g., C++29)
	if (!found) {
		std::cout << "Your compiler is using a standard newer than C++26 "
				  << "(language standard code " << standard << "L)\n";
	}

	return 0;
}