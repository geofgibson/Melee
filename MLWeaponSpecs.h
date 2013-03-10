//
//  MLWeaponSpecs.h
//  Melee
//
//  Created by Geof Gibson on 12/27/10.
//  Copyright 2010 Variable Productions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MLWeaponSpecs : NSObject {
	int stMinimum, dxAdj;
	NSString * name, * dice;
}

@property(readwrite) int stMinimum, dxAdj;
@property(readwrite, retain) NSString * name, * dice;

@end
