//
//	ZHLeftTableViewModel.m
//
//	Create by c ma on 24/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZHLeftTableViewModel.h"

NSString *const kZHLeftTableViewModelAbbreviation = @"Abbreviation";
NSString *const kZHLeftTableViewModelAlert = @"Alert";
NSString *const kZHLeftTableViewModelBuyCount = @"BuyCount";
NSString *const kZHLeftTableViewModelCountryImg = @"CountryImg";
NSString *const kZHLeftTableViewModelCountryName = @"CountryName";
NSString *const kZHLeftTableViewModelDiscount = @"Discount";
NSString *const kZHLeftTableViewModelDomesticPrice = @"DomesticPrice";
NSString *const kZHLeftTableViewModelForeignPrice = @"ForeignPrice";
NSString *const kZHLeftTableViewModelFormetDate = @"FormetDate";
NSString *const kZHLeftTableViewModelGoodsId = @"GoodsId";
NSString *const kZHLeftTableViewModelGoodsIntro = @"GoodsIntro";
NSString *const kZHLeftTableViewModelImgView = @"ImgView";
NSString *const kZHLeftTableViewModelOtherPrice = @"OtherPrice";
NSString *const kZHLeftTableViewModelPrice = @"Price";
NSString *const kZHLeftTableViewModelRestTime = @"RestTime";
NSString *const kZHLeftTableViewModelStock = @"Stock";
NSString *const kZHLeftTableViewModelTitle = @"Title";

