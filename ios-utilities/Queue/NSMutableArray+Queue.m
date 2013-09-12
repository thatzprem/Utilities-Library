//
//  NSMutableArray+Queue.m
//  ios-utilities
//
//  Created by Prem kumar on 12/09/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

- (void) enqueue:(id)anObject {
	
    [self addObject:anObject];
    
}
- (id) dequeue {
	
    if ([self count] == 0) {
		return nil;
	}
	
    id headObject = [self objectAtIndex:0];
	
    if (headObject != nil) {
        [self removeObjectAtIndex:0];
		
    }
    return headObject;
}

- (id) peek {
    
    id item = nil;
    if ([self count] != 0) {
        item = [self objectAtIndex:0];
    }
    return item;
}


@end
