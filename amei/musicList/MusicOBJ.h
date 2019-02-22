//
//  MusicOBJ.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicOBJ : NSObject

@property (nonatomic, copy) NSString *filename; /**< 歌曲文件名称  */
@property (nonatomic, copy) NSString *icon; /**< 背景图片 */
@property (nonatomic, copy) NSString *lrcname; /**< 歌词文件名*/
@property (nonatomic, copy) NSString *name; /**< 歌曲名称 */
@property (nonatomic, copy) NSString *singer; /**< 歌手 */
@property (nonatomic, copy) NSString *singerIcon; /**< 歌手照片 */
@property (nonatomic, assign) BOOL isPlay; /**< 是否在播放中 */

@end

NS_ASSUME_NONNULL_END
