//
//  StaticViewController.m
//  StaticVC
//
//  Created by 李雨龙 on 2020/5/12.
//  Copyright © 2020 李雨龙. All rights reserved.
//

#import "StaticViewController.h"

@interface StaticViewController ()

@property (weak, nonatomic) IBOutlet UILabel *userIdView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *msgView;
@end

@implementation StaticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIImage *image = [UIImage imageNamed:@"img"];
    if (!image) {
        image = [UIImage imageNamed:@"StaticVC.framework/img"];
        self.iconImageView.image = image;
    }
    
    NSDictionary * params = [self performSelector:@selector(parameters)];
    NSString * userId =  _parameters[@"userId"];
    NSString * msg = _parameters[@"msg"];
    
    _userIdView.text =  userId;
    _msgView.text = msg;
    
    int type = 0;
    if([UIDevice currentDevice].userInterfaceIdiom
       == UIUserInterfaceIdiomPad ){
        type = UIAlertControllerStyleAlert;
    }else{
        type = UIAlertControllerStyleActionSheet;
    }
    UIAlertController * alertInfo = [UIAlertController
                                     alertControllerWithTitle:@"Title"
                                     message:params.description
                                     preferredStyle:type];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"确定" style:0 handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertInfo addAction:cancelAction];
    
    [self presentViewController:alertInfo
                       animated:YES
                     completion:^{
        
    }];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
