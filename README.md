###FullScreenCollectionViewLineLayoutErrorExample
==============================================

This is an example that illustrates the error logged by `UICollectionView` when cells are full screen in a `UINavigationController` and how to fix it.

The example here is a `UICollectionViewController` subclass using a `UICollectionViewFlowLayout` configured as follows:
```objc
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
```

The goal is to have each cell be full screen, thus the `itemSize` is set to be the same as `self.collectionView.frame.size`.
The problem I was seeing is that while everything appears to be normal in the simulator and on device, a message is logged to the console:

```
2014-05-11 13:02:41.223 FullScreenCollectionViewLineLayoutErrorExample[5083:60b] the behavior of the UICollectionViewFlowLayout is not defined because:
2014-05-11 13:02:41.227 FullScreenCollectionViewLineLayoutErrorExample[5083:60b] the item height must be less that the height of the UICollectionView minus the section insets top and bottom values.
```

After a lot frusteration and time, I finally realized that the `UIViewController` property `automaticallyAdjustsScrollViewInsets` is set to `YES` by default which affects the insets as the property name describes. The documentation for the property is the following:

>#####automaticallyAdjustsScrollViewInsets

>Specifies whether or not the view controller should automatically adjust its scroll view insets.

>`@property(nonatomic, assign) BOOL automaticallyAdjustsScrollViewInsets`
#####Discussion
Default value is YES, which allows the view controller to adjust its scroll view insets in response to the screen areas consumed by the status bar, navigation bar, and toolbar or tab bar. Set to NO if you want to manage scroll view inset adjustments yourself, such as when there is more than one scroll view in the view hierarchy.

>#####Availability
Available in iOS 7.0 and later.

>#####Declared In
UIViewController.h

Here's the [diff of the fix](https://github.com/w5mith/FullScreenCollectionViewLineLayoutErrorExample/compare/with_error...fixed_error). Hopefully this saves someone else from the same frusteration.
