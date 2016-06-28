//
//  ZHBaseCollectionViewCell.h
//  SXT项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHEffectModel.h"
#import "ZHFaceModel.h"
#import "ZHBodyModel.h"

@interface ZHBaseCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)ZHEffectModel *effectModel;
@property(nonatomic,strong)ZHFaceModel *faceModel;
@property(nonatomic,strong)ZHBodyModel *bodyModel;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *titleLab;

@end
