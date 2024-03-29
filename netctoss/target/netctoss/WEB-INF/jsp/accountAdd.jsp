﻿<%@page contentType="text/html; utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
pageContext.setAttribute("base",request.getContextPath());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>宏晶信息－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="${base}/styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${base}/styles/global_color.css" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/jquery-1.4.3.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/json.js"></script>
        <script language="javascript" type="text/javascript">
                //页面加载完在运行方法
                function checkRepeat(e,e2) {
                    //两次密码需要相同，若不相同则弹出提示
                    if (e.value != e2.value){
                        $("#star").after("<span style='color: red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
                                                "两次密码需要相同</span>");
                        $("#star").attr("disabled",true);
                    }else if ($("#star").next() != null) {
                        $("#star").next().replaceAll("<span>  </span>");
                        $("#btn_save").attr("disabled",false);
                    }
                }

            //保存成功的提示信息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }

            //显示选填的信息项
            function showOptionalInfo(imgObj) {
                var div = document.getElementById("optionalInfo");
                if (div.className == "hide") {
                    div.className = "show";
                    imgObj.src = "${base}/images/hide.png";
                }
                else {
                    div.className = "hide";
                    imgObj.src = "${base}/images/show.png";
                }
            }

            function getBirthDay(e) {
                // //通过身份证号码计算生日
                var str = e.value;
                var birthdayStr = str.substring(6,14);
                var year = birthdayStr.slice(0,4)+"-"+birthdayStr.slice(5,6)+"-"
                            +birthdayStr.slice(6);
                $(".readonly").val(year);
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="${base}/images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">
            <ul id="menu">
                <li><a href="${base}/index.html" class="index_off"></a></li>
                <li><a href="${base}/role/role_list.html" class="role_off"></a></li>
                <li><a href="${base}/admin/admin_list.html" class="admin_off"></a></li>
                <li><a href="${base}/fee/fee_list.html" class="fee_off"></a></li>
                <li><a href="${base}/account/account_list.html" class="account_on"></a></li>
                <li><a href="${base}/service/service_list.html" class="service_off"></a></li>
                <li><a href="${base}/bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="${base}/report/report_list.html" class="report_off"></a></li>
                <li><a href="${base}/user/user_info.html" class="information_off"></a></li>
                <li><a href="${base}/user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">       
            <!--保存成功或者失败的提示消息-->     
            <div id="save_result_info" class="save_fail">保存失败，该身份证已经开通过账务账号！</div>
            <form action="${base}/addAcc.acc" method="" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input type="text" name="realName" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">20长度以内的汉字、字母和数字的组合</div>
                </div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" name="idcardNo" onblur="getBirthDay(this)" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">正确的身份证号码格式</div>
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" name="loginName" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input id="loginPasswd" type="password" name="loginPasswd" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input id="repeatPasswd" type="password" onblur="checkRepeat(this,document.getElementById('loginPasswd'))" value=""/>
                    <span class="required" id="star">*</span>
                    <div class="validate_msg_long"></div>
                </div>
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="telephone"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium">正确的电话号码格式：手机或固话</div>
                </div>                
                <!--可选项-->
                <div class="text_info clearfix"><span>可选项：</span></div>
                <div class="input_info">
                    <img src="${base}/images/show.png" alt="展开" onclick="showOptionalInfo(this);" />
                </div>
                <div id="optionalInfo" class="hide">
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input type="text" name="recommenderId"/>
                        <div class="validate_msg_long">正确的身份证号码格式</div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" name="birthdate" value="" readonly class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" name="email"/>
                        <div class="validate_msg_tiny">50长度以内，合法的 Email 格式</div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select name="occupation">
                            <option value="0">干部</option>
                            <option value="1">学生</option>
                            <option value="2">技术人员</option>
                            <option value="3">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                        <input type="radio" name="gender" checked="checked" id="female" value="女" />
                        <label for="female">女</label>
                        <input type="radio" name="gender" id="male" value="男"/>
                        <label for="male">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" name="mailaddress"/>
                        <div class="validate_msg_tiny">50长度以内</div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input type="text" name="zipcode"/>
                        <div class="validate_msg_long">6位数字</div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input type="text" name="qq"/>
                        <div class="validate_msg_long">5到13位数字</div>
                    </div>                
                </div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="submit" value="保存" id="btn_save" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <span>[地址：合肥市高新区云飞路与文曲路交口创新产业园二期F4栋12层]</span>
            <br />
            <span>版权所有&copy;合肥宏晶信息科技有限公司 </span>
        </div>
    </body>
</html>
