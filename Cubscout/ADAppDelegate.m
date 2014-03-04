//
//  ADAppDelegate.m
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "ADAppDelegate.h"
#import "ADStatusItem.h"
#import <SSKeychain/SSKeychain.h>

// Services
#import "ADMailboxesService.h"
#import "ADConversationsService.h"

@implementation ADAppDelegate

@synthesize statusItem;
@synthesize hsAPIKeyField, saveBtn, closeBtn;
@synthesize hsMailboxes;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // Set up Status Bar Item
    NSStatusItem *aStatusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    ADStatusItem *view = [[ADStatusItem alloc] init];
    [aStatusItem setView:view];
    [self setStatusItem:aStatusItem];
    
    // Check for password and fetch mailboxes etc.
    if([SSKeychain passwordForService:@"Cubscout" account:@"Cubscout"]){
        [self getMailboxes];
        [self getConversations];
    }
    
}

#pragma mark - Main Window

- (IBAction)onButtonClick:(id)sender {
    if(sender == saveBtn){
        [self saveSettings];
    } else if(sender == closeBtn) {
        [NSApp terminate:self];
    }
}

- (void)saveSettings {
    NSError *error = nil;
    
    [SSKeychain setPassword:[hsAPIKeyField stringValue] forService:@"Cubscout" account:@"Cubscout" error:&error];
}

}

@end
