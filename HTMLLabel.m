//
//  HTMLLabel.m
//  Created by Narendra Verma
//

#import "HTMLLabel.h"

@implementation HTMLLabel

- (void)setText:(NSString *)text {
    [super setAttributedText:[self getHTMLAttributedValue:text]];
}

-(NSAttributedString *)getHTMLAttributedValue:(NSString *)text {
    NSMutableAttributedString * attributedDescription = [[NSMutableAttributedString alloc]
                                                         initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding]
                                                         options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType}documentAttributes:nil
                                                         error:nil];
    [attributedDescription enumerateAttribute:NSFontAttributeName
                                      inRange:NSMakeRange(0, attributedDescription.length)
                                      options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                                   usingBlock:^(id value, NSRange range, BOOL *stop) {
                                       UIFont* currentFont = value;
                                       UIFont *replacementFont = nil;
                                       if ([currentFont.fontName rangeOfString:@"bold"
                                                                       options:NSCaseInsensitiveSearch].location != NSNotFound) {
                                           replacementFont = [UIFont fontWithName:self.boldFontName
                                                                             size:self.regularFontSize ? : 16.0];
                                       }else {
                                           replacementFont = [UIFont fontWithName:self.regularFontName
                                                                             size:self.boldFontSize ? : 18.0];
                                       }
                                       [attributedDescription addAttribute:NSFontAttributeName
                                                                     value:replacementFont
                                                                     range:range];
                                       NSMutableParagraphStyle * paragraph = [NSMutableParagraphStyle new];
                                       paragraph.alignment = self.textAlignment;
                                       [attributedDescription addAttributes:@{NSForegroundColorAttributeName : self.textColor,
                                                                              NSParagraphStyleAttributeName : paragraph}
                                                                      range:NSMakeRange(0, attributedDescription.string.length)];
                                   }];
    return attributedDescription;
}

@end
