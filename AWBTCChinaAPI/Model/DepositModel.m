//
//  DepositModel.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/19.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "DepositModel.h"

@interface DepositModel ()

/** 存款 ID **/
@property (nonatomic, assign) NSInteger depositID;
/** 比特币或者莱特币充值地址 **/
@property (nonatomic, strong) NSString *address;
/** 货币代码。可能值：BTC 或 LTC **/
@property (nonatomic, strong) NSString *currency;
/** 充值数量 **/
@property (nonatomic, strong) NSNumber *amount;
/** Unix 时间戳。自1970年1月1日以来的秒数 **/
@property (nonatomic, assign) NSDate *date;
/** 充值状态。可能值：pending 或 completed **/
@property (nonatomic, strong) NSString *status;

@end

@implementation DepositModel

- (void)parseJSONData:(NSDictionary *)responseObject{
    self.depositID = [[responseObject objectForKey:@"depositID"] integerValue];
    self.address = [responseObject objectForKey:@"address"];
    self.currency = [responseObject objectForKey:@"currency"];
    self.amount = [NSNumber numberWithDouble:[[responseObject objectForKey:@"amount"] doubleValue]];
    self.date = [NSDate dateWithTimeIntervalSince1970:[[responseObject objectForKey:@"date"] doubleValue]];
    self.status = [responseObject objectForKey:@"status"];
}

- (NSString *)description{
    NSString *message = [NSString stringWithFormat:@"depositID:%ld,address:%@,currency:%@amount:%@,date:%@,status:%@", self.depositID, self.address, self.currency, self.amount, self.date, self.status];
//    NSLog(@"%@", message);
    return message;
}

@end
