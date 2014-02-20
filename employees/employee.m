//
//  employee.m
//  employees
//
//  Created by Tim Hanby on 2/20/14.
//  Copyright (c) 2014 Timothy Hanby. All rights reserved.
//

#import "employee.h"

@implementation employee

- (NSString *)description
{
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    NSArray *name = [[NSArray alloc] initWithObjects:employee.firstName, employee.middleName, employee.lastName, nil];
    NSArray *string = [[NSArray alloc] initWithObjects:[@"Id: " stringByAppendingFormat: @"%d", [self.userId integerValue]],
                       [@"Name: " stringByAppendingFormat: @"%@", [name componentsJoinedByString:@" "]],
                       [@"Email: " stringByAppendingFormat: @"%@", self.email],
                       [@"Birthdate: " stringByAppendingFormat: @"%@", [dateFormatter stringFromDate:self.birthDate]],
                       [@"Annual Salary: " stringByAppendingFormat: @"%@", [currencyFormatter stringFromNumber:self.salary]],
                       nil];
    
    
    return [string componentsJoinedByString:@"\n"];

}

@end