@interface ZHLeftTableViewModel ()
@end
@implementation ZHLeftTableViewModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kZHLeftTableViewModelAbbreviation] isKindOfClass:[NSNull class]]){
		self.abbreviation = dictionary[kZHLeftTableViewModelAbbreviation];
	}	
	if(![dictionary[kZHLeftTableViewModelAlert] isKindOfClass:[NSNull class]]){
		self.alert = dictionary[kZHLeftTableViewModelAlert];
	}	
	if(![dictionary[kZHLeftTableViewModelBuyCount] isKindOfClass:[NSNull class]]){
		self.buyCount = dictionary[kZHLeftTableViewModelBuyCount];
	}	
	if(![dictionary[kZHLeftTableViewModelCountryImg] isKindOfClass:[NSNull class]]){
		self.countryImg = dictionary[kZHLeftTableViewModelCountryImg];
	}	
	if(![dictionary[kZHLeftTableViewModelCountryName] isKindOfClass:[NSNull class]]){
		self.countryName = dictionary[kZHLeftTableViewModelCountryName];
	}	
	if(![dictionary[kZHLeftTableViewModelDiscount] isKindOfClass:[NSNull class]]){
		self.discount = dictionary[kZHLeftTableViewModelDiscount];
	}	
	if(![dictionary[kZHLeftTableViewModelDomesticPrice] isKindOfClass:[NSNull class]]){
		self.domesticPrice = dictionary[kZHLeftTableViewModelDomesticPrice];
	}	
	if(![dictionary[kZHLeftTableViewModelForeignPrice] isKindOfClass:[NSNull class]]){
		self.foreignPrice = dictionary[kZHLeftTableViewModelForeignPrice];
	}	
	if(![dictionary[kZHLeftTableViewModelFormetDate] isKindOfClass:[NSNull class]]){
		self.formetDate = dictionary[kZHLeftTableViewModelFormetDate];
	}	
	if(![dictionary[kZHLeftTableViewModelGoodsId] isKindOfClass:[NSNull class]]){
		self.goodsId = dictionary[kZHLeftTableViewModelGoodsId];
	}	
	if(![dictionary[kZHLeftTableViewModelGoodsIntro] isKindOfClass:[NSNull class]]){
		self.goodsIntro = dictionary[kZHLeftTableViewModelGoodsIntro];
	}	
	if(![dictionary[kZHLeftTableViewModelImgView] isKindOfClass:[NSNull class]]){
		self.imgView = dictionary[kZHLeftTableViewModelImgView];
	}	
	if(![dictionary[kZHLeftTableViewModelOtherPrice] isKindOfClass:[NSNull class]]){
		self.otherPrice = dictionary[kZHLeftTableViewModelOtherPrice];
	}	
	if(![dictionary[kZHLeftTableViewModelPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kZHLeftTableViewModelPrice];
	}	
	if(![dictionary[kZHLeftTableViewModelRestTime] isKindOfClass:[NSNull class]]){
		self.restTime = dictionary[kZHLeftTableViewModelRestTime];
	}	
	if(![dictionary[kZHLeftTableViewModelStock] isKindOfClass:[NSNull class]]){
		self.stock = dictionary[kZHLeftTableViewModelStock];
	}	
	if(![dictionary[kZHLeftTableViewModelTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kZHLeftTableViewModelTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.abbreviation != nil){
		dictionary[kZHLeftTableViewModelAbbreviation] = self.abbreviation;
	}
	if(self.alert != nil){
		dictionary[kZHLeftTableViewModelAlert] = self.alert;
	}
	if(self.buyCount != nil){
		dictionary[kZHLeftTableViewModelBuyCount] = self.buyCount;
	}
	if(self.countryImg != nil){
		dictionary[kZHLeftTableViewModelCountryImg] = self.countryImg;
	}
	if(self.countryName != nil){
		dictionary[kZHLeftTableViewModelCountryName] = self.countryName;
	}
	if(self.discount != nil){
		dictionary[kZHLeftTableViewModelDiscount] = self.discount;
	}
	if(self.domesticPrice != nil){
		dictionary[kZHLeftTableViewModelDomesticPrice] = self.domesticPrice;
	}
	if(self.foreignPrice != nil){
		dictionary[kZHLeftTableViewModelForeignPrice] = self.foreignPrice;
	}
	if(self.formetDate != nil){
		dictionary[kZHLeftTableViewModelFormetDate] = self.formetDate;
	}
	if(self.goodsId != nil){
		dictionary[kZHLeftTableViewModelGoodsId] = self.goodsId;
	}
	if(self.goodsIntro != nil){
		dictionary[kZHLeftTableViewModelGoodsIntro] = self.goodsIntro;
	}
	if(self.imgView != nil){
		dictionary[kZHLeftTableViewModelImgView] = self.imgView;
	}
	if(self.otherPrice != nil){
		dictionary[kZHLeftTableViewModelOtherPrice] = self.otherPrice;
	}
	if(self.price != nil){
		dictionary[kZHLeftTableViewModelPrice] = self.price;
	}
	if(self.restTime != nil){
		dictionary[kZHLeftTableViewModelRestTime] = self.restTime;
	}
	if(self.stock != nil){
		dictionary[kZHLeftTableViewModelStock] = self.stock;
	}
	if(self.title != nil){
		dictionary[kZHLeftTableViewModelTitle] = self.title;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.abbreviation != nil){
		[aCoder encodeObject:self.abbreviation forKey:kZHLeftTableViewModelAbbreviation];
	}
	if(self.alert != nil){
		[aCoder encodeObject:self.alert forKey:kZHLeftTableViewModelAlert];
	}
	if(self.buyCount != nil){
		[aCoder encodeObject:self.buyCount forKey:kZHLeftTableViewModelBuyCount];
	}
	if(self.countryImg != nil){
		[aCoder encodeObject:self.countryImg forKey:kZHLeftTableViewModelCountryImg];
	}
	if(self.countryName != nil){
		[aCoder encodeObject:self.countryName forKey:kZHLeftTableViewModelCountryName];
	}
	if(self.discount != nil){
		[aCoder encodeObject:self.discount forKey:kZHLeftTableViewModelDiscount];
	}
	if(self.domesticPrice != nil){
		[aCoder encodeObject:self.domesticPrice forKey:kZHLeftTableViewModelDomesticPrice];
	}
	if(self.foreignPrice != nil){
		[aCoder encodeObject:self.foreignPrice forKey:kZHLeftTableViewModelForeignPrice];
	}
	if(self.formetDate != nil){
		[aCoder encodeObject:self.formetDate forKey:kZHLeftTableViewModelFormetDate];
	}
	if(self.goodsId != nil){
		[aCoder encodeObject:self.goodsId forKey:kZHLeftTableViewModelGoodsId];
	}
	if(self.goodsIntro != nil){
		[aCoder encodeObject:self.goodsIntro forKey:kZHLeftTableViewModelGoodsIntro];
	}
	if(self.imgView != nil){
		[aCoder encodeObject:self.imgView forKey:kZHLeftTableViewModelImgView];
	}
	if(self.otherPrice != nil){
		[aCoder encodeObject:self.otherPrice forKey:kZHLeftTableViewModelOtherPrice];
	}
	if(self.price != nil){
		[aCoder encodeObject:self.price forKey:kZHLeftTableViewModelPrice];
	}
	if(self.restTime != nil){
		[aCoder encodeObject:self.restTime forKey:kZHLeftTableViewModelRestTime];
	}
	if(self.stock != nil){
		[aCoder encodeObject:self.stock forKey:kZHLeftTableViewModelStock];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kZHLeftTableViewModelTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.abbreviation = [aDecoder decodeObjectForKey:kZHLeftTableViewModelAbbreviation];
	self.alert = [aDecoder decodeObjectForKey:kZHLeftTableViewModelAlert];
	self.buyCount = [aDecoder decodeObjectForKey:kZHLeftTableViewModelBuyCount];
	self.countryImg = [aDecoder decodeObjectForKey:kZHLeftTableViewModelCountryImg];
	self.countryName = [aDecoder decodeObjectForKey:kZHLeftTableViewModelCountryName];
	self.discount = [aDecoder decodeObjectForKey:kZHLeftTableViewModelDiscount];
	self.domesticPrice = [aDecoder decodeObjectForKey:kZHLeftTableViewModelDomesticPrice];
	self.foreignPrice = [aDecoder decodeObjectForKey:kZHLeftTableViewModelForeignPrice];
	self.formetDate = [aDecoder decodeObjectForKey:kZHLeftTableViewModelFormetDate];
	self.goodsId = [aDecoder decodeObjectForKey:kZHLeftTableViewModelGoodsId];
	self.goodsIntro = [aDecoder decodeObjectForKey:kZHLeftTableViewModelGoodsIntro];
	self.imgView = [aDecoder decodeObjectForKey:kZHLeftTableViewModelImgView];
	self.otherPrice = [aDecoder decodeObjectForKey:kZHLeftTableViewModelOtherPrice];
	self.price = [aDecoder decodeObjectForKey:kZHLeftTableViewModelPrice];
	self.restTime = [aDecoder decodeObjectForKey:kZHLeftTableViewModelRestTime];
	self.stock = [aDecoder decodeObjectForKey:kZHLeftTableViewModelStock];
	self.title = [aDecoder decodeObjectForKey:kZHLeftTableViewModelTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ZHLeftTableViewModel *copy = [ZHLeftTableViewModel new];

	copy.abbreviation = [self.abbreviation copyWithZone:zone];
	copy.alert = [self.alert copyWithZone:zone];
	copy.buyCount = [self.buyCount copyWithZone:zone];
	copy.countryImg = [self.countryImg copyWithZone:zone];
	copy.countryName = [self.countryName copyWithZone:zone];
	copy.discount = [self.discount copyWithZone:zone];
	copy.domesticPrice = [self.domesticPrice copyWithZone:zone];
	copy.foreignPrice = [self.foreignPrice copyWithZone:zone];
	copy.formetDate = [self.formetDate copyWithZone:zone];
	copy.goodsId = [self.goodsId copyWithZone:zone];
	copy.goodsIntro = [self.goodsIntro copyWithZone:zone];
	copy.imgView = [self.imgView copyWithZone:zone];
	copy.otherPrice = [self.otherPrice copyWithZone:zone];
	copy.price = [self.price copyWithZone:zone];
	copy.restTime = [self.restTime copyWithZone:zone];
	copy.stock = [self.stock copyWithZone:zone];
	copy.title = [self.title copyWithZone:zone];

	return copy;
}
@end