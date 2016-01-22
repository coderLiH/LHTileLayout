//
//  LHTileLayout.m
//  LHTileLayout
//
//  Created by 李允 on 16/1/20.
//  Copyright © 2016年 liyun. All rights reserved.
//

#import "LHTileLayout.h"

#define CollectionViewWidth     (self.collectionView.frame.size.width == 0 ? [UIScreen mainScreen].bounds.size.width : self.collectionView.frame.size.width)
#define CollectionViewHeight    (self.collectionView.frame.size.height == 0 ? [UIScreen mainScreen].bounds.size.height : self.collectionView.frame.size.height)

@interface LHTileLayout()
@property (nonatomic, strong) NSMutableArray *attributes;

@property (nonatomic, strong) NSMutableDictionary *columnMaxPositions;

@property (nonatomic, assign) CGFloat edge;
/** 行（列）数    lines number or column number */
@property (nonatomic, assign) NSInteger reference;
/** 组insets 每组更新1次     section insets,update by every section */
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
/** 组内空隙 每组更新1次     section inside space,update by every section */
@property (nonatomic, assign) CGFloat referenceSpacing;
/** 组内间距 每组更新1次     section inside margin,update by every section */
@property (nonatomic, assign) CGFloat referenceMargin;
/** 每组item不变边长 每组更新1次     section item constant size,update by every section */
@property (nonatomic, assign) CGFloat constantSize;
@end

