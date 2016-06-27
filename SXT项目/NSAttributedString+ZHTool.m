//
//  NSAttributedString+ZHTool.m
//  SXT项目
//
//  Created by ma c on 16/6/27.
//  Copyright © 2016年 阿里巴巴. All rights reserved.
//

#import "NSAttributedString+ZHTool.h"

@implementation NSAttributedString (ZHTool)
+(NSMutableAttributedString *)mixTwoAttributedStrings:(NSString *)str1 withString:(NSString *)str2
{
    NSDictionary *dic = @{
                          NSFontAttributeName: [UIFont systemFontOfSize:17],
                          NSForegroundColorAttributeName: RBG(250, 80, 0)
                          };
    NSDictionary *dic1 = @{
                           NSFontAttributeName: [UIFont systemFontOfSize:12],
                           NSForegroundColorAttributeName: RBG(150, 150, 150)
                           };
    //(￥123 ￥123)
    NSString *str = [NSString stringWithFormat:@"￥%@ %@  ",str1,str2];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    [attributedString addAttributes:dic range:NSMakeRange(0, str1.length+1)];
    [attributedString addAttributes:dic1 range:NSMakeRange(str1.length+2, str2.length)];
    //添加中间的删除线
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(str1.length+2, str1.length+3)];
    //添加删除线的颜色
    [attributedString addAttribute:NSStrikethroughColorAttributeName value:RBG(150, 150, 150) range:NSMakeRange(str1.length+2, str1.length+3)];
    
    return attributedString ;
}
@end
