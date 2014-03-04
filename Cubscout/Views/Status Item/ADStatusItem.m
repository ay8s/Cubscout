//
//  ADStatusItem.m
//  Cubscout
//
//  Created by Andrew Yates on 01/03/2014.
//  Copyright (c) 2014 Andrew Yates. All rights reserved.
//

#import "ADStatusItem.h"

@implementation ADStatusItem

- (id)initWithFrame:(NSRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        isMenuVisible = NO;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideApp) name:@"hideApp" object:nil];
    }
    
    return self;
}

- (void)drawRect:(NSRect)rect {
    if(isMenuVisible){
        [[NSColor selectedMenuItemColor] set];
        NSRectFill(rect);
        
        NSImage *icon = [NSImage imageNamed:@"IconWhite"];
        
        [icon drawInRect:NSMakeRect(8, 4, [icon size].width, [icon size].height) fromRect:NSMakeRect(0, 0, [icon size].width, [icon size].height) operation:NSCompositeSourceOver fraction:1.0];
    } else {
        NSImage *icon = [NSImage imageNamed:@"Icon"];
        
        [icon drawInRect:NSMakeRect(8, 4, [icon size].width, [icon size].height) fromRect:NSMakeRect(0, 0, [icon size].width, [icon size].height) operation:NSCompositeSourceOver fraction:1.0];
    }
}


- (void)mouseDown:(NSEvent *)theEvent {
    [self updateAppVisability];
}


- (void)updateAppVisability {
    if(isMenuVisible){
        isMenuVisible = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"toggleWindow" object:@"hide"];
    } else {
        isMenuVisible = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"toggleWindow" object:@"display"];
    }
    [self setNeedsDisplay:YES];
}

- (void)hideApp {
    [self updateAppVisability];
}

@end
