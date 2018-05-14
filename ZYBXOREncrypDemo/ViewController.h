//
//  ViewController.h
//  ZYBXOREncrypDemo
//
//  Created by Rhino on 2018/5/14.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *encrypBtn;
- (IBAction)encrypBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *decryptBtn;
- (IBAction)decryptBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

