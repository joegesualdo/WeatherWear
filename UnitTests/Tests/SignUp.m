//
//  SignUpSpec.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import <KIF.h>
#import <Specta.h>
#import "WWFakeData.h"


SpecBegin(SignUp)


describe(@"When user starts app", ^{
    afterAll(^{
      [tester tapViewWithAccessibilityLabel:@"Sign Out Button"];
    });
    context(@"and is not signed in", ^{
        it(@"user should get the Sign Up page", ^{
            UILabel *signUpPageTitle = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"Sign Up Page Title Label"];
            expect(signUpPageTitle.text).to.equal(@"Sign Up");
        });
    });
    context(@"and signs up with valid email and password", ^{
        it(@"user should be presented the home view", ^{
            
            [tester enterText:[WWFakeData email] intoViewWithAccessibilityLabel:@"Sign Up Email Field"];
            [tester enterText:@"password" intoViewWithAccessibilityLabel:@"Sign Up Password Field"];
            [tester tapViewWithAccessibilityLabel:@"Sign Up Submit Button"];
            
            UILabel *homePageTitle = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"Home Page Title Label"];
            expect(homePageTitle.text).to.equal(@"Hello World");
        });
    });
    
});
SpecEnd
