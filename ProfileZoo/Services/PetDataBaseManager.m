//
//  PetDataBaseManager.m
//  ProfileZoo
//
//  Created by Diana Granados on 1/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "PetDataBaseManager.h"

@interface PetDataBaseManager ()

@property (nonatomic, strong) NSMutableArray *mutablePets;
@end

@implementation PetDataBaseManager

#pragma - mark life cycle

+ (PetDataBaseManager *)sharedPetManager
{
    static PetDataBaseManager *instaceManager = nil;
    static dispatch_once_t onceToken;

     dispatch_once(&onceToken, ^{
         instaceManager = [[PetDataBaseManager alloc] init];
     });
                   
    return instaceManager;
}

-(instancetype) init
{
    self = [super init];
    
    if (self) {
        _mutablePets = [NSMutableArray array];
        NSString *uuidPerson = [[NSUUID UUID] UUIDString];
        _person = [[Person alloc]initWithUID:uuidPerson];
        _person.agreementChecked = YES;
        NSString *uuidPet = [[NSUUID UUID] UUIDString];
        NSDate *date = [NSDate date];
        
        Pet *pet1 = [[Pet alloc] initWithUID:uuidPet name:@"Principe" breed:@"Golden" dateBirth:date personUID: uuidPerson];
        
        Pet *pet2 = [[Pet alloc] initWithUID:[[NSUUID UUID] UUIDString] name:@"Pelton" breed:@"Boxer" dateBirth:date personUID: uuidPerson];
        
        _mutablePets = [@[pet1,pet2] mutableCopy];
        _person.pets = [_mutablePets copy];
        
        
        [self updatePets];
    }
    
    return self;
}


- (void)insertPet:(Pet *)pet
{
    [self.mutablePets addObject:pet];
    [self updatePets];
}

- (void)deletePet:(Pet *)pet
{
    [self.mutablePets removeObject:pet];
    [self updatePets];
}

- (void)replacePetWithUID:(NSString *)UID withPet:(Pet *)pet
{
    
    Pet *petFound = [self getPetWithUID:UID];
    NSUInteger index = [self.mutablePets indexOfObject:petFound];
    [self.mutablePets replaceObjectAtIndex:index withObject:pet];
    [self updatePets];
    
}

- (Pet *)getPetWithUID:(NSString *)UID
{
    
    for (Pet *pet in self.mutablePets) {
        if (pet.uid == UID) {
            return pet;
        }
    }
    
    return nil;
}

- (NSInteger)getNumberOfPets
{
    return self.mutablePets.count;
}


- (void)updatePets
{
    self.person.pets = [self.mutablePets copy];
}


@end