@implementation LHTileLayout
- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layout= [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
//    NSInteger section = indexPath.section;
//    CGFloat size = 0.0f;
//    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {// header
//        _edgeInsets = UIEdgeInsetsZero;
//        if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
//            _edgeInsets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
//        }
//        
//        _referenceSpacing = 0.0f;
//        if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceSpacingForSectionAtIndex:)]) {
//            _referenceSpacing = [self.delegate collectionView:self.collectionView layout:self referenceSpacingForSectionAtIndex:section];
//        }
//        
//        _referenceMargin = 0.0f;
//        if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceMarginForSectionAtIndex:)]) {
//            _referenceMargin = [self.delegate collectionView:self.collectionView layout:self referenceMarginForSectionAtIndex:section];
//        }
//        
//        
//        // calculate
//        if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForHeaderInSection:)]) {
//            size = [self.delegate collectionView:self.collectionView layout:self sizeForHeaderInSection:section];
//        }
//        if (self.scrollDirection == LHTileLayoutScrollDirectionVertical) {
//            layout.frame = CGRectMake(0, _edge + _edgeInsets.top, CollectionViewWidth, size);
//            _edge += size + _edgeInsets.top;
//            
//            
//            _constantSize = (CollectionViewWidth - _edgeInsets.left - _edgeInsets.right - (_reference-1) * _referenceSpacing) / (CGFloat)_reference;
//        } else {
//            layout.frame = CGRectMake(_edge + _edgeInsets.left, 0, size, CollectionViewHeight);
//            _edge += size + _edgeInsets.left;
//            
//            
//            _constantSize = (CollectionViewHeight - _edgeInsets.top - _edgeInsets.bottom - (_reference-1) * _referenceSpacing) / (CGFloat)_reference;
//        }
//        
//        for (NSInteger i = 0; i < _reference; i++) {
//            [self.columnMaxPositions setObject:@(_edge) forKey:[NSString stringWithFormat:@"%tu",i]];
//        }
//        
//        NSLog(@"header");
//    } else {// footer
//        if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForFooterInSection:)]) {
//            size = [self.delegate collectionView:self.collectionView layout:self sizeForFooterInSection:section];
//        }
//        
//        if (self.scrollDirection == LHTileLayoutScrollDirectionVertical) {
//            layout.frame = CGRectMake(0, _edge, CollectionViewWidth, size);
//            _edge += size + _edgeInsets.bottom;
//        } else {
//            layout.frame = CGRectMake(_edge, 0, size, CollectionViewHeight);
//            _edge += size + _edgeInsets.right;
//        }
//        
//        NSLog(@"footer");
//    }
//    
    return layout;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    NSInteger column = indexPath.item % _reference;
//    
//    NSInteger minColumn = 0;
//    for (NSInteger i = 1; i < _reference; i++) {
//        if ([self.columnMaxPositions[[NSString stringWithFormat:@"%tu",minColumn]] floatValue] > [self.columnMaxPositions[[NSString stringWithFormat:@"%tu",i]] floatValue]) {
//            minColumn = i;
//        }
//    }
//    
//    CGFloat referenceSize = 0.0f;
//    if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForItemAtIndexPath:)]) {
//        referenceSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForItemAtIndexPath:indexPath];
//    }
//    
//    CGFloat margin = _referenceMargin;
//    if (indexPath.item < _reference) {
//        margin = 0.0f;
//    }
//    
//    if (self.scrollDirection == LHTileLayoutScrollDirectionVertical) {
//        if (self.arrangeMethod == LHTileLayoutArrangeFlow) {
//            attr.frame = CGRectMake(_edgeInsets.left + column * (_constantSize + _referenceSpacing), [self.columnMaxPositions[[NSString stringWithFormat:@"%tu",column]] floatValue] + margin, _constantSize, referenceSize);
//            [self.columnMaxPositions setObject:@(CGRectGetMaxY(attr.frame)) forKey:[NSString stringWithFormat:@"%tu",column]];
//        } else {
//            attr.frame = CGRectMake(_edgeInsets.left + minColumn * (_constantSize + _referenceSpacing), [self.columnMaxPositions[[NSString stringWithFormat:@"%tu",minColumn]] floatValue] + margin, _constantSize, referenceSize);
//            [self.columnMaxPositions setObject:@(CGRectGetMaxY(attr.frame)) forKey:[NSString stringWithFormat:@"%tu",minColumn]];
//        }
//        
//        if (CGRectGetMaxY(attr.frame) >= _edge) {
//            _edge = CGRectGetMaxY(attr.frame);
//        }
//    } else {
//        if (self.arrangeMethod == LHTileLayoutArrangeFlow) {
//            attr.frame = CGRectMake([self.columnMaxPositions[[NSString stringWithFormat:@"%tu",column]] floatValue] + margin, _edgeInsets.top + column * (_constantSize + _referenceSpacing), referenceSize, _constantSize);
//            [self.columnMaxPositions setObject:@(CGRectGetMaxX(attr.frame)) forKey:[NSString stringWithFormat:@"%tu",column]];
//        } else {
//            attr.frame = CGRectMake([self.columnMaxPositions[[NSString stringWithFormat:@"%tu",minColumn]] floatValue] + margin, _edgeInsets.top + minColumn * (_constantSize + _referenceSpacing), referenceSize, _constantSize);
//            [self.columnMaxPositions setObject:@(CGRectGetMaxX(attr.frame)) forKey:[NSString stringWithFormat:@"%tu",minColumn]];
//        }
//        
//        if (CGRectGetMaxX(attr.frame) >= _edge) {
//            _edge = CGRectGetMaxX(attr.frame);
//        }
//    }
//    
//    
//    NSLog(@"%@",self.columnMaxPositions);
    return attr;/// 由于 - (void)scrollToItemAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UICollectionViewScrollPosition)scrollPosition animated:(BOOL)animated; 方法会引起此方法的调用导致_edge计算错误，所以这里仅仅返回需要的attr而不计算，计算在统一由我控制的地方进行
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributes;
}

