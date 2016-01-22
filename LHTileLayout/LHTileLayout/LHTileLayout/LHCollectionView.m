//
//  LHCollectionView.m
//  LHTileLayout
//
//  Created by 李允 on 16/1/21.
//  Copyright © 2016年 liyun. All rights reserved.
//

#import "LHCollectionView.h"
#import "LHTileLayout.h"

@implementation LHCollectionView

- (void)reloadData {
    [super reloadData];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)reloadItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    [super reloadItemsAtIndexPaths:indexPaths];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)reloadSections:(NSIndexSet *)sections {
    [super reloadSections:sections];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)insertSections:(NSIndexSet *)sections {
    [super insertSections:sections];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}
- (void)deleteSections:(NSIndexSet *)sections {
    [super deleteSections:sections];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)moveSection:(NSInteger)section toSection:(NSInteger)newSection {
    [super moveSection:section toSection:newSection];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    [super insertItemsAtIndexPaths:indexPaths];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    [super deleteItemsAtIndexPaths:indexPaths];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath {
    [super moveItemAtIndexPath:indexPath toIndexPath:indexPath];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}

- (void)performBatchUpdates:(void (^ __nullable)(void))updates completion:(void (^ __nullable)(BOOL finished))completion {
    [super performBatchUpdates:updates completion:completion];
    
    if ([self.collectionViewLayout isKindOfClass:[LHTileLayout class]]) {
        LHTileLayout *layout = (LHTileLayout *)self.collectionViewLayout;
        [layout layoutNeedDisplay];
    }
}
@end
