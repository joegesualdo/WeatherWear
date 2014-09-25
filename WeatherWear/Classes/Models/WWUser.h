//
//  WWUser.h
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWUser : NSObject

+(WWUser *)currentUser;
+(void)setCurrentUser:(WWUser *)user;

@property(strong, nonatomic)NSString *authToken;

@end
