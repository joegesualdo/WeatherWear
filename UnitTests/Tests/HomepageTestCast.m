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

describe(@"When button is pressed", ^{
    
    it(@"'Hello World' label is shown", ^{
        
        [tester tapViewWithAccessibilityLabel:@"Press Me" traits:UIAccessibilityTraitButton];
        UILabel *label = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"Hello World"];
        
        expect(label.hidden).to.equal(NO);
    });
    
});

SpecEnd
