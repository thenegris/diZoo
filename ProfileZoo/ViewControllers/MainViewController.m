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
#import "Remider.h"
#import "ActivityViewController.h"
#import "PetProfileViewController.h"
#import "Pet.h"
#import "FileManager.h"

@interface MainViewController ()

@property (nonatomic,strong) ActivityViewController *activityViewController;
@property (nonatomic,strong) PetProfileViewController *petProfileController;

@end

@implementation MainViewController

NSString * const kPetIdentityCellIdentifier = @"petIdentityCellIdentifier";


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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.remainderTablaView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma marks - lazy instanciacion
- (PetProfileViewController*) petProfileController {
    
    if (_petProfileController == nil) {
        _petProfileController = [[PetProfileViewController alloc]initWithNibName:@"PetProfileViewController" bundle:nil];
    }
    
    return _petProfileController;
}

- (ActivityViewController *) activityViewController {

    if (_activityViewController == nil) {
        _activityViewController = [[ActivityViewController alloc] initWithNibName:@"ActivityViewController" bundle:nil];
    }
 
    return _activityViewController;
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
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellRemainder"];
        if(cell==nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellRemainder"];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger indexRow = indexPath.row;
    NSInteger section = indexPath.section;
   
    Pet *pet= [[PetDataBaseManager sharedPetManager].person.pets objectAtIndex:section];
    
    if (indexRow==0) {
        PetIdentityTableViewCell *petIdentityCell = (PetIdentityTableViewCell *)cell;
       
        petIdentityCell.namePetLabel.text = pet.name;
        petIdentityCell.couterLabel.text = [NSString stringWithFormat:@"%ld", (unsigned long)pet.remainders.count];
        
        NSString *imageName = pet.uid;
        UIImage *profilePic = [FileManager loadImageWithName:imageName];
        
        if (profilePic == nil) {
              profilePic = [UIImage imageNamed:@"tab_icon_profile_dinosaur"];
        }
        [petIdentityCell.petImageView setImage:profilePic];
    }
    else {
        UITableViewCell *petRemaindersCell = (UITableViewCell *) cell;
        Remider *remainder = pet.remainders[indexRow - 1];
        petRemaindersCell.textLabel.text = remainder.message;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PetIdentityTableViewCell heightForCell];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [[PetDataBaseManager sharedPetManager] getNumberOfPets];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    Pet *pet = [[PetDataBaseManager sharedPetManager].person.pets objectAtIndex:section];
   
    NSLog(@"Rows in section %lu rows %lu",(long)section, (unsigned long)pet.remainders.count);
    return pet.remainders.count + 1;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"did select row");
    
    //NSInteger section = indexPath.section;
    NSInteger row = indexPath.row ;
    //Pet *pet = [[PetDataBaseManager sharedPetManager].person.pets objectAtIndex:section];
   
    if (row == 0) {
        [self.navigationController pushViewController:self.petProfileController animated:YES];
    }
    else {
    
        [self.navigationController pushViewController:self.activityViewController animated:YES];
    
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
