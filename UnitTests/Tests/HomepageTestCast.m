//
//  HomepageTestCast.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/24/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import <KIF.h>
#import <Specta.h>

SpecBegin(Homepage)

describe(@"When user starts app", ^{
    context(@"and enters valide email and password", ^{
        it(@"they should see the current weather", ^{
            [tester enterText:@"joe@gmail.com" intoViewWithAccessibilityLabel:@"Email Text Field"];
            [tester enterText:@"password" intoViewWithAccessibilityLabel:@"Password Text Field"];
            [tester tapViewWithAccessibilityLabel:@"Submit"];

            UILabel *weatherLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"Current Weather"];
            
            
            expect(weatherLabel).to.beTruthy;
        });
    });
    
});

SpecEnd
