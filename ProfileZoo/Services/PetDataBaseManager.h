//
//  PetDataBaseManager.h
//  ProfileZoo
//
//  Created by Diana Granados on 1/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"
#import "Person.h"

@interface PetDataBaseManager : NSObject

@property (nonatomic,strong,readwrite) Person *person;

+ (PetDataBaseManager *)sharedPetManager;
//- (void)insertPerson:(Person *)person withPet:(Pet *)pet;
- (void)insertPet:(Pet *)pet;
- (void)deletePet:(Pet *)pet;
- (void)replacePetWithUID:(NSString *)UID withPet:(Pet *)pet;
- (Pet *)getPetWithUID:(NSString *)UID;
- (NSInteger)getNumberOfPets;
- (void)updatePets;
- (void)loadRemainderTypes;

@end
