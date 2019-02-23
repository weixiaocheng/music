//
//  MusicLrcOBJ.m
//  amei
//
//  Created by apple on 2019/2/23.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicLrcOBJ.h"

@implementation MusicLrcOBJ
- (instancetype)initWithString: (NSString *)string
{
    self = [super init];
    if (self) {
        // 如果是 头部就没有 对应时间
        if ([string hasPrefix:@"[ti"] || [string hasPrefix:@"[ar"] || [string hasPrefix:@"[al"]) {
            self.word = [string componentsSeparatedByString:@":"].lastObject;
            self.word = [self.word stringByReplacingOccurrencesOfString:@"]" withString:@""];
            self.time = @"";
        }
        else
        {
            self.word = [string componentsSeparatedByString:@"]"].lastObject;
            self.time = [string componentsSeparatedByString:@"]"].firstObject;
            self.word = [self.word stringByReplacingOccurrencesOfString:@"[" withString:@""];
            self.time = [self.time stringByReplacingOccurrencesOfString:@"[" withString:@""];
        }
    }
    return self;
}
@end
