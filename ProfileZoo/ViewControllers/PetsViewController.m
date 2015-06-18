//
//  PetsViewController.m
//  ProfileZoo
//
//  Created by Diana Granados on 9/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "PetsViewController.h"
#import "MyPetsUITableViewCell.h"
#import "PetDataBaseManager.h"
#import "Formatter.h"
#import "PetProfileViewController.h"
#import "FileManager.h"


@interface PetsViewController ()
@property (nonatomic, strong) UIBarButtonItem *addPetButtonItem;
@property (nonatomic, strong) PetProfileViewController *petProfileViewController;
@end

@implementation PetsViewController

NSString  * kMyPetsCellIdentifier=@"kMyPetsCellIdentifier";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *cellNib = [UINib nibWithNibName:@"MyPetsUITableViewCell" bundle:nil];
    [self.petsTableView registerNib:cellNib forCellReuseIdentifier:kMyPetsCellIdentifier];
    self.navigationItem.rightBarButtonItem = self.addPetButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.petsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Mascotas";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_footprint_filled"];
    }
    return self;
}

#pragma mark - delegate databasedelegate methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [[PetDataBaseManager sharedPetManager] getNumberOfPets];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    //NSInteger section = indexPath.section;
    NSInteger index = indexPath.row;
    
    if (index==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:kMyPetsCellIdentifier];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellActivities"];
        if(cell==nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellActivities"];
        }
    }
    return cell;

    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    if (index==0) {
         return [MyPetsUITableViewCell heightForCell];
    }
    
    return 40.0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger indexRow = indexPath.row;
    NSInteger section = indexPath.section;
    
    Pet *pet= [[PetDataBaseManager sharedPetManager].person.pets objectAtIndex:section];
    
    if (indexRow==0) {
        MyPetsUITableViewCell *myPetsCell = (MyPetsUITableViewCell *)cell;
        
        myPetsCell.petNameLabel.text = pet.name;
        NSDate *dateBirth =  pet.dateBirth;
        NSString *formattedDate = [Formatter formatDate:dateBirth];
        myPetsCell.petBirthDateTextField.text = formattedDate;
        myPetsCell.petBreedTextField.text = pet.breed;
        
        NSString *imageName = pet.uid;
        UIImage *profilePic = [FileManager loadImageWithName:imageName];
        
        if (profilePic == nil) {
            
            profilePic = [UIImage imageNamed:@"tab_icon_profile_dinosaur"];
        }
        [myPetsCell.petImageView setImage:profilePic];
    }
    else {
       UITableViewCell *petActivityLog = (UITableViewCell *) cell;
       
       petActivityLog.textLabel.text = [NSString stringWithFormat: @"Actividades con %@", pet.name];
    }
    
}
#pragma mark - Setters and getters

-(PetProfileViewController*) petProfileViewController{
    
    if (_petProfileViewController == nil) {
        _petProfileViewController = [[PetProfileViewController alloc] init];
    }
    return _petProfileViewController;
}

#pragma mark - action methods

- (UIBarButtonItem *)addPetButtonItem
{
    if (_addPetButtonItem == nil) {
        
        _addPetButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddPetButtonItem:)];
    }
    
    return _addPetButtonItem;
}

// didTapAddButtonItem:
- (void)didTapAddPetButtonItem:(UIBarButtonItem *)buttonItem
{
    NSLog(@"Log... add pet");
    self.petProfileViewController.pet = nil;
    self.petProfileViewController.action = ACTION_EDITION_NEW;
    [self.navigationController pushViewController:self.petProfileViewController animated:YES];
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
