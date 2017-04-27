//
//  MSViewController.m
//  TestCollectionView
//
//  Created by ZhangAo on 14-8-10.
//  Copyright (c) 2014年 ZA. All rights reserved.
//

#import "MSViewController.h"

@interface CollectionCell : UICollectionViewCell

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation CollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:self.titleLabel];
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end

////////////////////////////////////////////////////////////////////////

@interface MSViewController () <UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGSize itemSize = CGSizeMake(320 / 2, self.view.frame.size.height / 2-20);
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = itemSize;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                          collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    [collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"Cell"];
    collectionView.pagingEnabled = YES;
    self.collectionView = collectionView;
    
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifierCell = @"Cell";
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCell forIndexPath:indexPath];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    return cell;
}

@end
