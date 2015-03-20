//
//  ProfileModel.h
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBaseModel.h"

@interface ProfileModel : AWBaseModel

/** 账户用户名 **/
@property (nonatomic, readonly) NSString *username;
/** 指示该账户是否已设置交易密码 **/
@property (nonatomic, readonly) BOOL trade_password_enabled;
/** 指示是否已启用双重认证 **/
@property (nonatomic, readonly) BOOL otp_enabled;
/** 比特币交易手续费 **/
@property (nonatomic, readonly) NSNumber *trade_fee;
/** 莱特币交易手续费 **/
@property (nonatomic, readonly) NSNumber *trade_fee_cnyltc;
/** 比特币莱特币互换交易手续费 **/
@property (nonatomic, readonly) NSNumber *trade_fee_btcltc;
/** 账户每日比特币提现限额 **/
@property (nonatomic, readonly) NSNumber *daily_btc_limit;
/** 账户每日莱特币提现限额 **/
@property (nonatomic, readonly) NSNumber *daily_ltc_limit;
/** 比特币充值地址 **/
@property (nonatomic, readonly) NSString *btc_deposit_address;
/** 比特币提现地址 **/
@property (nonatomic, readonly) NSString *btc_withdrawal_address;
/** 莱特币充值地址 **/
@property (nonatomic, readonly) NSString *ltc_deposit_address;
/** 莱特币提现地址 **/
@property (nonatomic, readonly) NSString *ltc_withdrawal_address;
/** API交易权限， 1-只读权限， 3-仅交易权限， 5-仅提现权限，7-交易以及提现权限 **/
@property (nonatomic, readonly) NSString *api_key_permission;

@end
