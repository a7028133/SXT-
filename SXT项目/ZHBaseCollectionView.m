//
//  ZHBaseCollectionView.m
//  SXT项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "ZHBaseCollectionView.h"
#import "ZHBaseCollectionViewCell.h"
#import "ZHCollectionReusableView.h"

@interface ZHBaseCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ZHBaseCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.delegate = self;
        self.dataSource = self;
         [self registerClass:[ZHBaseCollectionViewCell class] forCellWithReuseIdentifier:@"ZHBaseCollectionViewCell"];

        
        [self registerClass:[ZHCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZHCollectionReusableView"];
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.effectArr.count;
    }else if (section == 1){
        return self.faceArr.count;
    }else
        return self.bodyArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID =@"ZHBaseCollectionViewCell";
    if(indexPath.section == 0)
    {
        ZHBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        ZHEffectModel *eModel = self.effectArr[indexPath.row];
        [cell setEffectModel:eModel];
        cell.titleLab.hidden = NO;
        return cell;
    }
    else if (indexPath.section == 1) {
        ZHBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        [cell setFaceModel:self.faceArr[indexPath.row]];
        cell.titleLab.hidden = YES;
        return cell;
    } else {
        ZHBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
        [cell sizeToFit];
        cell.bodyModel =  self.bodyArr[indexPath.row];
        cell.titleLab.hidden =  YES;
        return cell;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //kind:种类，一共两种，一种是header,一种是footer
    
    if (kind == UICollectionElementKindSectionHeader)
    {
        ZHCollectionReusableView *resuableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZHCollectionReusableView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            resuableview.title= @"功效专区";
            resuableview.backgroundColor = RBG(239, 248, 251);
        }else if (indexPath.section == 1){
            resuableview.title = @"经典品牌";
            resuableview.backgroundColor = RBG(252, 244, 243);
        }else{
            resuableview.title = @"推荐品牌";
            resuableview.backgroundColor = RBG(252, 244, 243);
        }
        return resuableview;
    }
    return nil;
}

@end
