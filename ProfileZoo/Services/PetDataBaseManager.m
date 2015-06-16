//
//  PetDataBaseManager.m
//  ProfileZoo
//
//  Created by Diana Granados on 1/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "PetDataBaseManager.h"
#import "Remider.h"
#import "ReminderType.h"
#import "Formatter.h"

@interface PetDataBaseManager ()

@property (nonatomic, strong) NSMutableArray *mutablePets;
@property (nonatomic,strong) NSDictionary *dictionaryTypeRemainder;

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
        
        
        Pet *pet1 = [[Pet alloc] initWithUID:uuidPet name:@"Principe" animal:@"dogs" breed:@"Golden" dateBirth:date personUID: uuidPerson];
        
        Pet *pet2 = [[Pet alloc] initWithUID:[[NSUUID UUID] UUIDString] name:@"Pelton" animal:@"dogs" breed:@"Boxer" dateBirth:date personUID: uuidPerson];
        
        _mutablePets = [@[pet1,pet2] mutableCopy];
        _person.pets = [_mutablePets copy];
        
        [self loadRemainderTypes];
        ReminderType *type1 = [_dictionaryTypeRemainder objectForKey:@"1"];
        ReminderType *type2 = [_dictionaryTypeRemainder objectForKey:@"2"];
        ReminderType *type3 = [_dictionaryTypeRemainder objectForKey:@"3"];
        
        
        Remider *remainder1 = [[Remider alloc] initWithRemainder:@"Ya es hora de visitar el veterinario" type:type1.ID dateTODO:[NSDate date] statusTODO:NO];
                               
        Remider *remainder2 = [[Remider alloc] initWithRemainder:@"Necesita un baño pronto!" type:type2.ID dateTODO:[NSDate date] statusTODO:NO];
        
        Remider *remainder3 = [[Remider alloc] initWithRemainder:@"Oye, estas segur@ que tengo comida?" type:type3.ID dateTODO:[NSDate date] statusTODO:NO];
        
    
        
        
        NSArray *remaindersPet1 =  @[remainder1, remainder2, remainder3];
        pet1.remainders = remaindersPet1;
                                         
        NSArray *remaindersPet2 =  @[remainder2];
        pet2.remainders = remaindersPet2;
        
        
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

-(void)loadRemainderTypes
{
    
    ReminderType *type1 = [[ReminderType alloc] initWithID:@"1" type:@"Salud"];
    ReminderType *type2 = [[ReminderType alloc] initWithID:@"2" type:@"Bienestar" ];
    ReminderType *type3 = [[ReminderType alloc] initWithID:@"3" type:@"Alimentacion"];
    self.dictionaryTypeRemainder = @{ @"1":type1, @"2": type2, @"3": type3};
}


@end
