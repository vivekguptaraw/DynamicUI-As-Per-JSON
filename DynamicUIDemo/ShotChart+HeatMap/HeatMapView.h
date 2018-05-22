

#import <UIKit/UIKit.h>

@interface HeatMapView: UIImageView
@property (nonatomic) BOOL isHomeTeam;
@property (nonatomic) UIColor *teamColor;
-(void)setPointDict:(NSDictionary *)pointDict;
@end

