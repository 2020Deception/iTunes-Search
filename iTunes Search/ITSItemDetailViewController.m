//
//  ITSItemDetailViewController.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/18/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSItemDetailViewController.h"

#import <D2LayoutHelperPod/D20LayoutHelper.h>
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ITSItemDetailViewController

- (instancetype)initWithResult:(ITSMediaObject *)result {
    self = [super initWithNibName:nil bundle:nil];
    _result = result;
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    switch (indexPath.section) {
        case 0: {
            ITSLabel *trackTitle = [ITSLabel new];
            trackTitle.text = _result.trackName;
            [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:cell subview:trackTitle];
        }
            break;
        case 1: {
            UIImageView *imageView = [UIImageView new];
            
            if (_result.artworkUrl100 != nil) {
                [imageView sd_setImageWithURL:_result.artworkUrl100 placeholderImage:[ITSThemeManager ITSLogo]];
            } else {
                imageView.image = [ITSThemeManager ITSLogo];
            }
            
            [D20LayoutHelper pinItemtoCenterOfSuperView:cell subview:imageView width:100 height:100];
            
            [[imageView.topAnchor constraintEqualToAnchor:cell.topAnchor] setActive:YES];
            [[imageView.bottomAnchor constraintEqualToAnchor:cell.bottomAnchor] setActive:YES];
        }
            break;
        case 2: {
            ITSLabel *trackLongDescription = [ITSLabel new];
            trackLongDescription.text = _result.longDescription;
            [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:cell subview:trackLongDescription];
        }
            break;
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kHeaderHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *text = nil;
    switch (section) {
        case 0:
            text = kNameHeader;
            break;
            
        case 1:
            text = kArtworkHeader;
            break;
            
        case 2:
            text = kDescriptionHeader;
            break;
            
        default:
            text = kDefaultHeader;
            break;
    }
    return text;
}

@end
