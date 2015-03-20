//
//  AWBTCChinaRequest.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "AWBTCChinaRequest.h"

#import "PrivateMarco.h"

@implementation AWBTCChinaRequest

+ (AWBTCChinaRequest *)sharedAPIKit {
    static AWBTCChinaRequest *_sharedAPIKit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAPIKit = [[AWBTCChinaRequest alloc] init];
        
        _sharedAPIKit.accessKey = ACCESS_KEY;
        _sharedAPIKit.secretKey = SECRET_KEY;
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
