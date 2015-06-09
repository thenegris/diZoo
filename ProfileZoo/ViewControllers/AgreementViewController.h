//
//  AgreementViewController.h
//  ProfileZoo
//
//  Created by Diana Granados on 7/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgreementViewController : UIViewController

@property(strong,nonatomic) UIScrollView *scrollView;
@property(weak,nonatomic)  UIButton *agreeButton;
@property(weak,nonatomic)  UIButton *declineButton;
@property(nonatomic,assign) BOOL personRegistered;


- (void)buttonAgreementLicensePressed:(UIButton *)button;


@end
