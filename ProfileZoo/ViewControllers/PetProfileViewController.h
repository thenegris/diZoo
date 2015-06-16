//
//  PetProfileViewController.h
//  ProfileZoo
//
//  Created by Diana Granados on 13/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pet.h"

typedef NS_ENUM(NSInteger, ACTION_EDITION) {
    
    ACTION_EDITION_NONE = 0,
    ACTION_EDITION_NEW,
    ACTION_EDITION_EDIT
};

@interface PetProfileViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *namePetTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthDateTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imagePetView;
@property (weak, nonatomic) IBOutlet UIPickerView *breedPickerView;
@property (nonatomic,strong) Pet *pet;
@property(nonatomic,assign) ACTION_EDITION action;
@end
