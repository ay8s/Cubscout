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
    
    // Notification Observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toggleWindow:) name:@"toggleWindow" object:nil];
    
    // Check for password and fetch mailboxes etc.
    if([SSKeychain passwordForService:@"Cubscout" account:@"Cubscout"]){
        [self getMailboxes];
        [self getConversations];
    }
    
}

#pragma mark - Main Window

- (void)toggleWindow:(NSNotification *)notification {
    if([[notification object] isEqualToString:@"hide"]){
        [self.window orderOut:self];
    } else {
        [NSApp activateIgnoringOtherApps:YES];
        [self.window makeKeyAndOrderFront:self];
    }
}


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


#pragma mark - Agent

- (void)getMailboxes {
    [ADMailboxesService getMailboxesWithSuccess:^(id responseObject) {
        NSLog(@"mailboxes %@", responseObject);
        hsMailboxes = [responseObject valueForKey:@"items"];
    } failure:^(NSError *error) {
        NSLog(@"fail %@", error);
    }];
}

- (void)getConversations {
    [ADConversationsService getConversationsForMailbox:@"320" withSuccess:^(id responseObject) {
        NSLog(@"res %@", responseObject);
    } failure:^(NSError *error) {
        NSLog(@"err %@", error);
    }];
}



#pragma mark - Notifications

- (void)postNotificationWithTitile:(NSString *)title informativeText:(NSString *)text url:(NSString *)url {
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    
    [notification setTitle:title];
    
    [notification setInformativeText:text];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:url forKey:@"url"];
    [notification setUserInfo:dict];
    
    NSUserNotificationCenter *notificationCenter = [NSUserNotificationCenter defaultUserNotificationCenter];
    [notificationCenter setDelegate:self];
    [notificationCenter deliverNotification:notification];
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification {
    NSURL *ticketURL = [NSURL URLWithString:(NSString *)[[notification userInfo] valueForKey:@"url"]];
    [[NSWorkspace sharedWorkspace] openURL:ticketURL];
}


@end
