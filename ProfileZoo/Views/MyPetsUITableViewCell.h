//
//  MyPetsUITableViewCell.h
//  ProfileZoo
//
//  Created by Diana Granados on 13/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPetsUITableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *petNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *petBirthDateTextField;
@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
@property (weak, nonatomic) IBOutlet UITextField *petBreedTextField;

+(CGFloat)heightForCell;

@end
