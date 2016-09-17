//
//  ITSSearchContentViewController.m
//  iTunes Search
//
//  Created by Brian Sharrief Alim Bowman on 9/17/16.
//  Copyright © 2016 Brian Sharrief Alim Bowman. All rights reserved.
//

#import "ITSSearchContentViewController.h"
#import "ITSThemeManager.h"
#import "D20LayoutHelper.h"
#import "STPopup.h"

@implementation ITSSearchContentViewController

- (instancetype)initWithDelegate:(id<ITSSearchContentViewControllerDelegate>)delegate {
    self = [super initWithNibName:nil bundle:nil];
    self.contentSizeInPopup = CGSizeMake(300, 135);
    self.landscapeContentSizeInPopup = CGSizeMake(400, 175);
    _delegate = delegate;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *navImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    navImageView.contentMode = UIViewContentModeScaleAspectFit;
    navImageView.frame = CGRectMake(0, 0, 48, 36);
    
    self.navigationItem.titleView = navImageView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:NSLocalizedStringWithDefaultValue(@"Search", @"Localizable", [NSBundle mainBundle], @"Search", nil)
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:@selector(searchButtonTapped)];
    
    _textField = [UITextField new];
    _textField.delegate = self;
    _textField.autocorrectionType = UITextAutocorrectionTypeNo;
    _textField.adjustsFontSizeToFitWidth = YES;
    _textField.textAlignment = NSTextAlignmentCenter;
    _textField.font = [ITSThemeManager defaultFontOfSize:[ITSThemeManager sizeNormal]];
    _textField.attributedPlaceholder = [[NSAttributedString alloc]
                                        initWithString:NSLocalizedStringWithDefaultValue(@"enter query", @"Localizable", [NSBundle mainBundle], @"enter query", nil)
                                        attributes:@{
                                                     NSForegroundColorAttributeName : [UIColor lightGrayColor],
                                                     NSBackgroundColorAttributeName : [ITSThemeManager defaultBackgroundColor]
                                                     }];
    
    _textField.backgroundColor =  [ITSThemeManager defaultBackgroundColor];
    [D20LayoutHelper widthHeightEquivalentsConstraintsWithSuperView:self.view subview:_textField];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_textField becomeFirstResponder];
}

- (void)searchButtonTapped {
    if (_textField.text.length > 0) {
        __weak typeof(self) weakSelf = self;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.delegate ITSSearchContentViewController:strongSelf didReturnWithSearchTerm:_textField.text];
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
