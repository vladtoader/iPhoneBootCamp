//
//  Register.h
//  Hi My Name Is
//
//  Created by Vlad Toader on 6/17/11.
//  Copyright 2011 Progressive Insurance. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Register : NSObject {
    NSString *mName;
}

-(id) initWithName:(NSString *) name;
-(NSUInteger) getCharacterCount:(NSString *) name;
-(void) printName;

@end
