//
//  ADConversationsService.h
//  Cubscout
//
//  Created by Andrew Yates on 03/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADConversationsService : NSObject

+ (void)getConversationsForMailbox:(NSString *)mailboxID withSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
