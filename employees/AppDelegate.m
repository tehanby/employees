//
//  AppDelegate.m
//  employees
//
//  Created by Tim Hanby on 2/20/14.
//  Copyright (c) 2014 Timothy Hanby. All rights reserved.
//

#import "AppDelegate.h"
#import "employee.h"
#import <TTAlertManager/TTAlertManager.h>
#import <TestFlightSDK/TestFlight.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    #ifdef DEBUG
    
        NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        NSString *build = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    
        NSMutableString *banner = [NSMutableString new];
        [banner appendString:@"\n\n-----------------------------------------------------------------------------\n"];
        [banner appendFormat:@"Version %@-%@ (%@)\n",VERSION_NAME,version,build];
        [banner appendString:@"-----------------------------------------------------------------------------\n\n"];
        DLog(@"%@",banner);
    
    #endif
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    
    NSString *birthDateAsString = @"05/23/1987";
    
    employee *employee1 = [[employee alloc] initUserId:[NSNumber numberWithInt:1] firstName:@"Timothy" middleName:@"Edward" lastName:@"Hanby" email:@"teh@trifecta.com" salary:[NSNumber numberWithInt:10000] birthDate:[dateFormatter dateFromString:birthDateAsString]];
    
    employee *employee2 = [[employee alloc] initUserId:[NSNumber numberWithInt:1] firstName:@"Timothy" middleName:@"Edward" lastName:@"Hanby" email:@"teh@trifecta.com" salary:[NSNumber numberWithInt:10000] birthDate:[dateFormatter dateFromString:birthDateAsString]];

    
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
    // Make sure the file exists and is setup for encryption.
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    
    NSString *birthDateAsString = @"05/23/1987";
    
    employee *employeeTest = [[employee alloc] initUserId:[NSNumber numberWithInt:1] firstName:@"Timothy" middleName:@"Edward" lastName:@"Hanby" email:@"teh@trifecta.com" salary:[NSNumber numberWithInt:10000] birthDate:[dateFormatter dateFromString:birthDateAsString]];
    
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    self.filePath = [NSString stringWithFormat:@"%@/persistentQueue.nscoded",docDir];
    
    [NSKeyedArchiver archiveRootObject:employeeTest toFile:self.filePath];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    employee *employeeTest = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    TTAlertManager *alertManager = [[TTAlertManager alloc] init];
    [alertManager enqueuePrompt:[NSString stringWithFormat:@"Employee: %@",employeeTest]
                      withTitle:@"Decoded Employee"
                   cancelButton:@"OK"
                    buttonTexts:@[@"Silence Does NOT Equal Consent!"]
                  buttonHandler:^(NSUInteger selectedIndex) {
                      
                      // cancelButton has an index of 0 which is logically false,
                      // buttonTexts is an array of additional buttons, the first being selectedIndex == 1, etc.
                      if (selectedIndex) {
                          DLog(@"User does NOT agree!");
                      }
                      
                  }];
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
