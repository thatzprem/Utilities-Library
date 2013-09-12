//
//  NSMutableArray+Stack.h
//  ios-utilities
//
//  Created by Prem kumar on 12/09/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

/**
 It will add the object to the NSMutableArray
 @param object, the object to add to the stack
 @return void
 */
- (void)push:(id)object;

/**
 It will return and delete the last object in the NSMutableArray.
 @return id, returns the last object from the NSMutableArray
 */
- (id) pop;

/**
 It will return (but do not delete) the last object in the NSMutableArray.
 @return id, returns the last object from the NSMutableArray
 */
- (id) peek;

@end
