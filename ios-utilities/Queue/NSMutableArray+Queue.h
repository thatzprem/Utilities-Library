//
//  NSMutableArray+Queue.h
//  ios-utilities
//
//  Created by Prem kumar on 12/09/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

/**
 It will add the object to the NSMutableArray
 @param obj, the object to add to the queue
 @return void
 */
- (void) enqueue:(id)obj;

/**
 It will return and delete the first object in the NSMutableArray.
 @return id, returns the first object from the NSMutableArray
 */
- (id) dequeue;

/**
 It will return (but do not delete) the first object in the NSMutableArray.
 @return id, returns the first object from the NSMutableArray
 */
- (id) peek;


@end
