//
//  NSString+XExt.m
//  XFoundation
//
//  Created by Ray on 2018/10/8.
//

#import "NSString+XExt.h"

//+ controlCharacterSet
//+ whitespaceCharacterSet              //空格
//+ whitespaceAndNewlineCharacterSet    //空格和换行符
//+ decimalDigitCharacterSet            //0-9的数字
//+ letterCharacterSet                  //所有字母
//+ lowercaseLetterCharacterSet         //小写字母
//+ uppercaseLetterCharacterSet         //大写字母
//+ alphanumericCharacterSet            //所有数字和字母（大小写不分）
//+ punctuationCharacterSet             //标点符号
//+ newlineCharacterSet                 //换行

@implementation NSString (XExt)

+ (NSString *)eraseSet:(NSCharacterSet *)sets from:(NSString *)origin {
    return [self eraseSet:sets invert:NO from:origin];
}

+ (NSString *)eraseSet:(NSCharacterSet *)sets invert:(BOOL)invert from:(NSString *)origin {
    if (!origin.length) { return @""; }
    if (!sets) { return origin; }
    if (invert) { sets = [sets invertedSet]; }
    return [[origin componentsSeparatedByCharactersInSet:sets] componentsJoinedByString:@""];
}

+ (NSString *)erase:(NSString *)sets from:(NSString *)origin {
    return [self eraseSet:[NSCharacterSet characterSetWithCharactersInString:sets] from:origin];
}

+ (NSString *)dropAllDigitNum:(NSString *)origin invert:(BOOL)invert {
    return [self eraseSet:[NSCharacterSet decimalDigitCharacterSet] invert:invert from:origin];
}



@end

#import "NSArray+String.h"

@implementation NSString (WhiteSpace)

+ (NSString *)dropAllSpace:(NSString *)origin {
    if (!origin.length) { return @""; }
    
    return [[origin componentsSeparatedByString:@" "] words:^NSString * _Nonnull(NSString * _Nonnull obj) {
        return obj;
    } joinedBy:@""];
    
}

@end
