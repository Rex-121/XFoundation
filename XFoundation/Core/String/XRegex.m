//
//  XRegex.m
//  XFoundation
//
//  Created by Ray on 2018/11/7.
//

#import "XRegex.h"

NSString *const X_Regex_For_Email = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";

@implementation XRegex


+ (BOOL)rex:(id)obj match:(NSString *)format {
    if (!obj) { return NO; }
    if (!format) { return YES; }
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", format] evaluateWithObject:obj];
}

+ (NSString *)way:(eRegexT)way {
    switch (way) {
        case eRegex_contains: return @"CONTAINS";
        case eRegex_equal: return @"==";
        case eRegex_like: return @"LIKE";
    }
}

@end


@implementation NSString (XRegex)

- (BOOL)match:(NSString *)format {
    return [XRegex rex:self match:format];
}

+ (BOOL)is_Email:(NSString *)email { return [XRegex rex:email match:X_Regex_For_Email]; }

@end


@implementation NSArray (XRegex)

- (NSArray *)match:(NSString *)predicateFormat {
    if (!self.count) { return @[]; }
    return [self filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:predicateFormat]];
}

- (NSArray *)matchKey:(NSString *)key way:(eRegexT)way value:(NSString *)value {
    
    NSString *match = [NSString stringWithFormat:@"%@ %@ '%@'", key, [XRegex way:way], value];
    
    return [self match:match];
    
}

- (NSArray *)matchKey:(NSString *)key operation:(NSString *)oper value:(NSNumber *)value {
    return [self match:key :oper :value];
}
- (NSArray *)match:(NSString *)key :(NSString *)oper :(NSNumber *)value {
    return [self match:[NSString stringWithFormat:@"%@ %@ %@", key, oper, value.stringValue]];
}


@end
