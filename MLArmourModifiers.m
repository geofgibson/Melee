//
//  MLArmourModifiers.m
//  Melee
//
//  Created by Geof Gibson on 11/9/09.
//  Copyright 2009 Variable Productions. All rights reserved.
//

#import "MLArmourModifiers.h"

@implementation MLArmourModifiers

@synthesize hits, armourMovement, dxAdj, name;

- (id)init {
	self = [super init];
	if (self) {
    hits = 0;
	armourMovement = 10;
	dxAdj = 0;
	name = @"new";
    }
	return self;
}

@end
