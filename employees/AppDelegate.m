//
//  AppDelegate.m
//  employees
//
//  Created by Tim Hanby on 2/20/14.
//  Copyright (c) 2014 Timothy Hanby. All rights reserved.
//

#import "AppDelegate.h"
#import "employee.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM-dd-yyyy";
    
    NSString *firstName = @"Timothy";
    NSString *middleName = @"Edward";
    NSString *lastName = @"Hanby";
    NSString *email = @"teh@trifecta.com";
    NSString *birthDateAsString = @"05/23/1987";
    
    employee *employee1 = [[employee alloc] init];
    employee1.firstName = [NSString stringWithString:firstName];
    employee1.lastName = [NSString stringWithString:lastName];
    employee1.middleName = [NSString stringWithString:middleName];
    employee1.email = [NSString stringWithString:email];
    employee1.userId = [NSNumber numberWithInt:1];
    employee1.salary = [NSNumber numberWithInt:10000];
    employee1.birthDate = [dateFormatter dateFromString:birthDateAsString];
    
    employee *employee2 = [[employee alloc] init];
    employee2.firstName = [NSString stringWithString:firstName];
    employee2.lastName = [NSString stringWithString:lastName];
    employee2.middleName = [NSString stringWithString:middleName];
    employee2.email = [NSString stringWithString:email];
    employee2.userId = [NSNumber numberWithInt:1];
    employee2.salary = [NSNumber numberWithInt:10000];
    employee2.birthDate = [dateFormatter dateFromString:birthDateAsString];
    
    BOOL equals = [employee1 isEqual:employee2];
    NSLog(@"is Employee1 equal to Employee 2? %@", (equals) ? @"Yes" : @"No");
    NSLog(@"Employee 1 hash = %tx", [employee1 hash]);
    NSLog(@"Employee 2 hash = %tx", [employee2 hash]);
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
