//
//  MLCharacter.m
//  Melee
//
//  Created by Geof Gibson on 11/9/09.
//  Copyright 2009 Variable Productions. All rights reserved.
//

#import "MLCharacter.h"

@implementation MLCharacter

@synthesize strength, dexterity, adjustedDX, movementAllowance, experiencePoints, weapons, armour, daggers, currentArmour, weaponOne, weaponTwo, currentDagger, possessions;

- (id) init {
	self = [super init];
    if (self) {
	strength = dexterity = 8;
	movementAllowance = 10;
	adjustedDX = dexterity;
    possessions = [NSMutableString stringWithCapacity:50];
	
	// FUTURE MOD load data from a file
	//setup armour modifier data
	MLArmourModifiers * none = [[MLArmourModifiers alloc] init];
	none.hits = 0;
	none.armourMovement = 10;
	none.dxAdj = 0;
	none.name = @"None";
	MLArmourModifiers * leather = [[MLArmourModifiers alloc] init];
	leather.hits = 2;
	leather.armourMovement = 8;
	leather.dxAdj = -2;
	leather.name = @"Leather, -2 hits";
	MLArmourModifiers * chainmail = [[MLArmourModifiers alloc] init];
	chainmail.hits = 3;
	chainmail.armourMovement = 6;
	chainmail.dxAdj = -3;
	chainmail.name = @"Chainmail, -3 hits";
	MLArmourModifiers * plate = [[MLArmourModifiers alloc] init];
	plate.hits = 5;
	plate.armourMovement = 6;
	plate.dxAdj = -4;
	plate.name = @"Plate, -5 hits";
	
	self.armour = [NSArray arrayWithObjects:none, leather, chainmail, plate, nil];
	self.currentArmour = none;
	
	//set up weapon data
	MLWeaponSpecs * noWeapon = [[MLWeaponSpecs alloc] init];
	noWeapon.stMinimum = 0;
	noWeapon.dxAdj = 0;
	noWeapon.name = @"None";
	noWeapon.dice = @"";
	MLWeaponSpecs * rapier = [[MLWeaponSpecs alloc] init];
	rapier.stMinimum = 9;
	rapier.dxAdj = 0;
	rapier.name = @"Rapier";
	rapier.dice = @" 1d6";
	MLWeaponSpecs * club = [[MLWeaponSpecs alloc] init];
	club.stMinimum = 9;
	club.dxAdj = 0;
	club.name = @"Club";
	club.dice = @" 1d6";
	MLWeaponSpecs * hammer = [[MLWeaponSpecs alloc] init];
	hammer.stMinimum = 10;
	hammer.dxAdj = 0;
	hammer.name = @"Hammer";
	hammer.dice = @" 1d6+1";
	MLWeaponSpecs * cutlass = [[MLWeaponSpecs alloc] init];
	cutlass.stMinimum = 10;
	cutlass.dxAdj = 0;
	cutlass.name = @"Cutlass";
	cutlass.dice = @" 2d6-2";
	MLWeaponSpecs * shortSword = [[MLWeaponSpecs alloc] init];
	shortSword.stMinimum = 11;
	shortSword.dxAdj = 0;
	shortSword.name = @"Shortsword";
	shortSword.dice = @" 2d6-1";
	MLWeaponSpecs * mace = [[MLWeaponSpecs alloc] init];
	mace.stMinimum = 11;
	mace.dxAdj = 0;
	mace.name = @"Mace";
	mace.dice = @" 2d6-1";
	MLWeaponSpecs * smallAxe = [[MLWeaponSpecs alloc] init];
	smallAxe.stMinimum = 11;
	smallAxe.dxAdj = 0;
	smallAxe.name = @"Small axe";
	smallAxe.dice = @" 1d6+2";
	MLWeaponSpecs * broadsword = [[MLWeaponSpecs alloc] init];
	broadsword.stMinimum = 12;
	broadsword.dxAdj = 0;
	broadsword.name = @"Broadsword";
	broadsword.dice = @" 2d6";
	MLWeaponSpecs * mornigstar = [[MLWeaponSpecs alloc] init];
	mornigstar.stMinimum = 13;
	mornigstar.dxAdj = 0;
	mornigstar.name = @"Morningstar";
	mornigstar.dice = @" 2d6+1";
	MLWeaponSpecs * twoHandedSword = [[MLWeaponSpecs alloc] init];
	twoHandedSword.stMinimum = 14;
	twoHandedSword.dxAdj = 0;
	twoHandedSword.name = @"2-handed sword";
	twoHandedSword.dice = @" 3d6-1";
	MLWeaponSpecs * battleAxe = [[MLWeaponSpecs alloc] init];
	battleAxe.stMinimum = 15;
	battleAxe.dxAdj = 0;
	battleAxe.name = @"Battleaxe";
	battleAxe.dice = @" 3d6";
	MLWeaponSpecs * javelin = [[MLWeaponSpecs alloc] init];
	javelin.stMinimum = 9;
	javelin.dxAdj = 0;
	javelin.name = @"Javelin";
	javelin.dice = @" 1d6-1";
	MLWeaponSpecs * spear = [[MLWeaponSpecs alloc] init];
	spear.stMinimum = 11;
	spear.dxAdj = 0;
	spear.name = @"Spear";
	spear.dice = @" 1d6+1";
	MLWeaponSpecs * halberd = [[MLWeaponSpecs alloc] init];
	halberd.stMinimum = 13;
	halberd.dxAdj = 0;
	halberd.name = @"Halberd";
	halberd.dice = @" 2d6-1";
	MLWeaponSpecs * pikeAxe = [[MLWeaponSpecs alloc] init];
	pikeAxe.stMinimum = 15;
	pikeAxe.dxAdj = 0;
	pikeAxe.name = @"Pike axe";
	pikeAxe.dice = @" 2d6+2";
	MLWeaponSpecs * thrownRock = [[MLWeaponSpecs alloc] init];
	thrownRock.stMinimum = 0;
	thrownRock.dxAdj = 0;
	thrownRock.name = @"Thrown rock";
	thrownRock.dice = @" 1d6-4";
	MLWeaponSpecs * sling = [[MLWeaponSpecs alloc] init];
	sling.stMinimum = 0;
	sling.dxAdj = 0;
	sling.name = @"Sling";
	sling.dice = @" 1d6-2";
	MLWeaponSpecs * smallBow = [[MLWeaponSpecs alloc] init];
	smallBow.stMinimum = 9;
	smallBow.dxAdj = 0;
	smallBow.name = @"Small bow";
	smallBow.dice = @" 1d6-1";
	MLWeaponSpecs * horseBow = [[MLWeaponSpecs alloc] init];
	horseBow.stMinimum = 10;
	horseBow.dxAdj = 0;
	horseBow.name = @"Horse bow";
	horseBow.dice = @" 1d6";
	MLWeaponSpecs * longBow = [[MLWeaponSpecs alloc] init];
	longBow.stMinimum = 11;
	longBow.dxAdj = 0;
	longBow.name = @"Long bow";
	longBow.dice = @" 1d6+2";
	MLWeaponSpecs * lightCrossbow = [[MLWeaponSpecs alloc] init];
	lightCrossbow.stMinimum = 12;
	lightCrossbow.dxAdj = 0;
	lightCrossbow.name = @"Light crossbow";
	lightCrossbow.dice = @" 2d6";
	MLWeaponSpecs * heavyCrossbow = [[MLWeaponSpecs alloc] init];
	heavyCrossbow.stMinimum = 15;
	heavyCrossbow.dxAdj = 0;
	heavyCrossbow.name = @"Heavy crossbow";
	heavyCrossbow.dice = @" 3d6";
	MLWeaponSpecs * smallShield = [[MLWeaponSpecs alloc] init];
	smallShield.stMinimum = 0;
	smallShield.dxAdj = 0;
	smallShield.name = @"Small shield";
	smallShield.dice = @" 1d6";
	MLWeaponSpecs * largeShield = [[MLWeaponSpecs alloc] init];
	largeShield.stMinimum = 0;
	largeShield.dxAdj = 1;
	largeShield.name = @"Large shield";
	largeShield.dice = @" 2d6";
	
	self.weapons = [NSArray arrayWithObjects:noWeapon, rapier, club, hammer, cutlass, shortSword, mace, smallAxe, broadsword, mornigstar, twoHandedSword, battleAxe, javelin, spear, halberd, pikeAxe, thrownRock, sling, smallBow, horseBow, longBow, lightCrossbow, heavyCrossbow, smallShield, largeShield, nil];
	self.weaponOne = noWeapon;
	self.weaponTwo = noWeapon;
	
	
	//initialize daggers
	MLWeaponSpecs * dagger = [[MLWeaponSpecs alloc] init];
	dagger.stMinimum = 0;
	dagger.dxAdj = 0;
	dagger.name = @"Dagger";
	dagger.dice = @" 1d6-1";
	MLWeaponSpecs * mainGauche = [[MLWeaponSpecs alloc] init];
	mainGauche.stMinimum = 0;
	mainGauche.dxAdj = 0;
	mainGauche.name = @"Main-Gauche";
	mainGauche.dice = @" 1d6-1";
	
	self.daggers = [NSArray arrayWithObjects:noWeapon, dagger, mainGauche, nil];
	self.currentDagger = noWeapon;
	
	}
	return self;
}

- (BOOL)validateStrength:(id *)ioValue error:(NSError **)outError {
	//Testing that ST+DX<25
	if ( ((dexterity+[*ioValue intValue])<25) && ([*ioValue intValue]>0) ) {
		return YES;	
	}
	NSString * validStrength = [NSString stringWithFormat:@"%i",(24 - dexterity)];
	*ioValue = validStrength;
    return YES;
}

- (BOOL)validateDexterity:(id *)ioValue error:(NSError **)outError {
	//Testing that ST+DX<25
	if ( ((strength+[*ioValue intValue])<25) && ([*ioValue intValue]>0) ) {
		self.adjustedDX = [*ioValue intValue]+currentArmour.dxAdj;
		return YES;	
	}
	NSString * validDexterity = [NSString stringWithFormat:@"%i",(24 - strength)];
	*ioValue = validDexterity;
	self.adjustedDX = [*ioValue intValue]+currentArmour.dxAdj;
    return YES;
}

/*+ (void)initialize {
    [MLCharacter setKeys:
	 [NSArray arrayWithObjects:@"strength", @"dexterity", nil]
		triggerChangeNotificationsForDependentKey:@"createCharacter"];
}*/

@end
