//
//  DataHandlers.h
//  ios-utilities
//
//  Created by Prem kumar on 21/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHandlers : NSObject

/**
 It will check if the file, or directory, exists in the given path
 @param pathToFile the name of the file
 @param isADirectory tells if it is a directory or only a file.
 @return BOOL if it exists or not
 */
+ (BOOL)checkFileWithPathToFile:(NSString*)pathToFile isDirectory:(BOOL)isADirectory;

/**
 It will create a folder in a given path
 @param pathToFolder The path to the folder
 @return BOOL if everything went well
 */
+ (BOOL)createFolderWithPath:(NSString*)pathToFolder;

/**
 It will verify if a folder exists, if yes, then it won't do anything
 If not, it will create it
 @param pathToFolder the path to the folder
 @return BOOL if everything went well
 */
+ (BOOL) verifyAndCreateFolderWithPath:(NSString*)pathToFolder;

/**
 It returns the size of a file.
 @param filePath the path to the file
 @return float the size of the path
 */
+ (float)sizeOfFileOnWithPath:(NSString*)filePath;

/**
 It will check if a file with that name exists in the folder (only the name without the extension)
 @param folderPath the path to the folder
 @param fileName the file's name
 @return BOOL if it exists or not
 */
+ (BOOL)checkIfFileNameExistsAtPath:(NSString*)folderPath withFileName:(NSString*)fileName;

/**
 It will check if this folder has more depth, or if it's the last node
 @param folderPath the path to the folder
 @return BOOL YES if it is the last node, NO it as more folders insde
 */
+ (BOOL)isFolderLastNode:(NSString*)pathToFolder;



@end
