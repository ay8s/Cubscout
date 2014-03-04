//
//  ADMailboxesService.m
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "ADMailboxesService.h"
#import "ADHelpScoutClient.h"

@implementation ADMailboxesService

+ (void)getMailboxesWithSuccess:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure {    
    [[ADHelpScoutClient sharedClient] GET:@"mailboxes.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
