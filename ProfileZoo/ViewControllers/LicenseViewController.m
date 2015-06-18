//
//  LicenseViewController.m
//  ProfileZoo
//
//  Created by Diana Granados on 17/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "LicenseViewController.h"
#import "AgreementViewController.h"
#import "MainViewController.h"
#import "PetsViewController.h"
#import "NewsViewController.h"
#import "SettingsViewController.h"

@interface LicenseViewController ()
@property (nonatomic, strong) MainViewController *mainViewController;
@property(nonatomic,assign) BOOL personRegistered;
@end

@implementation LicenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didTapAgreeButton:(UIButton *)button {
    
    if ([button isEqual: self.declineButton] ) {
        NSLog(@"button dcline pressed");
        self.personRegistered = NO;
    }
    else
    {
        NSLog(@"button aceptar pressed");
        self.personRegistered = YES;
        MainViewController *mainViewController = [[MainViewController alloc] init];
        UINavigationController *remainderNavController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        
        PetsViewController *petsViewController = [[PetsViewController alloc] init];
        UINavigationController *petsNavController = [[UINavigationController alloc]initWithRootViewController:petsViewController];
        
        NewsViewController *newsViewController = [[NewsViewController alloc] init];
        UINavigationController *newsNavController = [[UINavigationController alloc]initWithRootViewController:newsViewController];
        
        SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
        UINavigationController *settingsNavController = [[UINavigationController alloc]initWithRootViewController:settingsViewController];
        
        
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        [tabBarController setViewControllers:@[remainderNavController, petsNavController, newsNavController, settingsNavController]];
        
        [self presentViewController:tabBarController animated:YES completion:nil];
    }
}
@end
