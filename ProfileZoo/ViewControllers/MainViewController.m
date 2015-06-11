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


@end

@implementation MainViewController

NSString * const kPetIdentityCellIdentifier = @"petIdentityCellIdentifier";
NSArray *pets;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Recordatorios";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_appointment_reminders_filled"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *cellNib = [UINib nibWithNibName:@"PetIdentityTableViewCell" bundle:nil];
    [self.remainderTablaView registerNib:cellNib forCellReuseIdentifier:kPetIdentityCellIdentifier];
    
    pets = [PetDataBaseManager sharedPetManager].person.pets;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma marks - methods protocol datasource
//Initialize and setup each cell in your tableView
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
   // NSInteger section = indexPath.section;
    NSInteger index = indexPath.row;
    
    if (index==0) {
         cell = [tableView dequeueReusableCellWithIdentifier:kPetIdentityCellIdentifier];
    }
    else {
        
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger indexRow = indexPath.row;
    Pet *pet = [pets objectAtIndex:indexRow];
    
    if (indexRow==0) {
        PetIdentityTableViewCell *petIdentityCell = (PetIdentityTableViewCell *)cell;
       
        petIdentityCell.namePetLabel.text = pet.name;
        //    NSString *imageName = [NSString stringWithFormat:@"%ld", (long)contact.ID];
        //    UIImage *profilePic = [FileManager loadImageWithName:imageName];
        //    if (profilePic == nil) {
        //        profilePic = [UIImage imageNamed:@"profile_catdog.jpeg"];
        //    }
        [petIdentityCell.petImageView setImage:[UIImage imageNamed:@"tab_icon_profile_dinosaur"]];
    }
    else {
        UITableViewCell *petRemaindersCell = (UITableViewCell *) cell;
        petRemaindersCell.textLabel.text = @"RemainderTst";
       
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PetIdentityTableViewCell heightForCell];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return pets.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    Pet *petRemainders = [pets objectAtIndex:section];
    return petRemainders.remainders.count;

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
