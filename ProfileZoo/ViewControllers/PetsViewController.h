//
//  PetsViewController.h
//  ProfileZoo
//
//  Created by Diana Granados on 9/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pet.h"

@interface PetsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *petsTableView;

@end
