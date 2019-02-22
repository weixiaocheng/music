//
//  MusicPlayManager.m
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import "MusicPlayManager.h"
static MusicPlayManager* manager;

@implementation MusicPlayManager
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}


@end
