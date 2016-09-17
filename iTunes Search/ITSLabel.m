//
//  ITSLabel.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/18/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSLabel.h"
#import "ITSThemeManager.h"

@implementation ITSLabel

+ (instancetype)new {
    ITSLabel *label = [[ITSLabel alloc] init];
    return label;
}

- (instancetype)init {
    self = [super init];
    self.numberOfLines = 0;
    self.font = [ITSThemeManager defaultFont];
    return self;
}

@end
