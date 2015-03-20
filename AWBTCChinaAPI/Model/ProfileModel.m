//
//  ProfileModel.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "ProfileModel.h"

@interface ProfileModel ()

/** 账户用户名 **/
@property (nonatomic, strong) NSString *username;
/** 指示该账户是否已设置交易密码 **/
@property (nonatomic, assign) BOOL trade_password_enabled;
/** 指示是否已启用双重认证 **/
@property (nonatomic, assign) BOOL otp_enabled;
/** 比特币交易手续费 **/
@property (nonatomic, strong) NSNumber *trade_fee;
/** 莱特币交易手续费 **/
@property (nonatomic, strong) NSNumber *trade_fee_cnyltc;
/** 比特币莱特币互换交易手续费 **/
@property (nonatomic, strong) NSNumber *trade_fee_btcltc;
/** 账户每日比特币提现限额 **/
@property (nonatomic, strong) NSNumber *daily_btc_limit;
/** 账户每日莱特币提现限额 **/
@property (nonatomic, strong) NSNumber *daily_ltc_limit;
/** 比特币充值地址 **/
@property (nonatomic, strong) NSString *btc_deposit_address;
/** 比特币提现地址 **/
@property (nonatomic, strong) NSString *btc_withdrawal_address;
/** 莱特币充值地址 **/
@property (nonatomic, strong) NSString *ltc_deposit_address;
/** 莱特币提现地址 **/
@property (nonatomic, strong) NSString *ltc_withdrawal_address;
/** API交易权限， 1-只读权限， 3-仅交易权限， 5-仅提现权限，7-交易以及提现权限 **/
@property (nonatomic, strong) NSString *api_key_permission;

@end

@implementation ProfileModel

- (void)parseJSONData:(NSDictionary *)responseObject{
    
    self.username = [responseObject objectForKey:@"username"];
    self.trade_password_enabled = [[responseObject objectForKey:@"trade_password_enabled"] boolValue];
    self.otp_enabled = [[responseObject objectForKey:@"otp_enabled"] boolValue];
    self.trade_fee = [NSNumber numberWithDouble:[[responseObject objectForKey:@"trade_fee"] doubleValue]];
    self.trade_fee_btcltc = [NSNumber numberWithDouble:[[responseObject objectForKey:@"trade_fee_btcltc"] doubleValue]];
    self.trade_fee_cnyltc = [NSNumber numberWithDouble:[[responseObject objectForKey:@"trade_fee_cnyltc"] doubleValue]];
    self.daily_btc_limit = [NSNumber numberWithDouble:[[responseObject objectForKey:@"daily_btc_limit"] doubleValue]];
    self.daily_ltc_limit = [NSNumber numberWithDouble:[[responseObject objectForKey:@"daily_ltc_limit"] doubleValue]];
    self.btc_deposit_address = [responseObject objectForKey:@"btc_deposit_address"];
    self.btc_withdrawal_address = [responseObject objectForKey:@"btc_withdrawal_address"];
    self.ltc_deposit_address = [responseObject objectForKey:@"ltc_deposit_address"];
    self.ltc_withdrawal_address = [responseObject objectForKey:@"ltc_withdrawal_address"];
    self.api_key_permission = [responseObject objectForKey:@"api_key_permission"];
}

@end
