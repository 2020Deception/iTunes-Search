//
//  ITSAPI.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

@import Foundation;

#import "ITSMediaObject.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompletionBlock)(NSArray<ITSMediaObject *> * _Nullable items, NSError * _Nullable error);

/*!
 * ITSAPI maintains methods for fetching results.
 */
@interface ITSAPI : NSObject

/*! 
 synchronously fetch the items.
 @param term is the query term. This is determined by user input.
 @param entity is an optional param passed in by selection on the Entity Screen.
 */
+ (NSArray<ITSMediaObject *> *)getItemsForTerm:(NSString *)term entity:(NSString * _Nullable)entity;


/*! 
 asynchronously fetch the items.
 @param term is the query term. This is determined by user input.
 @param entity is an optional param passed in by selection on the Entity Screen.
 @param completion the completion block for the async call.
 */
+ (void)getItemsForTerm:(NSString *)term entity:(NSString * _Nullable)entity competion:(CompletionBlock)completion;

/*!
 creates query URL from relevent properties.
 @param term is the query term. This is determined by user input.
 @param entity is an optional param passed in by selection on the Entity Screen.
 */
+ (NSURL *)urlFromTerm:(NSString *)term entity:(NSString * _Nullable)entity;

@end

NS_ASSUME_NONNULL_END
