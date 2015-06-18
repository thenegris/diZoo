//
//  PersonEntity.h
//  ProfileZoo
//
//  Created by Diana Granados on 17/6/15.
//  Copyright (c) 2015 Diana Granados. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface PersonEntity : NSManagedObject

@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSNumber * agreementChecked;
@property (nonatomic, retain) NSSet *relationship;
@end

@interface PersonEntity (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(NSManagedObject *)value;
- (void)removeRelationshipObject:(NSManagedObject *)value;
- (void)addRelationship:(NSSet *)values;
- (void)removeRelationship:(NSSet *)values;

@end
