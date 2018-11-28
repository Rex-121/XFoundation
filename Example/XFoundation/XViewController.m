//
//  XViewController.m
//  XFoundation
//
//  Created by Ray on 10/05/2018.
//  Copyright (c) 2018 Ray. All rights reserved.
//

#import "XViewController.h"

#import <WebKit/WebKit.h>

#import <XFoundation/NSArray+String.h>
@interface XViewController ()

@end

@implementation XViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *adf = @" Lorem    ipsum dolar   sit  amet. ";
    
    
    NSLog(@"%@", adf);
    
//    adf = [adf stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    
//    NSLog(@"%@", adf);
    
    NSArray *array = [adf componentsSeparatedByString:@" "];
    
    NSLog(@"%@", [array words:^NSString * _Nonnull(id  _Nonnull obj) {
        return obj;
    } joinedBy:@""]);
    
    
    NSString *http = @"http:\/\/ggg:ff\/group1\/M00\/00\/00\/wKoFW1t6N_-AZKlKAACDHE8iyZI261.png";
    
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    
    NSLog(@"%@", http);
    NSString *a = [http stringByTrimmingCharactersInSet:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSString *b = [http stringByTrimmingCharactersInSet:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSString *c = [http stringByTrimmingCharactersInSet:[NSCharacterSet URLPasswordAllowedCharacterSet]];
    NSString *d = [http stringByTrimmingCharactersInSet:[NSCharacterSet URLPathAllowedCharacterSet]];
    NSString *e = [http stringByTrimmingCharactersInSet:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *f = [http stringByTrimmingCharactersInSet:[NSCharacterSet URLUserAllowedCharacterSet]];
    
    NSString *g = [http stringByTrimmingCharactersInSet:set];
    
    WKWebView *web = [[WKWebView alloc]initWithFrame:self.view.frame];
//    web.frame = self.view.frame;
    [self.view addSubview:web];
    
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[http stringByReplacingOccurrencesOfString:@"\\" withString:@""]]]];
}




@end

