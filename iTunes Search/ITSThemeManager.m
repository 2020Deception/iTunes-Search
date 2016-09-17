//
//  ITSThemeManager.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSThemeManager.h"

@implementation ITSThemeManager

+ (UIFont *)defaultFont {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:[ITSThemeManager sizeNormal]];
}

+ (UIFont *)defaultFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

+ (CGFloat)sizeNormal {
    return [UIFont systemFontSize];
}

+ (UIColor *)defaultBackgroundColor {
    return [UIColor lightGrayColor];
}

+ (UIImage *)ITSLogo {
    return [UIImage imageNamed:@"logo.png"];
}

@end
