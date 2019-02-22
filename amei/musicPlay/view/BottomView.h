//
//  BottomView.h
//  amei
//
//  Created by apple on 2019/2/22.
//  Copyright © 2019 corzen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BottomView;
NS_ASSUME_NONNULL_BEGIN
@protocol BottomViewDelegate <NSObject>

/**
 上一首

 @param bottomView <#bottomView description#>
 */
- (void)previousBottomView: (BottomView *)bottomView ;

/**
 播放/ 暂停

 @param bottomView <#bottomView description#>
 */
- (void)playBottomView: (BottomView *)bottomView ;


/**
 下一首

 @param bottimView <#bottimView description#>
 */
- (void)nextBottomView: (BottomView *)bottimView;

@end
@interface BottomView : UIView
@property (nonatomic, weak)id<BottomViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
