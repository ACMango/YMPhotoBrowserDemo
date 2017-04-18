//
//  YMPhotoBrowserView.h
//  YMPhotoBrowserDemo
//
//  Created by dazhi on 2017/4/14.
//  Copyright © 2017年 yanming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMPBMacro.h"

#pragma mark - YMPhotoGroupItem
/// Single picture's info.
@interface YMPhotoGroupItem : NSObject
@property (nonatomic, strong) UIView *thumbView; ///< thumb image, used for animation position calculation
@property (nonatomic, strong) NSURL  *largeImageURL;
@end


#pragma mark - YMPhotoBrowserView
/// Used to show a group of images.
/// One-shot.
@interface YMPhotoBrowserView : UIView
@property (nonatomic, readonly) NSArray *groupItems; ///< Array<YYPhotoGroupItem>
@property (nonatomic, readonly) NSInteger currentPage;
@property (nonatomic, assign) BOOL blurEffectBackground; ///< Default is YES

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithFrame:(CGRect)frame UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithGroupItems:(NSArray *)groupItems;

- (void)presentFromImageView:(UIView *)fromView
                 toContainer:(UIView *)container
                    animated:(BOOL)animated
                  completion:(void (^)(void))completion;

- (void)dismissAnimated:(BOOL)animated completion:(void (^)(void))completion;
- (void)dismiss;

@end
