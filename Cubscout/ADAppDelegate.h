//
//  ADAppDelegate.h
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ADAppDelegate : NSObject <NSApplicationDelegate, NSUserNotificationCenterDelegate>

// Status Item
@property (strong, nonatomic) NSStatusItem *statusItem;

// Main Window
@property (assign) IBOutlet NSWindow *window;
@property (retain, nonatomic) IBOutlet NSTextField *hsAPIKeyField;
@property (retain, nonatomic) IBOutlet NSButton *saveBtn;
@property (retain, nonatomic) IBOutlet NSButton *closeBtn;

// Agent
@property (strong, nonatomic) NSMutableArray *hsMailboxes;

@end
