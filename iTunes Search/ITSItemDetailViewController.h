//
//  ITSItemDetailViewController.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/18/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "BaseTableViewController.h"

@class ITSMediaObject;

NS_ASSUME_NONNULL_BEGIN

static NSString *const kNameHeader = @"Name";
static NSString *const kArtworkHeader = @"Artwork";
static NSString *const kDescriptionHeader = @"Description";
static NSString *const kDefaultHeader = @"Description";
static NSInteger const kHeaderHeight = 30.0f;

/*!
 * ITSItemDetailViewController displays a result in detail with Title, 100x100 image and long description.
 * results are public for unit testing requirements.
 */
@interface ITSItemDetailViewController : BaseTableViewController

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil NS_UNAVAILABLE;

- (instancetype)initWithResult:(ITSMediaObject* )result NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) ITSMediaObject *result;

@end

NS_ASSUME_NONNULL_END
