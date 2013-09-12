//
//  NSMutableArray+Stack.m
//  ios-utilities
//
//  Created by Prem kumar on 12/09/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void) push: (id)object {
    [self addObject:object];
}

- (id) pop {
    id object = nil;
    if ([self count] != 0) {
        object = [self lastObject];
        [self removeLastObject];
    }
    return object;
}

- (id) peek {
    id object = nil;
    if ([self count] != 0) {
        object = [self lastObject];
    }
    return object;
}

@end
