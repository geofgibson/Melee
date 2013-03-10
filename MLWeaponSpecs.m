//
//  MLWeaponSpecs.m
//  Melee
//
//  Created by Geof Gibson on 12/27/10.
//  Copyright 2010 Variable Productions. All rights reserved.
//

#import "MLWeaponSpecs.h"

@implementation MLWeaponSpecs

@synthesize stMinimum, dxAdj, name, dice;

- (id)init {
	self = [super init];
	if (self) {
    stMinimum = 0;
	dxAdj = 0;
    [self setName:@"new"];
    [self setDice:@"new"];
    }
	return self;
}

@end
