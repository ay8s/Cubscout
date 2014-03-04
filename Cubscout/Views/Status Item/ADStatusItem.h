//
//  ADStatusItem.h
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ADStatusItem : NSView {
    BOOL isMenuVisible;
}

- (void)updateAppVisability;

@end
