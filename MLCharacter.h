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
	NSArray	* weapons, * armour, * daggers;
	MLArmourModifiers * currentArmour;
	MLWeaponSpecs * weaponOne, * weaponTwo, * currentDagger;
    NSMutableString * possessions;
}

@property(readwrite) int strength, dexterity, movementAllowance, experiencePoints, adjustedDX;
@property(readwrite, assign) NSArray * weapons, * armour, * daggers;
@property(readwrite, assign) MLArmourModifiers * currentArmour;
@property(readwrite, assign) MLWeaponSpecs * weaponOne, * weaponTwo, * currentDagger;
@property(readwrite, assign) NSMutableString * possessions;

@end
