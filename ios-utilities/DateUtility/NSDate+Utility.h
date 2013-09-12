//
//  NSDate+Utility.h
//  ios-utilities
//
//  Created by Prem kumar on 12/09/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utility)

/**
 It will calculate the time difference between self and the end date passed 
 @param endDate, the end date to calculate the difference.
 @return NSString, returns the time difference as NSString.
 */
-(NSString *)calculateTimeDifferenceBetweenDates:(NSDate *)endDate;

/**
 It will check if 'date' is older or equal to the self.date
 @param date, reference date.
 @return BOOL, Yes if condition passes.
 */
-(BOOL) isLaterThanOrEqualTo:(NSDate*)date;

/**
 It will check if 'date' is earlier or equal to the self.date
 @param date, reference date.
 @return BOOL, Yes if condition passes.
 */
-(BOOL) isEarlierThanOrEqualTo:(NSDate*)date;

/**
 It will check if 'date' is older that the self.date
 @param date, reference date.
 @return BOOL, Yes if condition passes.
 */
-(BOOL) isLaterThan:(NSDate*)date;

/**
 It will check if 'date' is older that the self.date
 @param date, reference date.
 @return BOOL, Yes if condition passes.
 */
-(BOOL) isEarlierThan:(NSDate*)date;

@end
