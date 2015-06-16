//
//  AgreementViewController.m
//  ProfileZoo
//
//  Created by Diana Granados on 7/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "AgreementViewController.h"
#import "MainViewController.h"
#import "PetsViewController.h"
#import "NewsViewController.h"
#import "SettingsViewController.h"

const CGFloat leftMargin = 20;

@interface AgreementViewController ()
@property (nonatomic, strong) MainViewController *mainViewController;
@end

@implementation AgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 280, 40)];
//    titleLabel.text = @"DiZoo";
    //titleLabel.center;
    
    
    UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, 60, 280, 40)];
    subtitleLabel.text = @"Terminos y Condiciones";
    
    UITextView *licAgreementTextView = [[UITextView alloc] initWithFrame:CGRectMake(leftMargin,100,340,300)];
    licAgreementTextView.font = [UIFont fontWithName:@"Helvetica" size:15];
    licAgreementTextView.editable=NO;
    licAgreementTextView.text=@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?ed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? ";
    
//    self.view.translatesAutoresizingMaskIntoConstraints = NO;
//    NSLayoutConstraint *xPos = [NSLayoutConstraint constraintWithItem:(self.view) attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:subtitleLabel attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
//    
//    [self.view addConstraints:@[xPos]];
    
    self.declineButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.declineButton.frame = CGRectMake(80, 400, 80, 44);
    [self.declineButton setTitle:@"Declinar" forState:UIControlStateNormal];
    [self.declineButton addTarget:self action:@selector(buttonAgreementLicensePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.agreeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //CGFloat xPoint = self.view.frame.size.width;
    self.agreeButton.frame = CGRectMake(200, 400, 80, 44);
    [self.agreeButton setTitle:@"Aceptar" forState:UIControlStateNormal];
    [self.agreeButton addTarget:self action:@selector(buttonAgreementLicensePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    //CGRect frame = [UIScreen mainScreen].bounds;
    //self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(360, 500);
    
    
    [self.scrollView addSubview:licAgreementTextView];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:subtitleLabel];
    [self.view addSubview:self.declineButton];
    [self.view addSubview:self.agreeButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action methods

-(void) buttonAgreementLicensePressed:(UIButton *)button
{
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
        
//  self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
//  [self.navigationController pushViewController:self.mainViewController animated:YES];
        
    }
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
