//
//  Pet.m
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "Pet.h"

@implementation Pet

- (instancetype)initWithUID:(NSString *)uid
{
    self = [super init];
    
    if (self) {
        
        _uid = uid;
        _name = @"";
        _animal=@"";
        _breed = @"";
        _dateBirth = nil;
        _uidPerson = @"";
        
    }
    
    return self;
}

- (instancetype)initWithUID:(NSString *) uid name:(NSString *)name animal:(NSString*)animal breed:(NSString *)breed dateBirth:(NSDate  *)dateBirth personUID:(NSString *)personUID
{
    self = [self initWithUID:uid];
    
    if (self) {
        
        _name = name;
        _animal = animal;
        _breed = breed;
        _dateBirth = dateBirth;
        _uidPerson = personUID;
    }
    
    return self;
}

- (instancetype)initWithUID:(NSString *) uid name:(NSString *)name animal:(NSString*)animal breed:(NSString *)breed dateBirth:(NSDate  *)dateBirth personUID:(NSString *)personUID remainders:(NSArray *)remainders activitylog:(NSDictionary*)activitylog
{

    self = [self initWithUID:uid name:name animal:animal breed:breed dateBirth:dateBirth personUID:personUID];
    
    
    if(self){
        
        _remainders = remainders;
        _activitylog = activitylog;
    }
    
    return self;
}

@end
