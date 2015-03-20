//
//  AWBTCChinaRequest.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "AWBTCChinaRequest.h"

#import "PrivateMarco.h"
#import "BalanceModel.h"
#import "FrozenModel.h"
#import "LoanModel.h"
#import "ProfileModel.h"

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

- (void)getAccountInfoWithType:(NSString *)requestType withSuccess:(void (^)(NSDictionary *responseDictionary))success andFailure:(void (^)(NSError *error))failure{
    
    [self sendRequestWithMethod:@"getAccountInfo" andParams:@"" andID:1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *resposeDictionary = [NSMutableDictionary new];
        
        {
            NSMutableDictionary *balanceModel = [NSMutableDictionary new];
            NSDictionary *balance = [responseObject objectForKey:@"balance"];
            for (NSString *key in [balance allKeys]) {
                BalanceModel *model = [BalanceModel new];
                [model parseJSONData:[balance objectForKey:key]];
                [balanceModel setObject:model forKey:key];
            }
            [resposeDictionary setObject:balanceModel forKey:@"balance"];
        }
        
        {
            NSMutableDictionary *frozenModel = [NSMutableDictionary new];
            NSDictionary *frozen = [responseObject objectForKey:@"frozen"];
            for (NSString *key in [frozen allKeys]) {
                FrozenModel *model = [FrozenModel new];
                [model parseJSONData:[frozen objectForKey:key]];
                [frozenModel setObject:model forKey:key];
            }
            [resposeDictionary setObject:frozenModel forKey:@"frozen"];
        }
        
        {
            NSMutableDictionary *loanModel = [NSMutableDictionary new];
            NSDictionary *loan = [responseObject objectForKey:@"loan"];
            for (NSString *key in [loan allKeys]) {
                LoanModel *model = [LoanModel new];
                [model parseJSONData:[loan objectForKey:key]];
                [loanModel setObject:model forKey:key];
            }
            [resposeDictionary setObject:loanModel forKey:@"loan"];
        }
        
        {
            NSMutableDictionary *profileModel = [NSMutableDictionary new];
            NSDictionary *profile = [responseObject objectForKey:@"profile"];
                ProfileModel *model = [ProfileModel new];
                [model parseJSONData:profile];
                [profileModel setObject:model forKey:@"profile"];
            [resposeDictionary setObject:profileModel forKey:@"profile"];
        }
        
        if (success) {
            success(resposeDictionary);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end
