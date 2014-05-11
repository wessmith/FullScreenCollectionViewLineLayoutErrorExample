//
//  FullScreenLineLayout.m
//  FullScreenCollectionViewLineLayoutErrorExample
//
//  Created by Wes on 5/11/14.
//
//

#import "FullScreenLineLayout.h"

@implementation FullScreenLineLayout

- (void)prepareLayout {
    self.itemSize = self.collectionView.frame.size;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;
    self.minimumLineSpacing = 0.0;
    self.minimumInteritemSpacing = 0.0;
    self.sectionInset = UIEdgeInsetsZero;
    self.footerReferenceSize = CGSizeZero;
    self.headerReferenceSize = CGSizeZero;
}

@end
