//
//  UserDetailViewController.m
//  ProjectModel
//
//  Created by Gao Huang on 14-11-30.
//  Copyright (c) 2014年 Martin. All rights reserved.
//

#import "UserDetailViewController.h"
#import "LoginViewController.h"
@interface UserDetailViewController ()<LoginViewControllerDelegate>

@end

@implementation UserDetailViewController

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
- (IBAction)logoutAction:(id)sender {
    [SharedAction presentLoginViewControllerInViewController:self];
    SharedData *sharedData = [SharedData sharedInstance];
    sharedData.loginStatus = @"no";
}

#pragma LoginViewControllerDelegate
-(void)loginSuccessedInLoginViewController:(UIViewController *)loginViewController{
    [self loadDataInView];
}

-(void)loadDataInView{
    NSLog(@"loadDataInView");
}

@end
