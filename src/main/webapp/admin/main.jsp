<%--
  Created by IntelliJ IDEA.
  User: Liwei
  Date: 2016/8/1
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎登录</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.5/themes/icon.css">


</head>
<body class="easyui-layout">
    ${currentUser.userName}
    <%--
    请参考 layout 部分的文档：
    region string 定义布局面板位置，可用的值有：north, south, east, west, center。
    border boolean 为true时显示布局面板边框。
      split boolean 为true时用户可以通过分割栏改变面板大小。
      --%>
    <div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
        <strong>Java 博客后台管理系统</strong>

        <div align="right">
            <span>欢迎您：<strong>${currentUser.nickName}。</span></strong>
        </div>

    </div>
    <div data-options="region:'west',split:true,title:'导航菜单'" style="width:150px;">
        <%-- easyui 手风琴（Accordion）组件 base 部分 --%>
        <%-- fit boolean 如果设置为true，分类容器大小将自适应父容器。 false  --%>
        <div class="easyui-accordion" style="width:500px;height:300px;" data-options="fit:true">
            <div title="常用操作" data-options="iconCls:'icon-often-oper'" style="overflow:auto;padding:10px;">

            </div>
            <div title="博客管理" data-options="iconCls:'icon-blog-manager'" style="overflow:auto;padding:10px;">
                <a href="#" onclick="javascript:openTab('写博客','/admin/writeBlog.jsp','icon-write-blog')" class="easyui-linkbutton" data-options="iconCls:'icon-write-blog'">写博客</a>
                <a href="#" onclick="javascript:openTab('博客信息管理','/admin/blogManage.jsp','icon-blog-manager')" class="easyui-linkbutton" data-options="iconCls:'icon-blog-manager'">博客信息管理</a>
            </div>
            <div title="博客类别管理" data-options="iconCls:'icon-blog-type-manager'" style="overflow:auto;padding:10px;">
                <a href="#" onclick="javascript:openTab('博客类别管理','/admin/blogTypeManage.jsp','icon-blog-type-manager')" class="easyui-linkbutton" data-options="iconCls:'icon-blog-type-manager'">博客类别管理</a>
            </div>
            <div title="评论管理" data-options="iconCls:'icon-comment-manager'" style="overflow:auto;padding:10px;">
                <a href="#" onclick="javascript:openTab('评论审核','/admin/commentReview.jsp.jsp','icon-comment-review')"
                   class="easyui-linkbutton"
                   data-options="iconCls:'icon-comment-review'">评论审核</a>
                <a href="#" onclick="javascript:openTab('评论信息管理','/admin/commentManage.jsp','icon-comment-manager')" class="easyui-linkbutton" data-options="iconCls:'icon-comment-manager'">评论信息管理</a>
            </div>
            <div title="个人信息管理" data-options="iconCls:'icon-blogger-manager'" style="overflow:auto;padding:10px;">
                <a href="#" onclick="javascript:openTab('修改个人信息','/admin/modifyInfo.jsp','icon-blogger-manager')" class="easyui-linkbutton" data-options="iconCls:'icon-blogger-manager'">修改个人信息</a>
            </div>
            <div title="系统管理" data-options="iconCls:'icon-link-manager'" style="overflow:auto;padding:10px;">
                <a href="#" onclick="javascript:openTab('友情链接管理','/admin/linkManager.jsp','icon-link-manager')"
                   class="easyui-linkbutton"
                   data-options="iconCls:'icon-link-manager'">友情链接管理</a>
                <a href="#" onclick="javascript:openTab('修改密码','/admin/modifyPassword.jsp','icon-modify-password')"
                   class="easyui-linkbutton"
                   data-options="iconCls:'icon-modify-password'">修改密码</a>
                <a href="#" onclick="javascript:openTab('刷新系统缓存','/admin/reflashCached.jsp','icon-reflash-cached')"
                   class="easyui-linkbutton"
                   data-options="iconCls:'icon-reflash-cached'">刷新系统缓存</a>
                <a href="#" onclick="javascript:openTab('安全退出','/admin/logout.jsp','icon-logout')"
                   class="easyui-linkbutton"
                   data-options="iconCls:'icon-logout'">安全退出</a>

            </div>
        </div>

    </div>
    <%--<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>--%>
    <div align="center" data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">
        liweipower2015@gmail.com
    </div>

    <%-- 布局控件 --%>
    <div data-options="region:'center',title:'欢迎使用'">
        <%-- 选项卡控件 --%>
        <div id="tabs" class="easyui-tabs" data-options="fit:true">

            <%-- 自己加的默认显示 --%>
            <div title="首页" data-options="iconCls:'icon-homepage'">
                <div align="center" style="padding-top: 100px">
                    <img src="${pageContext.request.contextPath}/static/jquery-easyui-1.5/themes/icons/download_to_laptop_128px_1187378_easyicon.net.png">
                </div>
            </div>

        </div>
    </div>

    


    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
        /**
         *
         * @param text 面板的名称
         * @param url
         * @param iconCls 图标
         */
        function openTab(text,url,iconCls){
            if($("#tabs").tabs("exists",text)){
                $("#tabs").tabs("select",text);
            }else {
                var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
                $('#tabs').tabs('add',{
                    title: text,
                    content: content,
                    closable: true,
                    iconCls: iconCls
                });

            }
        }
    </script>
</body>
</html>
