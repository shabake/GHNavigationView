# GHNavigationView

>快速自定义导航view

通过代理自定义导航view

![](https://oscimg.oschina.net/oscnet/up-6b89a276df1f108cc8713899cc7ba1744e3.png)


使用方法

1.遵守协议`NavigationViewDelegate、NavigationViewDataSource`

2.设置代理

```
view.delegate = self;
view.dataSource  = self;

```
3.实现代理方法

dataSource必须实现的两个方法

```

/**
 *  返回总长度一共有多少个
 *  @param navigationView navigationView
 *  @param section 是第几组
 *  @return 返回长度
 */

- (NSInteger)navigationView:(NavigationView *)navigationView numberOfRowsInSection:(NSInteger)section;
```

```
/**
 *  返回view
 *  @param navigationView navigationView
 *  @param indexPath 是第几组的第几行
 *  @return view
 */

- (UIView *)navigationView:(NavigationView *)navigationView viewForRowAtIndexPath:(NSIndexPath *)indexPath;

```

delegate的代理方法

点击事件

```
- (void)navigationView:(NavigationView *)navigationView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

```