#### 响应者链条的基本基本概念这里不再赘述了，网上一搜一大堆，只讲讲自己的理解，给你个眼神自己体会。
#### 比较官方的解释：
用户事件发生的时候，UIKit会创建一个事件对象Event Object，该对象包含事件处理所必须的一些信息。然后会将事件对象置于激活的app时间队列。例如触摸事件就是对象一系列触摸信息的包装集。
#### 自己的理解：
根据视图层级链条（addSubView，由UIWindow到上层View）通过hitTest方法（判断触摸点是否在目标视图内）找到目标视图，并递交触摸事件给它处理。
下面写几个由几个例子具体讲
![image.png](https://upload-images.jianshu.io/upload_images/3633609-07614e6a7371fbf0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

首先创建redView、blueView继承自UIView，一白一红，分别在hitTest、pointInside和touchesBegan中添加打印。
1.redView加到self.view上，blueView加到redView上。
2.redView和blueView都加到self.view上覆盖。
3.redView加到self.view上，blueView加到redView上，redView isUserInteractionEnabled = false。
4.redView和blueView都加到self.view上覆盖，redView isUserInteractionEnabled = false。
依次打印结果如下：
![image.png](https://upload-images.jianshu.io/upload_images/3633609-73cf40802645318c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3633609-9d8cc17d972450cb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3633609-761ba2bf08452a6f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3633609-851fdb4b326c6496.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![image.png](https://upload-images.jianshu.io/upload_images/3633609-4d381b62bc790179.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

对比1、4 redView的isUserInteractionEnabled = false ，所以对应view的hitTest返回nil。其所有子视图都无法接收事件了（所以加到UIImageView上的视图默认是都接收不到事件的）。

对比2、4 redView的isUserInteractionEnabled = false，blueView还可以接收事件，因为是redView和blueView无父子视图的关系，所以同级时redView不接收事件与blueView无关。

对比1、2 当redView和blueView同时加到self.view上的时候时，且有重合区域，后加到self.view上的在上面（默认，可调换），优先接收事件。
####总结：
当有触摸行为发生后会从UIWindow开始调用hitTest-> pointInside判断是否在范围内，如果在的话依次调用其子视图的hitTest-> pointInside判断是否在其子视图范围内，如果子视图有重叠则显示在上面的响应，找到目标View（响应手势的View），touchesBegin等方法会回调，且依次执行父视图的touchesBegin等方法（注意这里父视图的手势并不能响应）。



