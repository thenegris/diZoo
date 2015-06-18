//
//  PetProfileViewController.m
//  ProfileZoo
//
//  Created by Diana Granados on 13/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "PetProfileViewController.h"
#import "Formatter.h"
#import "KConstants.h"
#import "PetDataBaseManager.h"
#import "FileManager.h"

@interface PetProfileViewController () <UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(nonatomic,strong)NSArray *breeds;
@property(nonatomic,strong)NSString *animalSelected;
@property(nonatomic,strong)NSString *breedSelected;
@property(nonatomic,strong)UIBarButtonItem *saveBarButton;
@property(nonatomic,strong)UIBarButtonItem *cancelBarButton;
@property(nonatomic,strong)UIBarButtonItem *editBarButton;
@property (nonatomic, assign) BOOL didTakePicture;
@property (nonatomic, assign) BOOL didOpenCamera;
@end

@implementation PetProfileViewController

NSInteger const kNumberOfPickers = 2;
NSInteger const kDays = 14600; //40 years aprox
KConstants *constants; 


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        self.title =@"Perfil ";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.birthDateTextField.delegate = self;
    constants = [KConstants sharedConstants];
    
    self.breeds = [constants.breedsAnimals valueForKey:constants.animals[0]];
    [self setupGestureRecognizers];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateActionEdition];
    
    if (self.didOpenCamera == NO) {
        [self loadPet: self.pet];
    }
     self.didOpenCamera = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy instance
-(UIBarButtonItem*) saveBarButton {
    if (_saveBarButton == nil) {
        _saveBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(didTabSaveButtonItem:)];
    }
    return _saveBarButton;
}

-(UIBarButtonItem*) cancelBarButton {
    if (_cancelBarButton == nil) {
        _cancelBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didTabCancelButtonItem:)];
    }
    return _cancelBarButton;
}

#pragma mark - Date picker methods

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    self.birthDateTextField = textField;
    UIDatePicker *birthDatePick =  [[UIDatePicker alloc]init];
    birthDatePick.datePickerMode = UIDatePickerModeDate;
    birthDatePick.minimumDate = [NSDate dateWithTimeIntervalSinceNow:-kDays*24*60*60];
    [birthDatePick setDate:[NSDate date]];
    [birthDatePick addTarget:self action:@selector(updateBirthDateTextField:) forControlEvents:UIControlEventValueChanged];
    self.birthDateTextField.inputView = birthDatePick;
    self.birthDateTextField.text = [Formatter formatDate:birthDatePick.date];
        
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

// Called when the date picker changes.
- (void)updateBirthDateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.birthDateTextField.inputView;
    self.birthDateTextField.text = [Formatter formatDate:picker.date];
}


#pragma mark - UIPickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return kNumberOfPickers;
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        NSInteger animalsCount = [constants.animals count];
        
        return animalsCount;
    }
    else {
         //NSLog(@"numberOfRowsInComponent 2: %ld", self.breeds.count);
        return self.breeds.count;
    }
}

#pragma mark - UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
       // self.breeds = [constants.breedsAnimals valueForKey:constants.animals[row]];
        return constants.animals[row];
    }
    else {
       // NSLog(@"titleForRow 2 %@",self.breeds[row]);
       return self.breeds[row];
      
}
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        self.animalSelected = constants.animals[row];
        self.breeds = [constants.breedsAnimals valueForKey:constants.animals[row]];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:1];
    }
    else {
        self.breedSelected = self.breeds[row];
      
    }
  
}

//-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    UILabel* tView = (UILabel*)view;
//    if (!tView){
//        tView = [[UILabel alloc] init];
//        [tView setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15]];
//    }
//    return tView;
//}


#pragma mark - Setup recognizers
-(void) setupGestureRecognizers{
    [self addTapGestureToImageView];
}


