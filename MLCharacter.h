//
//  MLCharacter.h
//  Melee
//
//  Created by Geof Gibson on 11/9/09.
//  Copyright 2009 Variable Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLArmourModifiers.h"
#import "MLWeaponSpecs.h"

//@class MeleeController;

@interface MLCharacter : NSObject {
	int	strength, dexterity, movementAllowance, experiencePoints, adjustedDX;
	NSArray	* __weak weapons, * __weak armour, * __weak daggers;
	MLArmourModifiers * __weak currentArmour;
	MLWeaponSpecs * __weak weaponOne, * __weak weaponTwo, * __weak currentDagger;
    NSMutableString * __weak possessions;
}

@property(readwrite) int strength, dexterity, movementAllowance, experiencePoints, adjustedDX;
@property(readwrite, weak) NSArray * weapons, * armour, * daggers;
@property(readwrite, weak) MLArmourModifiers * currentArmour;
@property(readwrite, weak) MLWeaponSpecs * weaponOne, * weaponTwo, * currentDagger;
@property(readwrite, weak) NSMutableString * possessions;

@end
