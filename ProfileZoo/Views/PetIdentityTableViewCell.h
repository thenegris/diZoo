//
//  RemainderTableViewCell.h
//  ProfileZoo
//
//  Created by Diana Granados on 8/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PetIdentityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *petImageView;
@property (weak, nonatomic) IBOutlet UILabel *namePetLabel;

+ (CGFloat)heightForCell;
@end
