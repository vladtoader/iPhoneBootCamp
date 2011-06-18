//
//  main.c
//  PointyPointers
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
    int *foo_ptr;
    int foo1 = 0;
    
    foo_ptr = &foo1;
    
    for((*foo_ptr)=1;(*foo_ptr)<10;(*foo_ptr)++) {}
    printf("foo1 = %d\n", *foo_ptr);
    
    return 0;
}

