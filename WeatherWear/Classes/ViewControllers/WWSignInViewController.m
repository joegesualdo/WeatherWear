//
//  WWSignInViewController.m
//  WeatherWear
//
//  Created by Joe Gesualdo on 9/25/14.
//  Copyright (c) 2014 joegesualdo. All rights reserved.
//

#import "WWSignInViewController.h"
#import "WWUserNetworkManager.h"

@interface WWSignInViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)signInButtonPressed:(UIButton *)sender;

@end

@implementation WWSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signInButtonPressed:(UIButton *)sender {
  [WWUserNetworkManager POSTSignInUserWithEmail:self.emailTextField.text andPassword:self.passwordTextField.text completionHandler:^(BOOL completed) {
      if (completed){
          [self.navigationController dismissViewControllerAnimated:YES completion:nil];
      }
  }];
}
@end
