//
//  Location.h
//  Exercise20-IWasHere
//
//  Created by Vlad Toader on 6/19/11.
//  Copyright (c) 2011 Progressive Insurance. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lon;
@property (nonatomic, retain) NSDate * timestamp;

@end
