//
//  ADHelpScoutClient.h
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface ADHelpScoutClient : AFHTTPRequestOperationManager

+ (ADHelpScoutClient *)sharedClient;

@end
