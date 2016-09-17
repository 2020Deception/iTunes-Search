//
//  ITSMediaObject.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 * ITSMediaObject represents a fetched media object from the iTunes Search API.
 */
@interface ITSMediaObject : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) NSString *wrapperType;
@property (nonatomic, readonly) NSString *kind;
@property (nonatomic, readonly) NSNumber *artistId;
@property (nonatomic, readonly) NSNumber *collectionId;
@property (nonatomic, readonly) NSNumber *trackId;
@property (nonatomic, readonly) NSString *artistName;
@property (nonatomic, readonly) NSString *collectionName;
@property (nonatomic, readonly) NSString *trackName;
@property (nonatomic, readonly) NSString *collectionCensoredName;
@property (nonatomic, readonly) NSString *trackCensoredName;
@property (nonatomic, readonly) NSURL *artistViewUrl;
@property (nonatomic, readonly) NSURL *collectionViewUrl;
@property (nonatomic, readonly) NSURL *trackViewUrl;
@property (nonatomic, readonly) NSURL *previewUrl;
@property (nonatomic, readonly) NSURL *artworkUrl30;
@property (nonatomic, readonly) NSURL *artworkUrl60;
@property (nonatomic, readonly) NSURL *artworkUrl100;
@property (nonatomic, readonly) NSNumber *trackPrice;
@property (nonatomic, readonly) NSString *releaseDate;
@property (nonatomic, readonly) NSString *collectionExplicitness;
@property (nonatomic, readonly) NSString *trackExplicitness;
@property (nonatomic, readonly) NSNumber *discCount;
@property (nonatomic, readonly) NSNumber *discNumber;
@property (nonatomic, readonly) NSNumber *trackCount;
@property (nonatomic, readonly) NSNumber *trackNumber;
@property (nonatomic, readonly) NSNumber *trackTimeMillis;
@property (nonatomic, readonly) NSString *country;
@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, readonly) NSString *primaryGenreName;
@property (nonatomic, readonly) BOOL isStreamable;
// undocumented
@property (nonatomic, readonly) NSString *shortDescription;
@property (nonatomic, readonly) NSString *longDescription;

@end

NS_ASSUME_NONNULL_END
