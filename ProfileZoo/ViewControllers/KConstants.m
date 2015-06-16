//
//  KConstants.m
//  ProfileZoo
//
//  Created by Diana Granados on 14/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import "KConstants.h"



@implementation KConstants

-(instancetype) init
{
    self = [super init];
    
    if (self) {
        _animals = @[@"cats",@"dogs",@"fishes",@"horses"];
        NSArray *catsBreed = @[@"Abyssinian",@"Aegean", @"American Shorthair"];
        NSArray *dogsBreed = @[@"Akita Inu",@"American Bulldog", @"American Cocker Spaniel"];
        NSArray *horseBreed = @[@"Abtenauer",@"Abyssinian horse", @"Arabian horse"];
        NSArray *fishesBreed = @[@"Betta Fish",@"Gold Fish", @"Angel Fish"];
        _breedsAnimals = @{@"cats": catsBreed,@"dogs":dogsBreed,@"horses":horseBreed,@"fishes":fishesBreed};
    }
    
    return self;
}


+ (KConstants *)sharedConstants
{
    static KConstants *instaceManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instaceManager = [[KConstants alloc] init];
    });
    
    return instaceManager;
}




@end
