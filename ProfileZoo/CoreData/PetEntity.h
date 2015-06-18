//
//  PetEntity.h
//  ProfileZoo
//
//  Created by Diana Granados on 17/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PetEntity : NSManagedObject

@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * breed;
@property (nonatomic, retain) NSString * animal;
@property (nonatomic, retain) NSDate * dateBirth;

@end
