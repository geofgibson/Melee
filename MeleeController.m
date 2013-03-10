//
//  MeleeController.m
//  Melee
//
//  Created by Geof Gibson on 11/9/09.
//  Copyright 2009 Variable Productions. All rights reserved.
//

#import "MLCharacter.h"
#import "MeleeController.h"
#import "MLArmourModifiers.h"
#import "MLWeaponSpecs.h"

#define ML4random() (arc4random() % ((unsigned)RAND_MAX + 1))

@implementation MeleeController

@synthesize character, stFixed, dxFixed;

- (id)init {
	self = [super init];
    if (self) {
	//instantiate the character
	character = [[MLCharacter alloc] init];
	stFixed = false;
	dxFixed = false;
    }
	return self;
}

- (IBAction)toggleStFixed:(id)sender {
	if (stFixed) {
		stFixed = false;
	}
	else {//toggle must not be set then
		stFixed = true;
	}
	return;
}

- (void)toggleDxFixed:(id)sender {
	if (dxFixed) {
		dxFixed = false;
	}
	else {//toggle must not be set then
		dxFixed = true;
	}
	return;
}

- (void)selectArmour:(id)sender {
	character.currentArmour = [character.armour objectAtIndex:[sender indexOfSelectedItem]];
	character.movementAllowance = character.currentArmour.armourMovement;
	character.adjustedDX = character.dexterity+character.currentArmour.dxAdj;
    [self buildPossessions];
    
	return;
}

- (void)selectWeapon1:(id)sender {
	//validate weapon selection
	MLWeaponSpecs * selectedWeapon = [character.weapons objectAtIndex:[sender indexOfSelectedItem]];
	int minimumStrength = selectedWeapon.stMinimum;
	if (character.strength >= minimumStrength) {
		character.weaponOne = [character.weapons objectAtIndex:[sender indexOfSelectedItem]];
	}
	else {
		//display sheet not enough strength
		NSAlert *alert = [[[NSAlert alloc] init] autorelease];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Not so fast ..."];
		NSString * textString = [NSString stringWithFormat:@"You cannot use a %@ without a strength of at least %d.", selectedWeapon.name, selectedWeapon.stMinimum];
        [alert setInformativeText:textString];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:meleeWindow modalDelegate:self 
						 didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil];
		character.weaponOne = [character.weapons objectAtIndex:0];
		[sender selectItemAtIndex:0];
	}
    [self buildPossessions];
	return;
}

- (void)selectWeapon2:(id)sender {
	//validate weapon selection
	MLWeaponSpecs * selectedWeapon = [character.weapons objectAtIndex:[sender indexOfSelectedItem]];
	int minimumStrength = selectedWeapon.stMinimum;
	if (character.strength >= minimumStrength) {
		character.weaponTwo = [character.weapons objectAtIndex:[sender indexOfSelectedItem]];
	}
	else {
		//display sheet not enough strength
		NSAlert *alert = [[[NSAlert alloc] init] autorelease];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Not so fast ..."];
		NSString * textString = [NSString stringWithFormat:@"You cannot use a %@ without a strength of at least %d.", selectedWeapon.name, selectedWeapon.stMinimum];
        [alert setInformativeText:textString];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:meleeWindow modalDelegate:self 
						 didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil];
		character.weaponTwo = [character.weapons objectAtIndex:0];
		[sender selectItemAtIndex:0];
	}
    [self buildPossessions];
	return;
}

- (void)selectDagger:(id)sender {
	character.currentDagger = [character.daggers objectAtIndex:[sender indexOfSelectedItem]];
    [self buildPossessions];
	return;
}

- (void) alertDidEnd:(NSAlert *)alert returnCode:(int)returnCode contextInfo:(void *)contextInfo {
	[[alert window] orderOut:self];
	return;
}

- (void)createCharacter:(id)sender {
	//randomize ST & DX
	int stDxRatio;
	stDxRatio = (ML4random() % 8)+1;
	//check for fixed values
	if (!stFixed) {
		character.strength = 8+stDxRatio;
	}
	if (!dxFixed) {
		character.dexterity = 16-stDxRatio;
		character.adjustedDX = character.dexterity+character.currentArmour.dxAdj;
		
	}
    //Clear possessions
    character.currentArmour = [character.armour objectAtIndex:0];
    character.currentArmour.name = @"None";
    character.weaponOne = [character.weapons objectAtIndex:0];
    character.weaponOne.name = @"None";
    character.weaponOne.dice = @"";
    character.weaponTwo = [character.weapons objectAtIndex:0];
    character.weaponTwo.name = @"None";
    character.weaponTwo.dice = @"";
    character.currentDagger = [character.daggers objectAtIndex:0];
    character.currentDagger.name = @"None";
    character.currentDagger.dice = @"";
    [self buildPossessions];
	return;
}

- (void)buildPossessions;
{
    //Rebuild possessions string currentArmour, weaponOne, weaponTwo, currentDagger
    NSMutableString * possessionsString = [NSMutableString stringWithCapacity:50];
    [possessionsString setString:character.currentArmour.name];
    [possessionsString appendString:@"\n"];
    [possessionsString appendString:character.weaponOne.name];
    [possessionsString appendString:character.weaponOne.dice];
    [possessionsString appendString:@"\n"];
    [possessionsString appendString:character.weaponTwo.name];
    [possessionsString appendString:character.weaponTwo.dice];
    [possessionsString appendString:@"\n"];
    [possessionsString appendString:character.currentDagger.name];
    [possessionsString appendString:character.currentDagger.dice];
    //MUST use synthesized setter to trigger KVC bindings updates!
    character.possessions = possessionsString;
    return;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    // You passed the binding identifier as the context when registering
    // as an observer--use that to decide what to update...
    NSLog(@"keypath change");
    /*if (context == AngleObservationContext)
    {
        id newAngle = [observedObjectForAngle
                       valueForKeyPath:observedKeyPathForAngle];
        if ((newAngle == NSNoSelectionMarker) ||
            (newAngle == NSNotApplicableMarker) ||
            (newAngle == NSMultipleValuesMarker))
        {
            badSelectionForAngle = YES;
        }
        else
        {
            badSelectionForAngle = NO;
            if (angleValueTransformer != nil)
            {
                newAngle = [angleValueTransformer
                            transformedValue:newAngle];
            }
            [self setValue:newAngle forKey:@"angle"];
        }
    }*/
    // ...
    
    //[self setNeedsDisplay:YES];
}

- (void)dealloc {
	[character release];
	[super dealloc];
}

@end
