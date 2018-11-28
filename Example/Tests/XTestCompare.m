//
//  XTestCompare.m
//  XFoundation_Tests
//
//  Created by Ray on 2018/10/25.
//  Copyright © 2018 Ray. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+Mutating.h"
#import "NSNumber+Compare.h"

@interface XTestCompare : XCTestCase

@end

@implementation XTestCompare

- (void)setUp {

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    NSString *v = @"1.3.5".erase(@".");
    
    NSString *now = @"1.4".erase(@".");
    
    BOOL need = [NSNumber biggerThanOrEqual:[NSNumber numberWithInteger:now.integerValue] :[NSNumber numberWithInteger:v.integerValue]];
    
    XCTAssertFalse(need);
    
    XCTAssertTrue([NSNumber biggerThan:@2 :@1]);
}

@end
