//
//  ViewController.m
//  ZYBXOREncrypDemo
//
//  Created by Rhino on 2018/5/14.
//

#import "ViewController.h"
#import "ZYBXOREncryptUtil.h"
@interface ViewController ()
@property(nonatomic,strong)NSDictionary *testDict;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}
-(void)initData{
    self.testDict=@{
                    @"token":@"ABCDEFGHIGKLMNOPQRSTUVWXYZ",
                    @"timeStr":@"1236892346",
                    @"payload":@{
                            @"name":@"周润发",
                            @"pwd":@"123456",
                            @"phone":@"15833281912",
                            @"sex":@(0),
                            }
                    };
    self.textView.text=[NSString stringWithFormat:@"%@",self.testDict];
}

- (IBAction)encrypBtn:(id)sender {
    NSString *jsonStr=[NSString stringWithFormat:@"%@",self.testDict];
   NSString *encrypStr=[[ZYBXOREncryptUtil shareInstance] xor_encrypWithString:jsonStr];
    self.textView.text=encrypStr;
}
- (IBAction)decryptBtn:(id)sender {
    NSString *str=[[ZYBXOREncryptUtil shareInstance] xor_decryptWithString:self.textView.text];
    self.textView.text=str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
