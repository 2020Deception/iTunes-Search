//
//  ITSResultsViewController.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/18/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "BaseTableViewController.h"

@class ITSMediaObject;

NS_ASSUME_NONNULL_BEGIN

/*!
 * ITSResultsViewController displays the array of results with Title, 30x30 image, short description and price.
 * results are public for unit testing requirements.
 */
@interface ITSResultsViewController : BaseTableViewController

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil NS_UNAVAILABLE;

- (instancetype)initWithResults:(NSArray<ITSMediaObject *> *)results NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) NSArray<ITSMediaObject *> *results;

@end

NS_ASSUME_NONNULL_END
