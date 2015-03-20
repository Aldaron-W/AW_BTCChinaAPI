//
//  AWBTCChinaRequest.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "AWBTCChinaRequest.h"

@implementation AWBTCChinaRequest

+ (AWBTCChinaRequest *)sharedAPIKit {
    static AWBTCChinaRequest *_sharedAPIKit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAPIKit = [[AWBTCChinaRequest alloc] init];
        
        _sharedAPIKit.accessKey = @"2cf34378-cb2c-45a7-a53c-82ddeec788c7";
        _sharedAPIKit.secretKey = @"fd9b0256-5a62-40fa-b920-9f956de35692";
    });
    return _sharedAPIKit;
}


- (void)getAccountInfoWithType:(NSString *)requestType{
    
    [self sendRequestWithMethod:@"getAccountInfo" andParams:@"" andID:1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        ;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        ;
    }];
}

@end
