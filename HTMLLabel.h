//
//  HTMLLabel.h
//  Created by Narendra Verma
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface HTMLLabel : UILabel
@property (assign, nonatomic) IBInspectable int boldFontSize;
@property (assign, nonatomic) IBInspectable NSString * boldFontName;
@property (assign, nonatomic) IBInspectable int regularFontSize;
@property (assign, nonatomic) IBInspectable NSString * regularFontName;
@end