//
//  MeleeController.h
//  Melee
//
//  Created by Geof Gibson on 11/9/09.
//  Copyright 2009 Variable Productions. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include <stdlib.h>

@interface MeleeController : NSObject {
	MLCharacter * character;
	IBOutlet NSWindow * meleeWindow;
	bool stFixed, dxFixed;

}

@property(readwrite, assign) MLCharacter * character;
@property(readwrite) bool stFixed, dxFixed;

- (void)createCharacter:(NSButton *)sender;
- (IBAction)toggleStFixed:(id)sender;
- (IBAction)toggleDxFixed:(id)sender;
- (void)selectArmour:(id)sender;
- (void)selectWeapon1:(id)sender;
- (void)selectWeapon2:(id)sender;
- (void)selectDagger:(id)sender;
- (void)alertDidEnd:(NSAlert *)sheet returnCode:(int)returnCode contextInfo:(void *)contextInfo;
- (void)buildPossessions;

@end
