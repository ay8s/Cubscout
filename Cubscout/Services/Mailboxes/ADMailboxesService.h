//
//  ADMailboxesService.h
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADMailboxesService : NSObject

+ (void)getMailboxesWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
