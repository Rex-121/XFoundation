//
//  NSArray+String.h
//  XFoundation
//
//  Created by Ray on 2018/10/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (String)


/**
 数组转出字符串
 
 @discussion  数组转出字符串
 
 NSArray *array = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];

 NSString *a = [sArray words:^NSString * _Nonnull(id  _Nonnull obj) {
                    return [NSString stringWithFormat:@"%@", obj];
               } joinedBy:@""];
 
 NSLog(@"%@", a); /// print: @"12345678910"
 

 @param display 转出规则
 @param join 分割字符串
 @return 字符串
 */
- (NSString *)words:(NSString *(^)(ObjectType obj))display joinedBy:(NSString *)join;

@end

@interface NSDictionary <KeyType, ObjectType> (String)


/**
 格式化输出keyvalue
 
 @discussion  格式化输出keyvalue
 
 NSDictionary *dic = @{@"1":@"a", @"2": @"b", @"3": @"c"};
 
 NSArray <NSString *>*array = [dic flatKeyValue:^NSString * _Nonnull(id  _Nonnull obj) {
                                   return obj;
                              } joinedBy:@"->"]
 
 NSLog(@"%@", array); /// print: @[@"1->a", @"2->b", @"3->c"]

 @param display 输出
 @param join 分割key-value
 @return NSArray <NSString *>*
 */
- (NSArray <NSString *>*)flatKeyValue:(nonnull NSString *(^)(ObjectType obj))display joinedBy:(NSString *)join;


/**
 格式化输出keyvalue
 
 @discussion  格式化输出keyvalue
 
 NSDictionary *dic = @{@"1":@"a", @"2": @"b", @"3": @"c"};
 
 NSString *k = [dic flatKeyValue:^NSString * _Nonnull(id  _Nonnull obj) {
 return obj;
 } joinedBy:@"->" pending:@"{}"]
 
 NSLog(@"%@", k);  // @"1->a{}2->b{}3->c"
 
 @param display 输出
 @param join 分割key-value
 @param pending 分割数组
 @return NSString *
 */
- (NSString *)flatKeyValue:(nonnull NSString *(^)(ObjectType obj))display joinedBy:(NSString *)join pending:(NSString *)pending;

@end

NS_ASSUME_NONNULL_END
