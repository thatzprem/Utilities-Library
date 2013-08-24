//
//  DataConverters.m
//  ios-utilities
//
//  Created by Prem kumar on 21/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "DataConverters.h"
#include <objc/runtime.h>

@implementation DataConverters

+(NSDictionary *)convertManagedObjectToDictionary:(NSManagedObject *)managedObject{
    
    if (managedObject){
        NSLog(@"Managed object is nil");
        return nil;
    }
    else{
        
        unsigned int objectsCount;
        objc_property_t *objectProperties = class_copyPropertyList([managedObject class], &objectsCount);
        
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        for(int i = 0; i < objectsCount; i++) {
            objc_property_t property = objectProperties[i];
            NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            id object = [managedObject valueForKey:name];
            [dictionary setObject:((object == nil) ? [NSNull null] : object) forKey:name];
        }
        free(objectProperties);
        return dictionary;
    }
}

+(BOOL)isValidJsonFromURL:(NSURL *)url{
    
    BOOL result = FALSE;
    
    if ([self isObjectEmpty:url]) {
        DLog(@"Received url parameter is nil.");
        
    }else{
        
        NSData *data = nil;
        NSError *error = nil;
        
        data = [NSData dataWithContentsOfURL:url];
        if (data != nil) {
            id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            result = [NSJSONSerialization isValidJSONObject:jsonObj];
        }
    }
    return result;
}

+(NSDictionary *)converJsonStringToDictionary:(NSString *)jsonString
{
    NSString *stringToConvert = jsonString;
    
    if (![self isObjectEmpty:stringToConvert]) {
        
        NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSError *error = nil;
        NSDictionary *convertedData = nil;
        
        convertedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (error != nil){
            DLog(@"Error converting jsonString to dictionary: %@", [error description]);
            convertedData = nil;
        }
        else if ([convertedData isKindOfClass:[NSDictionary class]]) {
            DLog(@"The converted data is of kind NSDictionary");
        }
        else if ([convertedData isKindOfClass:[NSArray class]]){
            DLog(@"The converted data is of kind NSArray");
            convertedData = nil;
        }
        else{
            DLog(@"The converted data is not NSDictionary/NSArray");
            convertedData = nil;
        }
        return convertedData;
    }
    else{
        DLog(@"The received jsonString is nil")
        return nil;
    }
}

+(BOOL)isObjectEmpty:(id)object
{
    return object == nil || ([object respondsToSelector:@selector(length)] && [(NSData *)object length] == 0) || ([object respondsToSelector:@selector(count)] && [(NSArray *)object count] == 0);
}

+(NSString *)trimWhiteSpaces:(NSString *)stringToTrim{
    
    NSString *trimmedString = nil;
    if (![self isObjectEmpty:stringToTrim]) {
        trimmedString = [stringToTrim stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    }
    return trimmedString;
}

+ (NSString *)removeEndSpaceFromString:(NSString *)string{
    
    NSUInteger location = 0;
    unichar charBuffer[[string length]];
    [string getCharacters:charBuffer];
    int i = 0;
    for ( i = [string length]; i >0; i--){
        if (![[NSCharacterSet whitespaceCharacterSet] characterIsMember:charBuffer[i - 1]]){
            break;
        }
    }
    return  [string substringWithRange:NSMakeRange(location, i  - location)];
}

+(NSString *)convertSequencesOfWhiteSpaceIntoSingleCharacter:(NSString *)string{
    
    if (![self isObjectEmpty:string]) {
        
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
        NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
        
        NSArray *parts = [string componentsSeparatedByCharactersInSet:whitespaces];
        NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
        string = [filteredArray componentsJoinedByString:@" "];
    }
    return string;
}

@end
