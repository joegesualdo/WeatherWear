//
//  WWHomeViewController.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWHomeViewController.h"
#import "WWUser.h"
#import "WWSignupViewController.h"

@interface WWHomeViewController ()
- (IBAction)pressSignOutButton:(UIButton *)sender;

@end

@implementation WWHomeViewController

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"Appeared");
    [super viewDidAppear:YES];
    WWUser *currentUser = [WWUser currentUser];
    if (currentUser == nil) {
        [self performSegueWithIdentifier:@"signUpSegue" sender:self];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressSignOutButton:(UIButton *)sender {
  [WWUser setCurrentUser:nil];
  [self performSegueWithIdentifier:@"signUpSegue" sender:self];
}
@end
