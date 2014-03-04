//
//  ADConversationsService.m
//  Cubscout
//
//  Created by Andrew Yates on 03/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "ADConversationsService.h"
#import "ADHelpScoutClient.h"

@implementation ADConversationsService

+ (void)getConversationsForMailbox:(NSString *)mailboxID withSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"mailboxes/%@/conversations.json?status=active", mailboxID];
    
    [[ADHelpScoutClient sharedClient] GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
