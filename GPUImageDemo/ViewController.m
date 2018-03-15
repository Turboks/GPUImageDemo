//
//  ViewController.m
//  GPUImageDemo
//
//  Created by 爱尚家 on 2018/3/15.
//  Copyright © 2018年 Mr_Kong. All rights reserved.
//

#import "ViewController.h"
#import <GPUImage/GPUImage.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableview;
@property (nonatomic ,strong) UIImageView * imageView;
@property (nonatomic ,strong) NSMutableArray * array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"demo"];
    _array = [[NSMutableArray alloc] initWithObjects:@"黑白",@"怀旧",@"高斯模糊", @"锐化",@"色彩替换",@"灰色",@"原图",nil];
    //    //加载新的图片
    _imageView = [[UIImageView alloc] initWithImage:image];
    _imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    [self.view addSubview:_imageView];
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, self.view.bounds.size.height-200) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_array[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *image = [UIImage imageNamed:@"demo"];
    UIImage *newimage = [UIImage imageNamed:@"demo"];
    if (indexPath.row == 0) {
        //使用黑白滤镜
        GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
        //设置要渲染的区域
        [disFilter forceProcessingAtSize:image.size];
        [disFilter useNextFrameForImageCapture];
        //获取数据源
        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
        //添加滤镜
        [pic addTarget:disFilter];
        //开始渲染
        [pic processImage];
        //获取渲染后的图片
        newimage = [disFilter imageFromCurrentFramebuffer];
    }else if (indexPath.row == 1){
        //使用怀旧滤镜
        GPUImageSepiaFilter *disFilter = [[GPUImageSepiaFilter alloc] init];
        //设置要渲染的区域
        [disFilter forceProcessingAtSize:image.size];
        [disFilter useNextFrameForImageCapture];
        //获取数据源
        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
        //添加滤镜
        [pic addTarget:disFilter];
        //开始渲染
        [pic processImage];
        //获取渲染后的图片
        newimage = [disFilter imageFromCurrentFramebuffer];
    }else if (indexPath.row == 2){
        //使用高斯模糊滤镜
        GPUImageGaussianBlurFilter *disFilter = [[GPUImageGaussianBlurFilter alloc] init];
        //设置要渲染的区域
        [disFilter forceProcessingAtSize:image.size];
        [disFilter useNextFrameForImageCapture];
        //获取数据源
        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
        //添加滤镜
        [pic addTarget:disFilter];
        //开始渲染
        [pic processImage];
        //获取渲染后的图片
        newimage = [disFilter imageFromCurrentFramebuffer];
    }else if (indexPath.row == 3){
        //使用锐化滤镜
        GPUImageSharpenFilter *disFilter = [[GPUImageSharpenFilter alloc] init];
        //设置要渲染的区域
        [disFilter forceProcessingAtSize:image.size];
        [disFilter useNextFrameForImageCapture];
        //获取数据源
        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
        //添加滤镜
        [pic addTarget:disFilter];
        //开始渲染
        [pic processImage];
        //获取渲染后的图片
        newimage = [disFilter imageFromCurrentFramebuffer];
    }else if (indexPath.row == 4){
        //使用色彩替换滤镜
        GPUImageFalseColorFilter *disFilter = [[GPUImageFalseColorFilter alloc] init];
        //设置要渲染的区域
        [disFilter forceProcessingAtSize:image.size];
        [disFilter useNextFrameForImageCapture];
        //获取数据源
        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
        //添加滤镜
        [pic addTarget:disFilter];
        //开始渲染
        [pic processImage];
        //获取渲染后的图片
        newimage = [disFilter imageFromCurrentFramebuffer];
    }else if (indexPath.row == 5){
        //使用灰色滤镜
        GPUImageGrayscaleFilter *disFilter = [[GPUImageGrayscaleFilter alloc] init];
        //设置要渲染的区域
        [disFilter forceProcessingAtSize:image.size];
        [disFilter useNextFrameForImageCapture];
        //获取数据源
        GPUImagePicture *pic = [[GPUImagePicture alloc] initWithImage:image];
        //添加滤镜
        [pic addTarget:disFilter];
        //开始渲染
        [pic processImage];
        //获取渲染后的图片
        newimage = [disFilter imageFromCurrentFramebuffer];
    }
    _imageView.image = newimage;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
