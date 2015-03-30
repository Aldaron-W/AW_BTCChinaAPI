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
#import "DepositModel.h"

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

/**
 *  获取账户信息和余额。
 *
 *  @param requestType 参数可以是“all”，“balance”，“frozen”, “loan”或者“profile”，默认为“all”.
 *  @param success     成功的回调函数
 *  @param failure     失败的回调函数
 */
- (void)getAccountInfoWithType:(NSString *)requestType withSuccess:(void (^)(NSDictionary *responseDictionary))success andFailure:(void (^)(NSError *error))failure{
    
    [self sendRequestWithMethod:@"getAccountInfo" andParams:requestType andID:1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *responseDictionary = [NSMutableDictionary new];
        
        {
            NSMutableDictionary *balanceModel = [NSMutableDictionary new];
            NSDictionary *balance = [responseObject objectForKey:@"balance"];
            for (NSString *key in [balance allKeys]) {
                BalanceModel *model = [BalanceModel new];
                [model parseJSONData:[balance objectForKey:key]];
                [balanceModel setObject:model forKey:key];
            }
            if ([balanceModel count] > 0) {
                [responseDictionary setObject:balanceModel forKey:@"balance"];
            }
        }
        
        {
            NSMutableDictionary *frozenModel = [NSMutableDictionary new];
            NSDictionary *frozen = [responseObject objectForKey:@"frozen"];
            for (NSString *key in [frozen allKeys]) {
                FrozenModel *model = [FrozenModel new];
                [model parseJSONData:[frozen objectForKey:key]];
                [frozenModel setObject:model forKey:key];
            }
            if ([frozenModel count] > 0) {
                [responseDictionary setObject:frozenModel forKey:@"frozen"];
            }
        }
        
        {
            NSMutableDictionary *loanModel = [NSMutableDictionary new];
            NSDictionary *loan = [responseObject objectForKey:@"loan"];
            for (NSString *key in [loan allKeys]) {
                LoanModel *model = [LoanModel new];
                [model parseJSONData:[loan objectForKey:key]];
                [loanModel setObject:model forKey:key];
            }
            if ([loanModel count] > 0) {
                [responseDictionary setObject:loanModel forKey:@"loan"];
            }
        }
        
        {
            NSMutableDictionary *profileModel = [NSMutableDictionary new];
            NSDictionary *profile = [responseObject objectForKey:@"profile"];
            ProfileModel *model = [ProfileModel new];
            [model parseJSONData:profile];
            [profileModel setObject:model forKey:@"profile"];
            if ([profileModel count] > 0) {
                [responseDictionary setObject:profileModel forKey:@"profile"];
            }
        }
        
        if (success) {
            success(responseDictionary);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 *  获得用户全部充值记录。
 *
 *  @param currency      目前支持“BTC”，“LTC”
 *  @param isPendingOnly 默认为“true”。如果为“true”，仅返回尚未入账的比特币或者莱特币充值
 *  @param success       成功的回调函数
 *  @param failure       失败的回调函数
 */
- (void)getDepositsWithCurrency:(NSString *)currency andPendingOnly:(BOOL)isPendingOnly withSuccess:(void (^)(NSDictionary *responseDictionary))success andFailure:(void (^)(NSError *error))failure{
    [self sendRequestWithMethod:@"getDeposits" andParams:currency andID:1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableDictionary *responseDictionary = [NSMutableDictionary new];
        
        NSArray *deposit = [responseObject objectForKey:@"deposit"];
        NSMutableArray *depositArray = [NSMutableArray new];
        
        [deposit enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            DepositModel *model = [[DepositModel alloc] init];
            [model parseJSONData:obj];
            [depositArray addObject:model];
        }];
        
        [responseDictionary setValue:depositArray forKey:@"deposit"];
        
        if (success) {
            success(responseDictionary);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
