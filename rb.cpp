#include <iostream>
#include "robin_hood.h"
using namespace std;
#include <vector>
#include <time.h>
#include <chrono>

string RandomString(int len)
{
   string str = "abcdefghijklmnopqrstuvwxyz";
   string newstr;
   int pos;
   while(newstr.size() != len) {
    pos = ((rand() % (str.size() - 1)));
    newstr += str.substr(pos,1);
   }
   return newstr;
}

int main()  {
    std::vector<string> strs;
    for (int i = 0; i < 3000; i++) {
      strs.push_back(RandomString(100));
    }
    robin_hood::unordered_map<string, int> m;
    for (int i = 0; i < 3000; i++) {
      m[strs[i]] = i;
    }
    int a = 1;
    auto start = std::chrono::steady_clock::now();
    for (int j = 0; j < 10000; j++) {
      for (int i = 0; i < 3000; i++) {
        a += m[strs[i]];
      }
    }
    auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::steady_clock::now( ) - start);
    
    cout << elapsed.count( ) << '\n';
    cout << a;
    return 0;
}