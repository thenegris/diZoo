//
//  KConstants.h
//  ProfileZoo
//
//  Created by Diana Granados on 14/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KConstants : NSObject
@property(nonatomic, strong) NSDictionary *breedsAnimals;
@property(nonatomic, strong) NSArray *animals;

+ (KConstants *)sharedConstants;
@end
