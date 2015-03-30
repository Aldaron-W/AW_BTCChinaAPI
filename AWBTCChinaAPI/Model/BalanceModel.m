//
//  BalanceModel.m
//  AWBTCChinaAPIDemo
//
//  Created by mafengwo on 15/3/18.
//  Copyright (c) 2015年 Aldaron. All rights reserved.
//

#import "BalanceModel.h"

@interface BalanceModel ()

/** 货币代码 */
@property (nonatomic, strong) NSString *currency;
/** 货币符号 */
@property (nonatomic, strong) NSString *symbol;
/** 账户余额 (小数精度) */
@property (nonatomic, strong) NSNumber* amount;
/** 账户余额 (整数精度) */
@property (nonatomic, strong) NSString *amount_integer;
/** 在使用“amount_integer”时小数点的位置 */
@property (nonatomic, assign) NSInteger amount_decimal;

@end

@implementation BalanceModel

- (void)parseJSONData:(NSDictionary *)responseObject{
    self.amount = [NSNumber numberWithDouble:[[responseObject objectForKey:@"amount"] doubleValue]];
    self.amount_decimal = [[responseObject objectForKey:@"amount_decimal"] integerValue];
    self.amount_integer = [responseObject objectForKey:@"amount_integer"];
    self.currency = [responseObject objectForKey:@"currency"];
    self.symbol = [responseObject objectForKey:@"symbol"];
}

- (NSString *)description{
    NSMutableString *amount_zero = [NSMutableString new];
    
    if (self.amount_integer.length < self.amount_decimal) {
        for (int i=0; i < (self.amount_decimal - self.amount_integer.length); i++) {
            [amount_zero appendString:@"0"];
        }
    }
    
    NSString *message = [NSString stringWithFormat:@"%@账户的余额为：%d.%@%@ %@", self.currency, [self.amount intValue], amount_zero, self.amount_integer, self.symbol];
    NSLog(@"%@", message);
    return message;
}

@end
