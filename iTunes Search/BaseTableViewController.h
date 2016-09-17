//
//  BaseTableViewController.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

@import UIKit;

#import "ITSMediaObject.h"
#import "ITSThemeManager.h"
#import "ITSLabel.h"

NS_ASSUME_NONNULL_BEGIN

/*!
 * BaseTableViewController sets tableView.rowHeight = UITableViewAutomaticDimension for self sizing cells, with tableView.estimatedRowHeight = 60.0.
 * This controller should never be instantiated directly, in face all initialers are unavailable as subclasses should inherit and assign a designated initializer.
 * We leave one initializer available purely for unit test code converage requirements, and only to the base controller.
 */
@interface BaseTableViewController : UITableViewController

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;

@end


NS_ASSUME_NONNULL_END
