//
//  employee.m
//  employees
//
//  Created by Tim Hanby on 2/20/14.
//  Copyright (c) 2014 Timothy Hanby. All rights reserved.
//

#import "employee.h"

@implementation employee


- (void)description:(employee *)employee
{
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    


    NSArray *name = [[NSArray alloc] initWithObjects:employee.firstName, employee.middleName, employee.lastName, nil];
    
    NSLog(@"Id: %d", [employee.userId integerValue]);
    NSLog(@"Name: %@", [name componentsJoinedByString:@"|"]);
    NSLog(@"Email: %@", employee.email);
    NSLog(@"Birthdate: %@", [dateFormatter stringFromDate:employee.birthDate]);
    NSLog(@"Annual Salary: %@", [currencyFormatter stringFromNumber:employee.salary]);
    
}

@end
