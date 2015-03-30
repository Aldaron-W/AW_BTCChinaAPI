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
    
    
}
- (IBAction)GetAccountInfoTouchEvent:(id)sender {
    __weak typeof(self) weakSelf = self;
    [[AWBTCChinaRequest sharedAPIKit] getAccountInfoWithType:@"all" withSuccess:^(NSDictionary *responseDictionary) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showResponseInfo:responseDictionary];
    } andFailure:^(NSError *error) {
        ;
    }];
}
- (IBAction)GetDepositsTouchEvent:(id)sender {
    __weak typeof(self) weakSelf = self;
    [[AWBTCChinaRequest sharedAPIKit] getDepositsWithCurrency:@"BTC" andPendingOnly:YES withSuccess:^(NSDictionary *responseDictionary) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showResponseInfo:responseDictionary];
    } andFailure:^(NSError *error) {
        ;
    }];
}

- (void)showResponseInfo:(NSDictionary *)responseDictionary{
    NSLog(@"%@", responseDictionary);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
