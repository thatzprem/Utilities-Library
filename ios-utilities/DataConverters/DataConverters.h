//
//  DataConverters.h
//  ios-utilities
//
//  Created by Prem kumar on 21/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DataConverters : NSObject

/**
 It will convert a given NSManagedobject properties into a dictionary
 @param managedObject the managed object
 @return NSDictionary as property names as keys and its contents as values, if error returns nil.
 */
+(NSDictionary *)convertManagedObjectToDictionary:(NSManagedObject *)managedObject;

/**
 It will check if the json is valid on the specified URL
 @param url valid URL that returns a json response
 @return BOOL yes,if json is valid & no if reveived json is invalid or received data is nil.
 */
+(BOOL)isValidJsonFromURL:(NSURL *)url;

/**
 It will convert a jsonString to a NSDictionary
 @param jsonString a json string to convert
 @return NSDictionary is conversion is successfull, nil if conversion fails.
 */
+(NSDictionary *)converJsonStringToDictionary:(NSString *)jsonString;

/**it will check of the passed object is empty
 @param object that has to be tested
 @return BOOL yes if object is empty.
*/
+(BOOL)isObjectEmpty:(id)object;

/**
 It will remove the white spaces and the end of the string
 @param stringtoremove @"  TestString   ";
 @return NSString @"  TestString;
 */
+ (NSString *)removeEndSpaceFromString:(NSString *)string;

/**
 It will remove the multiple white spaces and replace with single white spaces everywhere
 @param string @"    Hello      this  is a   long       string!   "
 @return NSString @"Hello this is a long string!"
 */
+(NSString *)convertSequencesOfWhiteSpaceIntoSingleCharacter:(NSString *)string;

/**
 It will remove special characters "+-*!%$/_" from the passed string
 @param string @"This+_is*astringwith$special!characters"
 @return NSString @"Thisisastringwithspecialcharacters"
 */
+(NSString *)removeSpecialCharactersFromString:(NSString *)stringToFormat;



@end
