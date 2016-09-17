//
//  ITSJsonParser.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSJsonParser.h"

@implementation ITSJsonParser

+ (NSArray *)extractArrayFromJSON:(id)json {
    if (!json)
        return @[];
    
    return [json isKindOfClass:[NSArray class]] ? json : @[];
}

+ (BOOL)extractBoolFromJSON:(id)json {
    if (!json)
        return NO;
    
    return [json isKindOfClass:[NSNumber class]] ? [json boolValue] : NO;
}

+ (NSDictionary *)extractDictionaryFromJSON:(id)json {
    if (!json)
        return @{};
    
    return [json isKindOfClass:[NSDictionary class]] ? json : @{};
}

+ (NSNumber *)extractNumberFromJSON:(id)json {
    if (!json)
        return @0;
    
    return [json isKindOfClass:[NSNumber class]] ? json : @0;
}

+ (NSString *)extractStringFromJSON:(id)json {
    if (!json)
        return @"unavailable";
    
    return [json isKindOfClass:[NSString class]] ? json : @"unavailable";
}

@end
