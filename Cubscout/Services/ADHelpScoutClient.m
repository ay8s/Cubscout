//
//  ADHelpScoutClient.m
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "ADHelpScoutClient.h"
#import <SSKeychain/SSKeychain.h>

@implementation ADHelpScoutClient

NSString * const HelpScoutAPIBaseURLString = @"https://api.helpscout.net/v1/";

+ (ADHelpScoutClient *)sharedClient {
    static ADHelpScoutClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:HelpScoutAPIBaseURLString]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        [_sharedClient.requestSerializer setAuthorizationHeaderFieldWithUsername:[SSKeychain passwordForService:@"Cubscout" account:@"Cubscout"] password:@"dummypassword"];
    });
    
    return _sharedClient;
}

@end
