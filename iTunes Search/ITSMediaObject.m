//
//  ITSMediaObject.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSMediaObject.h"
#import "ITSJsonParser.h"

@implementation ITSMediaObject

- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    _wrapperType = [ITSJsonParser extractStringFromJSON:data[@"wrapperType"]];
    _kind = [ITSJsonParser extractStringFromJSON:data[@"kind"]];
    _artistId = [ITSJsonParser extractNumberFromJSON:data[@"artistId"]];
    _collectionId = [ITSJsonParser extractNumberFromJSON:data[@"collectionId"]];
    _trackId = [ITSJsonParser extractNumberFromJSON:data[@"trackId"]];
    _artistName = [ITSJsonParser extractStringFromJSON:data[@"artistName"]];
    _collectionName = [ITSJsonParser extractStringFromJSON:data[@"collectionName"]];
    _trackName = [ITSJsonParser extractStringFromJSON:data[@"trackName"]];
    _collectionCensoredName = [ITSJsonParser extractStringFromJSON:data[@"collectionCensoredName"]];
    _trackCensoredName = [ITSJsonParser extractStringFromJSON:data[@"trackCensoredName"]];
    _artistViewUrl = [NSURL URLWithString:[ITSJsonParser extractStringFromJSON:data[@"artistViewUrl"]]];
    _collectionViewUrl = [NSURL URLWithString:[ITSJsonParser extractStringFromJSON:data[@"collectionViewUrl"]]];
    _trackViewUrl = [NSURL URLWithString:[ITSJsonParser extractStringFromJSON:data[@"trackViewUrl"]]];
    _previewUrl = [NSURL URLWithString:[ITSJsonParser extractStringFromJSON:data[@"previewUrl"]]];
    _artworkUrl30 = [NSURL URLWithString:[ITSJsonParser extractStringFromJSON:data[@"artworkUrl30"]]];
    _artworkUrl60 = [NSURL URLWithString:[ITSJsonParser extractStringFromJSON:data[@"artworkUrl60"]]];
    _artworkUrl100 = [NSURL URLWithString:[ITSJsonParser extractStringFromJSON:data[@"artworkUrl100"]]];
    _trackPrice = [ITSJsonParser extractNumberFromJSON:data[@"trackPrice"]];
    _releaseDate = [ITSJsonParser extractStringFromJSON:data[@"releaseDate"]];
    _collectionExplicitness = [ITSJsonParser extractStringFromJSON:data[@"collectionExplicitness"]];
    _trackExplicitness = [ITSJsonParser extractStringFromJSON:data[@"trackExplicitness"]];
    _discCount = [ITSJsonParser extractNumberFromJSON:data[@"discCount"]];
    _discNumber = [ITSJsonParser extractNumberFromJSON:data[@"discNumber"]];
    _trackCount = [ITSJsonParser extractNumberFromJSON:data[@"trackCount"]];
    _trackNumber = [ITSJsonParser extractNumberFromJSON:data[@"trackNumber"]];
    _trackTimeMillis = [ITSJsonParser extractNumberFromJSON:data[@"trackTimeMillis"]];
    _country = [ITSJsonParser extractStringFromJSON:data[@"country"]];
    _currency = [ITSJsonParser extractStringFromJSON:data[@"currency"]];
    _primaryGenreName = [ITSJsonParser extractStringFromJSON:data[@"primaryGenreName"]];
    _isStreamable = [ITSJsonParser extractBoolFromJSON:data[@"isStreamable"]];
    
    _shortDescription = [ITSJsonParser extractStringFromJSON:data[@"shortDescription"]];
    _longDescription = [ITSJsonParser extractStringFromJSON:data[@"longDescription"]];
    
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ %@ %i %i %i %i",
            _artistName,
            _kind,
            _trackPrice,
            _shortDescription != nil,
            _longDescription != nil,
            _artworkUrl30 != nil,
            _artworkUrl100 != nil];
}

@end
