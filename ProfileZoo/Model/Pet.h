//
//  Pet.h
//  ProfileZoo
//
//  Created by Diana Granados on 31/5/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *uidPerson; //?
@property (nonatomic, copy) NSString *breed; //raza
@property (nonatomic, copy) NSDate *dateBirth;
@property (nonatomic, strong, readwrite) NSDictionary *remainders;
@property (nonatomic, strong, readwrite) NSDictionary *activitylog;

- (instancetype)initWithUID:(NSString *)uid;
- (instancetype)initWithUID:(NSString *) uid name:(NSString *)name breed:(NSString *)breed dateBirth:(NSDate  *)dateBirth personUID:(NSString *)personUID;
- (instancetype)initWithUID:(NSString *) uid name:(NSString *)name breed:(NSString *)breed dateBirth:(NSDate  *)dateBirth personUID:(NSString *)personUID remainders:(NSDictionary *)remainders activitylog:(NSDictionary*)activitylog;

@end
