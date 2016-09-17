//
//  ITSLabel.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/18/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 ITSLabel is initialized with numberOfLines = 0. You can override it or use a traditional UILalel if this behavior is not desired.
 */
@interface ITSLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
