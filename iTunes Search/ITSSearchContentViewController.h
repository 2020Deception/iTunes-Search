//
//  ITSSearchContentViewController.h
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

@import UIKit;
@class  ITSSearchContentViewController;

NS_ASSUME_NONNULL_BEGIN

/*!
 * ITSSearchContentViewControllerDelegate for callbacks to querying terms.
 */
@protocol ITSSearchContentViewControllerDelegate <NSObject>

@required
/*!
 * ITSSearchContentViewController:didReturnWithSearchTerm returns the text from the pop up. NOTE: This method will not be called if the text length == 0
 @param controller the controller.
 @param term the returned search term.
 */
- (void)ITSSearchContentViewController:(ITSSearchContentViewController *)controller didReturnWithSearchTerm:(NSString *)term;

@end

/*!
 * ITSSearchContentViewController handles the query.
 * delegate and textField are public for unit test requirements.
 */
@interface ITSSearchContentViewController : UIViewController <UITextFieldDelegate>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithDelegate:(id<ITSSearchContentViewControllerDelegate>)delegate NS_DESIGNATED_INITIALIZER;

/*!
 searchButtonTapped is called when the user taps the search button. If the text length is > 0, the delgate is called.
 */
- (void)searchButtonTapped;

/*!
 delegate for callbacks to querying terms.
 */
@property (nonatomic, weak, readonly) id<ITSSearchContentViewControllerDelegate> delegate;

/*!
 textfield the entry textField to search for results.
 */
@property (nonatomic, readonly) UITextField *textField;

@end

NS_ASSUME_NONNULL_END
