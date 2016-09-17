//
//  ITSSearchController.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSSearchController.h"

@implementation ITSSearchController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    self.containerView.layer.cornerRadius = 12;
    self.transitionStyle = STPopupTransitionStyleSlideVertical;
    
    if (NSClassFromString(@"UIBlurEffect")) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        self.backgroundView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    }
    
    return self;
}

@end
