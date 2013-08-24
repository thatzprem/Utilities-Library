//
//  DataHandlers.m
//  ios-utilities
//
//  Created by Prem kumar on 21/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "DataHandlers.h"

/** the factor we need to divide the size of the file to convert it to Megabytes */
#define MEGA_BYTE_FACTOR 1048576


@implementation DataHandlers

+ (BOOL)checkFileWithPathToFile:(NSString*)pathToFile isDirectory:(BOOL)isADirectory
{
    NSString *finalPath=nil;
    
    if(!isADirectory)
    {
        NSString *path=[pathToFile stringByDeletingLastPathComponent];
        NSString *nameOfFile=[[pathToFile lastPathComponent] lowercaseString];
        finalPath=[NSString stringWithFormat:@"%@/%@",path,nameOfFile];
    }
    else
    {
        finalPath=pathToFile;
    }
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:finalPath isDirectory:&isADirectory];
    
    return fileExists;
}

+ (BOOL)createFolderWithPath:(NSString*)pathToFolder
{
    BOOL successCreatingFolder=[[NSFileManager defaultManager] createDirectoryAtPath:pathToFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    return successCreatingFolder;
}

+ (BOOL) verifyAndCreateFolderWithPath:(NSString*)pathToFolder
{
    BOOL succeessVerifyingAndCreating=NO;
    BOOL rootExists=[self checkFileWithPathToFile:pathToFolder isDirectory:YES];
    DLog(@"%@",pathToFolder);
    if(rootExists)
    {
        // It exists, we won't do anything
        DLog(@"Folder exists. No need to create folder");
    }
    else{
        // It doesn't exist, lets create it
        DLog(@"Folder will be created");
        succeessVerifyingAndCreating=[self createFolderWithPath:pathToFolder];
    }
    
    return succeessVerifyingAndCreating;
}

+ (float)sizeOfFileOnWithPath:(NSString*)filePath
{
    // First we get a Dictionary with the file's info
    NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
    //We return the size of it
    NSNumber *fileSize = [fileDictionary objectForKey:NSFileSize];
    float fileSizeFloat = [fileSize floatValue]/MEGA_BYTE_FACTOR;
    return fileSizeFloat;
}

+ (BOOL)checkIfFileNameExistsAtPath:(NSString*)folderPath withFileName:(NSString*)fileName
{
    BOOL fileExist=NO;
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *direnum = [manager enumeratorAtPath:folderPath];
    
    NSString *filename=nil;
    
    // we will enumarate all the files inside the folder
    while ((filename = [direnum nextObject] ))
    {
        // It will check if there is a file with that name
        if ([filename rangeOfString:fileName].location != NSNotFound)
        {
            fileExist=YES;
        }
    }
    return fileExist;
}

+ (BOOL)isFolderLastNode:(NSString*)pathToFolder
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *direnum = [manager enumeratorAtPath:pathToFolder];
    
    NSString *filename=nil;
    
    // we will enumarate all the files inside the folder
    // We only care if it is a folder or not.
    while ((filename = [direnum nextObject] ))
    {
        BOOL isDir;
        NSString *pathToFile=[NSString stringWithFormat:@"%@/%@",pathToFolder,filename];
        BOOL exists = [manager fileExistsAtPath:pathToFile isDirectory:&isDir];
        if (exists) {
            // file exists
            if (isDir) {
                // If we find a directory we will stop immediatly to save processment.
                return NO;
            }
        }
        
    }
    // By default we will assume it's the last node
    return YES;
}


@end
