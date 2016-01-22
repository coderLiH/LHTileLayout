//
//  LHTileLayout.h
//  LHTileLayout
//
//  Created by 李允 on 16/1/20.
//  Copyright © 2016年 liyun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight   ([UIScreen mainScreen].bounds.size.height)

typedef NS_ENUM(NSInteger, LHTileLayoutScrollDirection) {
    LHTileLayoutScrollDirectionVertical,
    LHTileLayoutScrollDirectionHorizontal
};

typedef NS_ENUM(NSInteger, LHTileLayoutArrange) {
    LHTileLayoutArrangeFlow,
    LHTileLayoutArrangePriority
};

@class LHTileLayout;

@protocol LHTileLayoutDelegate <NSObject>
@required
- (NSInteger)referenceNumberForCollectionView:(UICollectionView *)collectionView layout:(LHTileLayout*)collectionViewLayout;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout*)collectionViewLayout referenceSizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout*)collectionViewLayout referenceSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout*)collectionViewLayout referenceMarginForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout*)collectionViewLayout sizeForHeaderInSection:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout*)collectionViewLayout sizeForFooterInSection:(NSInteger)section;

@end


@interface LHTileLayout : UICollectionViewLayout
@property (nonatomic, assign) LHTileLayoutScrollDirection scrollDirection;
@property (nonatomic, assign) LHTileLayoutArrange arrangeMethod;

- (void)layoutNeedDisplay;

@property (nonatomic, weak) id <LHTileLayoutDelegate> delegate;

@end