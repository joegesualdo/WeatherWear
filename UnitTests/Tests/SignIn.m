//
//  SignIn.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.

#import <KIF.h>
#import <Specta.h>

SpecBegin(SignIn)


describe(@"When user starts app", ^{
    afterAll(^{
      [tester tapViewWithAccessibilityLabel:@"Sign Out Button"];
    });
    context(@"and clicks the link to go to the Sign In page", ^{
        it(@"user should get the sign in in page", ^{
            [tester tapViewWithAccessibilityLabel:@"Sign In Link Button"];
            UILabel *signInPageTitle = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"Sign In Page Title Label"];
            expect(signInPageTitle.text).to.equal(@"Sign In");
        });
        context(@"and signs in with valid email and password", ^{
            it(@"user should be presented the home view", ^{
                
                [tester enterText:@"dude@example.com" intoViewWithAccessibilityLabel:@"Sign In Email Field"];
                [tester enterText:@"dudepassword" intoViewWithAccessibilityLabel:@"Sign In Password Field"];
                [tester tapViewWithAccessibilityLabel:@"Sign In Submit Button"];
                
                UILabel *homePageTitle = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"Home Page Title Label"];
                expect(homePageTitle.text).to.equal(@"Hello World");
            });
        });
    });
    
});
SpecEnd
