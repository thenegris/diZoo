//
//  LicenseViewController.h
//  ProfileZoo
//
//  Created by Diana Granados on 17/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LicenseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *licenseTextView;
@property (weak, nonatomic) IBOutlet UIButton *declineButton;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;

- (IBAction)didTapAgreeButton:(UIButton *)button;

@end
