//
//  employee.m
//  employees
//
//  Created by Tim Hanby on 2/20/14.
//  Copyright (c) 2014 Timothy Hanby. All rights reserved.
//

#import "employee.h"

@implementation employee

- (instancetype)initUserId:(NSNumber*)userId
                 firstName:(NSString*)firstName
                middleName:(NSString*)middleName
                  lastName:(NSString*)lastName
                     email:(NSString*)email
                    salary:(NSNumber*)salary
                 birthDate:(NSDate*)birthDate
{
    self = [super init];
    if(self){
        _userId = userId;
        _firstName = [firstName copy];
        _middleName = [middleName copy];
        _lastName = [lastName copy];
        _email = [email copy];
        _salary = salary;
        _birthDate = birthDate;
        
    }
    return self;
}

- (NSString *)description
{
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    NSArray *name = [[NSArray alloc] initWithObjects:self.firstName, self.middleName, self.lastName, nil];
    NSArray *string = [[NSArray alloc] initWithObjects:
                       [super description],
                       [@"Id: " stringByAppendingFormat: @"%d", [self.userId integerValue]],
                       [@"Name: " stringByAppendingFormat: @"%@", [name componentsJoinedByString:@" "]],
                       [@"Email: " stringByAppendingFormat: @"%@", self.email],
                       [@"Birthdate: " stringByAppendingFormat: @"%@", [dateFormatter stringFromDate:self.birthDate]],
                       [@"Annual Salary: " stringByAppendingFormat: @"%@", [currencyFormatter stringFromNumber:self.salary]],
                       nil];
    
    
    return [string componentsJoinedByString:@"\n"];

}

- (BOOL)isEqual:(employee *)employee{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    if(![employee isKindOfClass:[employee class]]) return NO;
    
    BOOL userIdIsEqual = [self.userId isEqual:employee.userId];
    BOOL firstNameIsEqual = [self.firstName isEqualToString:employee.firstName];
    BOOL middleNameIsEqual = [self.middleName isEqualToString:employee.middleName];
    BOOL lastNameIsEqual = [self.lastName isEqualToString:employee.lastName];
    BOOL emailIsEqual = [self.email isEqualToString:employee.email];
    BOOL salaryIsEqual = [self.salary isEqual:employee.salary];
    BOOL birthDateIsEqual = [self.birthDate isEqualToDate: employee.birthDate];
    return userIdIsEqual && firstNameIsEqual && middleNameIsEqual && lastNameIsEqual && emailIsEqual && salaryIsEqual && birthDateIsEqual;
}

- (NSUInteger)hash
{
    return (NSUInteger)self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
}


@end