#include "cpp_print.h"

#include "c_print.h"

void print_cpp(std::string str) {
    char* c_str = &str[0];
    print_c(c_str);
    return;
}