# solo-skin-emiya

[原皮肤](https://github.com/zjhch123/solo-skin-amaze)停止继续维护, 转而维护这个库

## 概述

- 作者: zjhch123
- 版本: 1.8.0
- 对应solo版本: 4.3.1

## 预览

<img src="https://github.com/zjhch123/solo-skin-emiya/blob/master/preview@2x.png" alt="preview" width="600">

[在线预览](https://blog.hduzplus.xyz?from=github_page)

## 各页面链接

- 标签集合页: /tags.html
- 分类页: /category.html
- 存档页: /archives.html
- 友情链接: /links.html

## 安装方式

### 直接下载方式

在本页面下载。点击"Download ZIP"下载，将主题文件夹改名为emiya，放入solo的skins目录下即可在管理后台看到此主题。

### git clone方式

在solo的skins目录下使用命令即可安装皮肤到本地

```shell
git clone https://github.com/zjhch123/solo-skin-emiya emiya
```

[历史版本下载](https://github.com/zjhch123/solo-skin-emiya/releases)

## 支持的模板变量

1. `headerBgImage` - 可用于配置自定义的头图, 例如: `headerBgImage=http://www.baidu.com` ([issue#33](https://github.com/zjhch123/solo-skin-emiya/issues/33))

## 致谢

1. 感谢[原皮肤amaze](https://github.com/spiritree/typecho-theme-amaze)作者[spiritree](https://github.com/spiritree)制作的精美皮肤
2. 感谢[Vanessa219](https://github.com/Vanessa219)提供的开发环境
3. 感谢[88250](https://github.com/88250)制作的[小而美的博客系统solo](https://github.com/b3log/solo)
4. 感谢[AlgerFan](https://github.com/AlgerFan)制作了返回顶部功能以及修复了一些bug

## Changelog

<details>

### 1.0.0

1. 重构css/scss、js，重写部分css样式与js逻辑，删除不必要的js逻辑
2. 重构模板文件，模板更通用化
3. 遵循社区皮肤开发规范

### 1.0.1

1. 增加移动端字体大小与行间距

### 1.1.0

1. 增加文章页面分享功能 - 微博、QQ空间、微信
2. 更换头图为更清晰的图片

### 1.1.1

1. 优化在小屏手机下的样式

### 1.1.2

1. 修复文章标题在小屏手机下不换行的bug
2. 增加打zip包脚本

### 1.1.3

1. 优化在小屏手机下的样式

### 1.1.4

1. 评论模块 - 优化在小屏手机下的样式

### 1.1.5

1. 修复代码块过长导致的溢出问题

### 1.1.6

1. 优化部分样式
2. 评论mouseover事件取消，改为click显示高亮

### 1.2.0

1. 增加返回顶部功能 （感谢[AlgerFan](https://github.com/AlgerFan)
2. 增加分类页面，链接: `/category.html`
3. 增加文章目录
4. 移除默认添加的导航栏
5. 修复部分样式问题

### 1.2.1

1. 修复目录样式问题

### 1.2.2

1. 修复存档页面当某个月份文章数为0时的显示问题

### 1.2.3

1. 适配solo 3.6.7
2. 优化: 分类页面内各个分类链接在当前页面打开

### 1.3.0

1. 适配solo 3.8.0, 使用社区静态分析组件、vcomment组件
2. 优化侧边栏，删除 评论最多/访问最多 文章

### 1.3.1

1. 优化文章目录展示逻辑

### 1.3.2

1. 修复因缺失模板变量导致的问题
2. 隐藏侧栏中count为0的archive
3. 重新压缩js/css

### 1.3.3

1. 修复某些情况下文章目录会消失的问题

### 1.4.0

1. 适配solo 3.9.0
2. 重构js代码，使用ES6方式构建

### 1.5.0

1. 适配pjax, 重构页面布局与样式
2. 实现全站pjax, 头部/内容区左侧会随着页面不同而刷新，侧栏保持固定

### 1.5.1

1. 支持公告栏配置

### 1.6.0

1. 适配solo 4.0.0
2. 尝试修复在lute模式下文章目录不显示的问题

### 1.7.0

1. 适配solo 4.1.0
2. 增加自定义模板变量 `headerBgImage` 用以配置自定义头图([issue#33](https://github.com/zjhch123/solo-skin-emiya/issues/33))

### 1.8.0

1. 适配solo 4.3.1
2. 修复点击评论按钮博客title可能会改变的问题

</details>
