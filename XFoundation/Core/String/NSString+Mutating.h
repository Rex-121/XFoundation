//
//  NSString+Mutating.h
//  XFoundation
//
//  Created by Ray on 2018/10/8.
//

#import <Foundation/Foundation.h>

@interface NSString (Mutating)

///移除所有数字
- (NSString *)dropAllDigits;

/**
 抹去指定的字符 `sets` 为要抹去的字符串
 
 Example:
 
 NSString *a = @"1a2b3c4d5e6f7g";
 
 b = a.erase(@"1234567");
 
 NSLog(@"%@", b); // @"abcdefg";
 
 @return 抹去指定的字符 `sets` 为要抹去的字符串
 **/
- (NSString *(^)(NSString *sets))erase;

///移除所有0
- (NSString *)dropZero;

///抹去除数字以外的字符
- (NSString *)leftAllDigits;

///是否是小数
- (BOOL)isDecimal;

///移除所有空格和换行符
- (NSString *)dropAllWhiteSpace;

@end



/**
 移除左右2边的空格
 
 @param origin 原字符串
 @param dropNewLine 是否丢弃换行符
 @return 移除左右2边的空格
 */
NS_INLINE NSString * DropHeadFootSpace(NSString *origin, BOOL dropNewLine) {
    if (!origin.length) { return @""; }
    NSCharacterSet *set = dropNewLine ? [NSCharacterSet whitespaceAndNewlineCharacterSet] : [NSCharacterSet whitespaceCharacterSet];
    origin = [origin stringByTrimmingCharactersInSet:set];
    return origin;
}

