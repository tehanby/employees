//
//  Constants.h
//  employees
//
//  Created by Tim Hanby on 2/24/14.
//  Copyright (c) 2014 Timothy Hanby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

#if defined ENV_DEV
#define VERSION_NAME @"Dev"
#define TESTFLIGHT_APP_TOKEN @"6d2b536b-b33f-4c41-b606-8710f865c803"
#else
#define VERSION_NAME @"Production"
#define TESTFLIGHT_APP_TOKEN @"9893a132-c1b7-4516-8ec8-bea571988e7a"
#endif

@end
