//
//  ViewController.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "ViewController.h"
#import "AWBTCChinaRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[AWBTCChinaRequest sharedAPIKit] getAccountInfoWithType:@"all"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
