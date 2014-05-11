//
//  CollectionViewController.m
//  FullScreenCollectionViewLineLayoutErrorExample
//
//  Created by Wes on 5/11/14.
//
//

#import "CollectionViewController.h"

static NSString * const kCellID = @"cellID";
static NSInteger const kItemCount = 10;

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellID];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    cell.tag = indexPath.item;
    CGFloat hue = indexPath.item/(CGFloat)kItemCount;
    cell.backgroundColor = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
    return cell;
}

@end
