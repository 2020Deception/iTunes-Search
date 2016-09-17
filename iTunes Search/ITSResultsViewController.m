//
//  ITSResultsViewController.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/18/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSResultsViewController.h"
#import "ITSMediaObject.h"
#import "ITSThemeManager.h"
#import "D20LayoutHelper.h"
#import "ITSLabel.h"
#import "ITSItemDetailViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation ITSResultsViewController

#pragma mark - init

- (instancetype)initWithResults:(NSArray<ITSMediaObject *> *)results {
    self = [super initWithNibName:nil bundle:nil];
    _results = results;
    return self;
}

#pragma mark - tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    [self configureCell:cell atIndex:indexPath.row];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndex:(NSInteger)index {
    ITSMediaObject *object = _results[index];
    UIImageView *imageView = [UIImageView new];
    
    if (object.artworkUrl30 != nil) {
        [imageView sd_setImageWithURL:object.artworkUrl30 placeholderImage:[ITSThemeManager ITSLogo]];
    } else {
        imageView.image = [ITSThemeManager ITSLogo];
    }
    
    [D20LayoutHelper constraintsForWidthAndHeightOnSuperView:cell forSubview:imageView width:30 height:30];
    
    [[imageView.topAnchor constraintEqualToAnchor:cell.topAnchor] setActive:YES];
    [[imageView.leftAnchor constraintEqualToAnchor:cell.leftAnchor] setActive:YES];
    
    ITSLabel *trackNameLabel = [ITSLabel new];
    trackNameLabel.text = object.trackName;
    
    ITSLabel *trackPriceLabel = [ITSLabel new];
    trackPriceLabel.text = object.trackPrice.floatValue > 0 ? object.trackPrice.stringValue : @"Free";
    
    ITSLabel *shortDescriptionLabel = [ITSLabel new];
    shortDescriptionLabel.text = object.shortDescription;
    
    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[trackNameLabel, shortDescriptionLabel, trackPriceLabel]];
    stack.axis = UILayoutConstraintAxisVertical;
    
    stack.translatesAutoresizingMaskIntoConstraints = NO;
    [cell addSubview:stack];
    
    [[stack.topAnchor constraintEqualToAnchor:cell.topAnchor] setActive:YES];
    [[stack.bottomAnchor constraintEqualToAnchor:cell.bottomAnchor] setActive:YES];
    [[stack.leftAnchor constraintEqualToAnchor:imageView.rightAnchor] setActive:YES];
    [[stack.rightAnchor constraintEqualToAnchor:cell.rightAnchor] setActive:YES];
}

#pragma mark - tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ITSItemDetailViewController *detail = [[ITSItemDetailViewController alloc] initWithResult:_results[indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
