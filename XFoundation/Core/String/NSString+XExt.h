//
//  NSString+XExt.h
//  XFoundation
//
//  Created by Ray on 2018/10/8.
//

#import <Foundation/Foundation.h>



@interface NSString (XExt)


/**
 抹去指定的字符

 @param sets 需要抹去的字符
 @param origin 原字符串
 @return 抹去后的字符串
 
 eg:
 NSString *origin = @"ab4444c3d1fg22hi32jk5lmn";
 origin = [NSString erase:@"123456789" from:origin];
 NSLog(@"%@", origin); ///abcdfghijklmn
 
 */
+ (NSString *)erase:(NSString *)sets from:(NSString *)origin;


/**
 移除指定字符串 （不建议直接使用）

 @param sets 字符串
 @param origin 原字符串
 @return 抹去后的字符串
 */
+ (NSString *)eraseSet:(NSCharacterSet *)sets from:(NSString *)origin;

/**
 移除指定字符串 （不建议直接使用）

 @param sets 字符串
 @param invert 条件是否反转
 @param origin 原字符串
 @return 抹去后的字符串
 */
+ (NSString *)eraseSet:(NSCharacterSet *)sets invert:(BOOL)invert from:(NSString *)origin;

/**
 移除所有数字
 
 @param origin 原字符串
 @param invert 条件是否反转(即留下所有数字)
 @return 无数字的字符串
 */
+ (NSString *)dropAllDigitNum:(NSString *)origin invert:(BOOL)invert;

@end

@interface NSString (WhiteSpace)

/**
 移除所有的空格和换行符
 
 @param origin 原字符串
 @return 移除所有的空格和换行符
 */
+ (NSString *)dropAllSpace:(NSString *)origin;

@end



