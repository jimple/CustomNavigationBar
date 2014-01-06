CustomNavigationBar
===================

一种自定义的导航条


之所以自定义导航条，原因有两个：

1、做同时兼容iOS6与iOS7的导航条时，使用原生导航条总是不顺手。于是想自定义一个，这样兼容iOS6与iOS7时，代码相对统一。另外，因为是自定义的，要做一些特殊的效果时比较容易控制（比如：导航条分成两行，段选择器合并到导航条内）。

2、一个个人原因，3.5寸屏幕的iOS7右滑返回时，导航条不动只是内容页面移动，感觉比较压抑。所以，希望兼顾原生的右滑返回，又可以使导航条在滑动时跟着移动。

**------ 介绍 ------**

1、CustomNaviBarView：自定义的导航条，继承自UIView。

    - 将导航条分成左中右三个区域。默认在左区添加一个返回按钮。
    - 提供创建导航条按钮的方法，可在外部自定义按钮添加到导航条上。
    - 提供外部覆盖视图的方法，可在外部自定义一个视图，覆盖到导航条上。例如：CustomNaviBarSearchController

2、CustomNaviBarSearchController：搜索关键字输入框，可对接覆盖到CustomNaviBarView上。

    - 提供两种导航条上的关键字输入框
        - 由按钮触发，点击按钮后显示输入框，结束后销毁输入框现实按钮。
        - 导航条一直显示输入框。
    - 提供最近输入的关键字列表。

3、CustomNavigationController：继承自UINavigationController。

    - 把系统导航条隐藏，以便显示自定义的导航条。
    - 若想使用自定义导航条，导航控制器需继承自此类。

4、CustomViewController：继承自UIViewController。

    - 封装了接入自定义导航条的方法，把具体业务与自定义导航条分开。
    - 所有需使用自定义导航条的视图控制器可直接继承此类。

**------ 用法 ------**

以Demo为例：

1、AppNavigationController继承自CustomNavigationController。

2、所有视图控制器继承自CustomViewController。

3、一些公共定义被放在GlobalDefine.h中全局引用。

4、修改标题、设置自定义按钮。
  
    [self setNaviBarTitle:@"Title"];     // 设置标题

    [self setNaviBarLeftBtn:nil];       // 若不需要默认的返回按钮，直接赋nil
    
    // 创建一个自定义的按钮，并添加到导航条右侧。
    _btnNaviRight = [CustomNaviBarView createNormalNaviBarBtnByTitle:@"Next" target:self action:@selector(btnNext:)];
    [self setNaviBarRightBtn:_btnNaviRight];


5、覆盖输入框

    - 创建 CustomNaviBarView 对象。
    - 当按钮触发时，通过 showTempSearchCtrl 方法显示输入框。
    - 当输入框需固定在导航条时，通过 showFixationSearchCtrl 方法现实输入框。
    - 通过 setRecentKeyword 方法写入最近使用的关键字数组。
