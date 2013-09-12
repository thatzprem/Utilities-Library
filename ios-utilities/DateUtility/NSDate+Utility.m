//
//  NSDate+Utility.m
//  ios-utilities
//
//  Created by Prem kumar on 12/09/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "NSDate+Utility.h"

@implementation NSDate (Utility)

-(NSString *)calculateTimeDifferenceBetweenDates:(NSDate *)endDate
{
    NSTimeInterval timeIntervale  = [endDate timeIntervalSinceDate:self];
    
    int minutes = floor(timeIntervale/60);
    int seconds = trunc(timeIntervale - minutes * 60);
    int hours = minutes / 60;
    NSString *timeString =@"";
    NSString *formatString=@"";
    if(hours > 0){
        formatString=hours==1?@"%d hour":@"%d hours";
        timeString = [timeString stringByAppendingString:[NSString stringWithFormat:formatString,hours]];
    }
    if(minutes > 0 || hours > 0 ){
        formatString=minutes==1?@" %d minute":@" %d minutes";
        timeString = [timeString stringByAppendingString:[NSString stringWithFormat:formatString,minutes]];
    }
    if(seconds >= 0 || hours > 0 || minutes > 0){
        formatString=seconds==1?@" %d second":@" %d seconds";
        timeString  = [timeString stringByAppendingString:[NSString stringWithFormat:formatString,seconds]];
    }
    return timeString;
}

-(BOOL) isLaterThanOrEqualTo:(NSDate*)date {
    return !([self compare:date] == NSOrderedAscending);
}

-(BOOL) isEarlierThanOrEqualTo:(NSDate*)date {
    return !([self compare:date] == NSOrderedDescending);
}
-(BOOL) isLaterThan:(NSDate*)date {
    return ([self compare:date] == NSOrderedDescending);
    
}
-(BOOL) isEarlierThan:(NSDate*)date {
    return ([self compare:date] == NSOrderedAscending);
}

@end
