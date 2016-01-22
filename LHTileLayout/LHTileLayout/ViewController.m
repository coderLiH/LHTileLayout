//
//  ViewController.m
//  LHTileLayout
//
//  Created by 李允 on 16/1/20.
//  Copyright © 2016年 liyun. All rights reserved.
//

#import "ViewController.h"
#import "LHTileLayout.h"
#import "UIView+AutoLayout.h"
#import "LHCollectionView.h"

@interface ViewController () <UICollectionViewDataSource, LHTileLayoutDelegate, UICollectionViewDelegate>
@property (nonatomic, weak) LHCollectionView *coll;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LHTileLayout *layout = [[LHTileLayout alloc] init];
    layout.delegate = self;
    LHCollectionView *coll = [[LHCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:coll];
    [coll autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view];
    [coll autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.view];
    [coll autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.view];
    [coll autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view];

    coll.dataSource = self;
    coll.delegate = self;
    [coll registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"reuse"];
    [coll registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseHeader"];
    [coll registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reuseFooter"];
    _coll = coll;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuse" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseHeader" forIndexPath:indexPath];
        view.backgroundColor = [UIColor orangeColor];
    } else {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reuseFooter" forIndexPath:indexPath];
        view.backgroundColor = [UIColor purpleColor];
    }
    return view;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([collectionView.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)collectionView.collectionViewLayout;
        if (layout.arrangeMethod == LHTileLayoutArrangeFlow) {
            layout.arrangeMethod = LHTileLayoutArrangePriority;
        } else {
            layout.arrangeMethod = LHTileLayoutArrangeFlow;
        }
    }
    [collectionView reloadData];
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout *)collectionViewLayout sizeForFooterInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout *)collectionViewLayout sizeForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSInteger)referenceNumberForCollectionView:(UICollectionView *)collectionView layout:(LHTileLayout *)collectionViewLayout {
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout *)collectionViewLayout referenceSizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [@[@(199.9),@(88.8),@(166),@(148.8),@(158.8),@(138.8),@(188.8),@(118.8),@(168.8),@(130.8)][indexPath.item] floatValue];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout *)collectionViewLayout referenceMarginForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(LHTileLayout *)collectionViewLayout referenceSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [_coll reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
}
@end
