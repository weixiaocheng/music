//
//  MusicLrcOBJ.h
//  amei
//
//  Created by apple on 2019/2/23.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicLrcOBJ : NSObject
@property (nonatomic, copy) NSString *time; /**< 歌词时间 */
@property (nonatomic, copy) NSString *word; /**< 歌词 */
- (instancetype)initWithString: (NSString *)string;
@end

NS_ASSUME_NONNULL_END