-(void)addTapGestureToImageView{
    
    //self porq es q responde a los eventos de la vista
    UITapGestureRecognizer *tapGesture = [[ UITapGestureRecognizer alloc] initWithTarget:self action:(@selector(didTapImageView:))];
    //numero de tap para q se ejecutw
    tapGesture.numberOfTapsRequired=1;
    [self.imagePetView addGestureRecognizer:tapGesture];
    
    
}

-(void) didTapImageView:(UITapGestureRecognizer *) gestureRecognizer{
    
    NSLog(@"did photo tap!!!");
    
    if ([UIImagePickerController isSourceTypeAvailable:
        UIImagePickerControllerSourceTypeCamera]) {
        self.didOpenCamera = YES;
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickerController.delegate = self;
        [self presentViewController:pickerController animated:YES completion:NULL];
        
    }
    
}

#pragma mark - UIImagePickerCont

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.didTakePicture = YES;
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *image =[ info objectForKey:UIImagePickerControllerOriginalImage];
        [self.imagePetView setImage:image];
    }];
    
    //guardar solo cuando el usuario de clic en guardar
    
}


#pragma mark - auxiliry mehods

-(void) loadPet :(Pet *) pet {
    
    NSString *imageName = pet.uid;
    UIImage *profileImage = [FileManager loadImageWithName:imageName];
    
    if (profileImage == nil) {
        
        profileImage = [UIImage imageNamed:@"tab_icon_profile_dinosaur"];
    }
    
    [self.imagePetView setImage:profileImage];
    
    self.namePetTextField.text = pet.name;
    self.birthDateTextField.text = [Formatter formatDate: pet.dateBirth];
    self.animalSelected = pet.animal;
    self.breedSelected = pet.breed;
    [self.breedPickerView reloadComponent:1];
    

}
//:(ACTION_EDITION) action
- (void) updateActionEdition{

    BOOL enabled = (self.action == ACTION_EDITION_NEW || self.action  == ACTION_EDITION_EDIT );
    
    //habilita interaccion con la vista imagen con el recognizer
    self.imagePetView.userInteractionEnabled= enabled;
    self.namePetTextField.enabled = enabled;
    self.birthDateTextField.enabled = enabled;
    self.breedPickerView.userInteractionEnabled = enabled;

    //agregar botones Aceptar y Cancelar dependiendo de modo edicion o consulta
    if (enabled) {
    
        self.navigationItem.leftBarButtonItem = self.cancelBarButton;
        self.navigationItem.rightBarButtonItem = self.saveBarButton;
    }
    else{
        
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = self.editBarButton;
    }

}

#pragma mark - Action methods
//nombre metodo didTabSaveButtonItem: dos puntos porq tiene parametros
- (void) didTabSaveButtonItem:(UIBarButtonItem *) buttonItem{
    NSLog(@"did save!!!!!");
    
    if(self.action  == ACTION_EDITION_NEW){
        NSString *uuid = [[NSUUID UUID] UUIDString];
        NSString *birthDate = self.birthDateTextField.text;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat: kDateFormat];
        
        Pet *newPet = [[Pet alloc] initWithUID:uuid ];
        
        newPet.name = self.namePetTextField.text;
        newPet.dateBirth =[dateFormat dateFromString:birthDate];
        newPet.breed = self.breedSelected;
        newPet.animal = self.animalSelected;
        newPet.uidPerson =  [PetDataBaseManager sharedPetManager].person.uid;
       
        [[PetDataBaseManager sharedPetManager] insertPet:newPet];
    
        if (self.didTakePicture) {
        
            NSString *nameImage = [ NSString stringWithFormat:@"%@",uuid];
            [FileManager writeImageToFile:self.imagePetView.image withName: nameImage];
        
            self.didTakePicture = NO;
            }
        
         }
    
    [self setAction: ACTION_EDITION_NONE];
    [self updateActionEdition];
}


- (void) didTabCancelButtonItem:(UIBarButtonItem *) buttonItem{
    if (self.action == ACTION_EDITION_NEW) {
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        
        [self loadPet: self.pet];
        self.action = ACTION_EDITION_NONE;
        [self updateActionEdition];
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
