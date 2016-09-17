//
//  ViewController.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSEntityController.h"
#import "ITSSearchController.h"
#import "ITSSearchContentViewController.h"
#import "ITSResultsViewController.h"
#import "ITSAPI.h"

#import "SVProgressHUD.h"

@interface ITSEntityController () <ITSSearchContentViewControllerDelegate>
@property (nonatomic) NSArray<NSString *> *entityTypeArray;
@property (nonatomic, readonly) NSInteger queryTermIndex;
@property (nonatomic, readonly) NSArray<ITSMediaObject *> *results;
@property (nonatomic) ITSSearchController *searchController;
@end

@implementation ITSEntityController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedStringWithDefaultValue(@"Select an Option", @"Localizable", [NSBundle mainBundle], @"Select an Option", nil);
    
    _entityTypeArray = @[
                         NSLocalizedStringWithDefaultValue(@"movieArtist", @"Localizable", [NSBundle mainBundle], @"movieArtist", nil),
                         NSLocalizedStringWithDefaultValue(@"movie", @"Localizable", [NSBundle mainBundle], @"movie", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"podcastAuthor", @"Localizable", [NSBundle mainBundle], @"podcastAuthor", nil),
                         NSLocalizedStringWithDefaultValue(@"podcast", @"Localizable", [NSBundle mainBundle], @"podcast", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"musicArtist", @"Localizable", [NSBundle mainBundle], @"musicArtist", nil),
                         NSLocalizedStringWithDefaultValue(@"musicTrack", @"Localizable", [NSBundle mainBundle], @"musicTrack", nil),
                         NSLocalizedStringWithDefaultValue(@"musicVideo", @"Localizable", [NSBundle mainBundle], @"musicVideo", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"album", @"Localizable", [NSBundle mainBundle], @"album", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"mix", @"Localizable", [NSBundle mainBundle], @"mix", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"song", @"Localizable", [NSBundle mainBundle], @"song", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"audiobookAuthor", @"Localizable", [NSBundle mainBundle], @"audiobookAuthor", nil),
                         NSLocalizedStringWithDefaultValue(@"audiobook", @"Localizable", [NSBundle mainBundle], @"audiobook", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"shortFilmArtist", @"Localizable", [NSBundle mainBundle], @"shortFilmArtist", nil),
                         NSLocalizedStringWithDefaultValue(@"shortFilm", @"Localizable", [NSBundle mainBundle], @"shortFilm", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"tvEpisode", @"Localizable", [NSBundle mainBundle], @"tvEpisode", nil),
                         NSLocalizedStringWithDefaultValue(@"tvSeason", @"Localizable", [NSBundle mainBundle], @"tvSeason", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"software", @"Localizable", [NSBundle mainBundle], @"software", nil),
                         NSLocalizedStringWithDefaultValue(@"iPadSoftware", @"Localizable", [NSBundle mainBundle], @"iPadSoftware", nil),
                         NSLocalizedStringWithDefaultValue(@"macSoftware", @"Localizable", [NSBundle mainBundle], @"macSoftware", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"ebook", @"Localizable", [NSBundle mainBundle], @"ebook", nil),
                         
                         NSLocalizedStringWithDefaultValue(@"allTrack", @"Localizable", [NSBundle mainBundle], @"allTrack", nil),
                         NSLocalizedStringWithDefaultValue(@"allArtist", @"Localizable", [NSBundle mainBundle], @"allArtist", nil)
                         ];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _entityTypeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.font = [ITSThemeManager defaultFont];
    cell.textLabel.text = _entityTypeArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _queryTermIndex = indexPath.row;
    _searchController = [[ITSSearchController alloc] initWithRootViewController:[[ITSSearchContentViewController alloc] initWithDelegate:self]];
    [_searchController presentInViewController:self];
}

#pragma mark - search delegate

- (void)ITSSearchContentViewController:(ITSSearchContentViewController *)controller didReturnWithSearchTerm:(NSString *)term {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [SVProgressHUD show];
    }];
    
    __weak typeof(self)weakSelf = self;
    [_searchController dismissWithCompletion:^{
        
        // get the results synchronously
        _results = [ITSAPI getItemsForTerm:term entity:_queryTermIndex != _entityTypeArray.count - 1 ? _entityTypeArray[_queryTermIndex] : nil];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [SVProgressHUD dismiss];
        }];
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (_results.count > 0) {
            ITSResultsViewController *controller = [[ITSResultsViewController alloc] initWithResults:_results];
            [strongSelf.navigationController pushViewController:controller animated:YES];
        } else {
            UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"No results" message:@"Try another query" preferredStyle:UIAlertControllerStyleAlert];
            [controller addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [controller dismissViewControllerAnimated:YES completion:nil];
            }]];
            [strongSelf presentViewController:controller animated:YES completion:nil];
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [SVProgressHUD dismiss];
    }];
}

@end
