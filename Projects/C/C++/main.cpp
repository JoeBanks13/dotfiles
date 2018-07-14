#include <iostream>

using namespace std;

void add_to_pointer(int * ptr, int to_add) {
    *ptr = *ptr + to_add;
}

void print_value_of_pointer(int * ptr) {
    std::cout << "Value of pointer at ";
    std::cout << std::hex << ptr;
    std::cout << std::dec << " is " << *ptr << std::endl;
}

int main() {
    int lol = 5;
    
    std::cout << "Starting with lol being equal to " << lol << std::endl;

    std::cout << "Adding 5 to pointer" << std::endl;

    add_to_pointer(&lol, 5);

    print_value_of_pointer(&lol);

    std::cout << "Subtracting 5 from pointer" << std::endl;

    add_to_pointer(&lol, -5);

    print_value_of_pointer(&lol);
    
    return 0;
}
