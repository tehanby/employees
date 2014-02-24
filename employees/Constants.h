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
#else
#define VERSION_NAME @"Production"
#endif

@end
