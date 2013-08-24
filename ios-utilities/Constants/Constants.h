//
//  Constants.h
//  ios-utilities
//
//  Created by Prem kumar on 21/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

/** Will only output when on Debug mode */
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

/** ALog always displays output regardless of the DEBUG setting */
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

