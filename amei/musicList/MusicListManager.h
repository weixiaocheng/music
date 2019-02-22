//
//  MusicListManager.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MusicOBJ.h"
NS_ASSUME_NONNULL_BEGIN

@interface MusicListManager : NSObject
@property (nonatomic, strong) NSArray *musicList; /**< <#备注#> */
// 单例
+ (instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
