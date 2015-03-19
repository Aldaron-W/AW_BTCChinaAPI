//
//  ErrorModel.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "ErrorModel.h"

/**
 Code	Message
 -32000	内部错误
 -32003	人民币账户余额不足
 -32004	比特币账户余额不足
 -32005	挂单没有找到
 -32006	无效的用户
 -32007	无效的货币
 -32008	无效的金额
 -32009	无效的钱包地址
 -32010	没有找到提现记录
 -32011	没有找到充值记录
 -32017	无效的类型
 -32018	无效的价格
 -32019	无效的参数
 -32025	订单已取消
 -32026	订单已完成
 -32062	市场深度不足以成交该市场交易
 -32065	无效的货币参数
 -32086	订单处理中
 */

@interface ErrorModel ()

/** 错误码 */
@property (nonatomic, assign) NSInteger code;
/** 错误信息 */
@property (nonatomic, strong) NSString *message;
/** 错误ID */
@property (nonatomic, assign) NSInteger errorID;

@end

@implementation ErrorModel

@end
