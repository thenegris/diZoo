//
//  MainViewController.m
//  ProfileZoo
//
//  Created by Diana Granados on 8/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "MainViewController.h"
#import "AgreementViewController.h"
#import "PetIdentityTableViewCell.h"
#import "PetDataBaseManager.h"

@interface MainViewController ()

//@property (nonatomic, strong) AgreementViewController *agreementVC;
@end

@implementation MainViewController

NSString * const kPetIdentityCellIdentifier = @"petIdentityCellIdentifier";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"diZoo";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_feed"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *cellNib = [UINib nibWithNibName:@"PetIdentityTableViewCell" bundle:nil];
    [self.remainderTablaView registerNib:cellNib forCellReuseIdentifier:kPetIdentityCellIdentifier];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks - methods protocol datasource
//Initialize and setup each cell in your tableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PetIdentityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPetIdentityCellIdentifier];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    PetIdentityTableViewCell *petIdentityCell = (PetIdentityTableViewCell *)cell;
    
    NSArray *pets = [PetDataBaseManager sharedPetManager].person.pets;
    Pet *pet = [pets objectAtIndex:indexPath.row];
    
    petIdentityCell.namePetLabel.text = pet.name;
   
    
    
//    NSString *imageName = [NSString stringWithFormat:@"%ld", (long)contact.ID];
//    UIImage *profilePic = [FileManager loadImageWithName:imageName];
//    if (profilePic == nil) {
//        profilePic = [UIImage imageNamed:@"profile_catdog.jpeg"];
//    }
    [petIdentityCell.petImageView setImage:[UIImage imageNamed:@"tab_icon_profile@2x"]];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PetIdentityTableViewCell heightForCell];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
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
