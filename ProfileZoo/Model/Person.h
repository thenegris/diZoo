//
//  Person.h
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, assign) BOOL agreementChecked;
@property (nonatomic, strong, readwrite) NSArray *pets;


- (instancetype)initWithUID:(NSString *)uid;
- (instancetype)initWithUID:(NSString *) uid agreementChecked:(BOOL)agreementChecked pets:(NSArray *)pets;

@end
