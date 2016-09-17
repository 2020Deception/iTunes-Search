//
//  ITSJsonParser.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 * ITSJsonParser contains JSON parsing helper functions.
 */
@interface ITSJsonParser : NSObject

/*! 
 * returns @0 if nil 
 */
+ (NSNumber *)extractNumberFromJSON:(id _Nullable)json;

/*!
 * returns @[] if nil
 */
+ (NSArray *)extractArrayFromJSON:(id _Nullable)json;

/*!
 * returns @{} if nil
 */
+ (NSDictionary *)extractDictionaryFromJSON:(id _Nullable)json;

/*!
 * returns @"" if nil
 */
+ (NSString *)extractStringFromJSON:(id _Nullable)json;

/*!
 * returns false if nil
 */
+ (BOOL)extractBoolFromJSON:(id _Nullable)json;

@end

NS_ASSUME_NONNULL_END