- (CGSize)collectionViewContentSize {
    CGSize size = CGSizeZero;
    if (self.scrollDirection == LHTileLayoutScrollDirectionVertical) {
        size.width = CollectionViewWidth;
        size.height = _edge;
    } else {
        size.width = _edge;
        size.height = CollectionViewHeight;
    }
    return size;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBound {
    return NO;
}

- (void)layoutNeedDisplay {
    _edge = 0.0f;
    _reference = 1;
    [self.attributes removeAllObjects];
    [self.columnMaxPositions removeAllObjects];
    
    if ([self.delegate respondsToSelector:@selector(referenceNumberForCollectionView:layout:)]) {
        _reference = [self.delegate referenceNumberForCollectionView:self.collectionView layout:self];
    }
    
    for (NSInteger i = 0; i < _reference; i++) {
        [self.columnMaxPositions setObject:@(0) forKey:[NSString stringWithFormat:@"%tu",i]];
    }
    
    NSInteger sections = [self.collectionView numberOfSections];
    for (NSInteger i = 0; i < sections; i++) {
        
        
        // header
        NSIndexPath *headerIndexPath = [NSIndexPath indexPathForItem:0 inSection:i];
        UICollectionViewLayoutAttributes *headerAttribute = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:headerIndexPath];
        _edgeInsets = UIEdgeInsetsZero;
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
            _edgeInsets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:i];
        }
        
        _referenceSpacing = 0.0f;
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceSpacingForSectionAtIndex:)]) {
            _referenceSpacing = [self.delegate collectionView:self.collectionView layout:self referenceSpacingForSectionAtIndex:i];
        }
        
        _referenceMargin = 0.0f;
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceMarginForSectionAtIndex:)]) {
            _referenceMargin = [self.delegate collectionView:self.collectionView layout:self referenceMarginForSectionAtIndex:i];
        }
        
        // calculate
        CGFloat headerSize = 0.0f;
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForHeaderInSection:)]) {
            headerSize = [self.delegate collectionView:self.collectionView layout:self sizeForHeaderInSection:i];
        }
        if (self.scrollDirection == LHTileLayoutScrollDirectionVertical) {
            headerAttribute.frame = CGRectMake(0, _edge + _edgeInsets.top, CollectionViewWidth, headerSize);
            _edge += headerSize + _edgeInsets.top;
            
            
            _constantSize = (CollectionViewWidth - _edgeInsets.left - _edgeInsets.right - (_reference-1) * _referenceSpacing) / (CGFloat)_reference;
        } else {
            headerAttribute.frame = CGRectMake(_edge + _edgeInsets.left, 0, headerSize, CollectionViewHeight);
            _edge += headerSize + _edgeInsets.left;
            
            
            _constantSize = (CollectionViewHeight - _edgeInsets.top - _edgeInsets.bottom - (_reference-1) * _referenceSpacing) / (CGFloat)_reference;
        }
        
        for (NSInteger i = 0; i < _reference; i++) {
            [self.columnMaxPositions setObject:@(_edge) forKey:[NSString stringWithFormat:@"%tu",i]];
        }
        
