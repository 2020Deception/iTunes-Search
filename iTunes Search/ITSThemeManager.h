//
//  ITSThemeManager.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

@import Foundation;
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

/*!
 * ITSThemeManager handles the theme/styling related work. 
 */
@interface ITSThemeManager : NSObject

+ (UIFont *)defaultFont;
+ (UIFont *)defaultFontOfSize:(CGFloat)size;

+ (CGFloat)sizeNormal;

+ (UIColor *)defaultBackgroundColor;

+ (UIImage *)ITSLogo;

@end

NS_ASSUME_NONNULL_END
