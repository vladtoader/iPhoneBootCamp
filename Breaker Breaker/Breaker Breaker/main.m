//
//  main.m
//  Breaker Breaker
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:@"first", @"second", @"third", nil];
    
    NSString *arrayObject = [array1 lastObject];
    
    if(arrayObject) {
        [array1 removeLastObject];
    }
    int arrayLength = (int) [array1 count];
    
    for (int c=0; c<arrayLength; ++c) {
        NSLog(@"array1[%d] = %@", c, [array1 objectAtIndex:c]);
    }
    
    [array1 release];
    
    NSLog(@"array1[1] = %@", [array1 objectAtIndex:1]);

//    [array1 release];
    
    [pool drain];
    return 0;
}