//        NSLog(@"header");
        if (headerAttribute) {
            [self.attributes addObject:headerAttribute];
        }
        
        
        
        
        
        // items
        NSInteger items = [self.collectionView numberOfItemsInSection:i];
        for (NSInteger j = 0; j < items; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
            
            NSInteger column = indexPath.item % _reference;
            
            NSInteger minColumn = 0;
            for (NSInteger i = 1; i < _reference; i++) {
                if ([self.columnMaxPositions[[NSString stringWithFormat:@"%tu",minColumn]] floatValue] > [self.columnMaxPositions[[NSString stringWithFormat:@"%tu",i]] floatValue]) {
                    minColumn = i;
                }
            }
            
            CGFloat referenceSize = 0.0f;
            if ([self.delegate respondsToSelector:@selector(collectionView:layout:referenceSizeForItemAtIndexPath:)]) {
                referenceSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForItemAtIndexPath:indexPath];
            }
            
            CGFloat margin = _referenceMargin;
            if (indexPath.item < _reference) {
                margin = 0.0f;
            }
            
            if (self.scrollDirection == LHTileLayoutScrollDirectionVertical) {
                if (self.arrangeMethod == LHTileLayoutArrangeFlow) {
                    attribute.frame = CGRectMake(_edgeInsets.left + column * (_constantSize + _referenceSpacing), [self.columnMaxPositions[[NSString stringWithFormat:@"%tu",column]] floatValue] + margin, _constantSize, referenceSize);
                    [self.columnMaxPositions setObject:@(CGRectGetMaxY(attribute.frame)) forKey:[NSString stringWithFormat:@"%tu",column]];
                } else {
                    attribute.frame = CGRectMake(_edgeInsets.left + minColumn * (_constantSize + _referenceSpacing), [self.columnMaxPositions[[NSString stringWithFormat:@"%tu",minColumn]] floatValue] + margin, _constantSize, referenceSize);
                    [self.columnMaxPositions setObject:@(CGRectGetMaxY(attribute.frame)) forKey:[NSString stringWithFormat:@"%tu",minColumn]];
                }
                
                if (CGRectGetMaxY(attribute.frame) >= _edge) {
                    _edge = CGRectGetMaxY(attribute.frame);
                }
            } else {
                if (self.arrangeMethod == LHTileLayoutArrangeFlow) {
                    attribute.frame = CGRectMake([self.columnMaxPositions[[NSString stringWithFormat:@"%tu",column]] floatValue] + margin, _edgeInsets.top + column * (_constantSize + _referenceSpacing), referenceSize, _constantSize);
                    [self.columnMaxPositions setObject:@(CGRectGetMaxX(attribute.frame)) forKey:[NSString stringWithFormat:@"%tu",column]];
                } else {
                    attribute.frame = CGRectMake([self.columnMaxPositions[[NSString stringWithFormat:@"%tu",minColumn]] floatValue] + margin, _edgeInsets.top + minColumn * (_constantSize + _referenceSpacing), referenceSize, _constantSize);
                    [self.columnMaxPositions setObject:@(CGRectGetMaxX(attribute.frame)) forKey:[NSString stringWithFormat:@"%tu",minColumn]];
                }
                
                if (CGRectGetMaxX(attribute.frame) >= _edge) {
                    _edge = CGRectGetMaxX(attribute.frame);
                }
            }
            
//            NSLog(@"%@",self.columnMaxPositions);
            
            if (attribute) {
                [self.attributes addObject:attribute];
            }
        }
        
        
        
        
        
        
        // footer
        NSIndexPath *footerIndexPath = [NSIndexPath indexPathForItem:0 inSection:i];
        UICollectionViewLayoutAttributes *footerAttribute = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:footerIndexPath];
        
        // calculate
        CGFloat footerSize = 0.0f;
        if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForFooterInSection:)]) {
            footerSize = [self.delegate collectionView:self.collectionView layout:self sizeForFooterInSection:i];
        }
        
        if (self.scrollDirection == LHTileLayoutScrollDirectionVertical) {
            footerAttribute.frame = CGRectMake(0, _edge, CollectionViewWidth, footerSize);
            _edge += footerSize + _edgeInsets.bottom;
        } else {
            footerAttribute.frame = CGRectMake(_edge, 0, footerSize, CollectionViewHeight);
            _edge += footerSize + _edgeInsets.right;
        }
        
//        NSLog(@"footer");
        if (footerAttribute) {
            [self.attributes addObject:footerAttribute];
        }
    }
}

- (instancetype)init {
    if (self = [super init]) {
        self.scrollDirection = LHTileLayoutScrollDirectionVertical;
        self.arrangeMethod = LHTileLayoutArrangeFlow;
    }
    return self;
}

- (NSMutableArray *)attributes {
    if (!_attributes) {
        _attributes = [NSMutableArray array];
    }
    return _attributes;
}

- (NSMutableDictionary *)columnMaxPositions {
    if (!_columnMaxPositions) {
        _columnMaxPositions = [NSMutableDictionary dictionary];
    }
    return _columnMaxPositions;
}
@end
