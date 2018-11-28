//
//  XRegex.h
//  XFoundation
//
//  Created by Ray on 2018/11/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//extern NSString *const X_Regex_For_Email;

typedef NS_ENUM(NSUInteger, eRegexT) {
    eRegex_contains,
    eRegex_equal,
    eRegex_like
};

@interface XRegex : NSObject

/**
 正则

 @param obj 需要被正则测试的
 @param format 正则表达式
 @return 是否符合正则表达式
 */
+ (BOOL)rex:(id)obj match:(NSString *)format;

@end

@interface NSString (XRegex)


/**
 正则 字符串

 @param format 正则表达式
 @return 是否符合正则表达式
 */
- (BOOL)match:(NSString *)format;

/**
 是否是邮箱
 
 @param email 字符串
 @return `email` 是否是邮箱
 */
+ (BOOL)is_Email:(NSString *)email;

@end


@interface NSArray<ObjectType> (XRegex)


/**
 发现所有符合条件的元素

 @param predicateFormat 条件
 @return @[所有符合条件的元素]
 */
- (NSArray <ObjectType>*)match:(NSString *)predicateFormat;


/**
 发现所有符合条件的元素
 
 @discussion NSArray *a = @[@{@"name":@"a"}, @{@"name":@"b"}, @{@"name":@"c"}, @{@"name":@"abcd"}];

 NSArray *b = [a matchKey:@"name" way:eRegex_contains value:@"c"];
 
 NSLog(@"%@", b); //@[@{@"name":@"c"}, @{@"name":@"abcd"}];
 
 @param key key
 @param way 查询方式
 @param value 对应的值
 @return @[所有符合条件的元素]
 */
- (NSArray <ObjectType>*)matchKey:(NSString *)key way:(eRegexT)way value:(NSString *)value;


/**
 发现所有符合条件的元素

 @discussion NSArray *a = @[@{@"age":@1}, @{@"age":@12}, @{@"age":@13}, @{@"age":@14}, @{@"age":@3}];
 
 NSArray *b = [a matchKey:@"age" operation:@">=" value:@3];
 
 NSLog(@"%@", b); //@[@{@"age":@12}, @{@"age":@13}, @{@"age":@14}, @{@"age":@3}];
 
 @param key key
 @param oper 查询方式
 @param value 对应的值
 @return @[所有符合条件的元素]
 */
- (NSArray <ObjectType>*)matchKey:(NSString *)key operation:(NSString *)oper value:(NSNumber *)value;

@end

NS_ASSUME_NONNULL_END


/**
 是否全是数字
 
 @param str 字符串
 @return `str` 是否全是数字
 */
NS_INLINE BOOL X_IsAllInt ( NSString * _Nonnull str) {
    NSScanner *scan = [NSScanner scannerWithString:str];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


/**
 是否是邮箱
 
 @param str 字符串
 @return `str` 是否是邮箱
 */
NS_INLINE BOOL X_IsEmail (NSString * _Nullable str) {
    return [NSString is_Email:str];
}

