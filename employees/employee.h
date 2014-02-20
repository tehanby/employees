//
//  employee.h
//  employees
//
//  Created by Tim Hanby on 2/20/14.
//  Copyright (c) 2014 Timothy Hanby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface employee : NSObject

@property (strong, nonatomic) NSNumber *userId;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *middleName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSNumber *salary;
@property (strong, nonatomic) NSDate *birthDate;

- (instancetype)initUserId:(NSNumber*)userId
                 firstName:(NSString*)firstName
                middleName:(NSString*)middleName
                  lastName:(NSString*)lastName
                     email:(NSString*)email
                    salary:(NSNumber*)salary
                 birthDate:(NSDate*)birthDate;


@end
