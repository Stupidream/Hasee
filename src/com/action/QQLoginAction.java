package com.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Users;
import com.qq.connect.QQConnectException;
import com.qq.connect.oauth.Oauth;
import com.service.UsersService;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.UserInfoBean;

import java.io.PrintWriter;


@Controller
@RequestMapping("qqAfterLogin.do")
public class QQLoginAction {
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping
	public void qqLogin(HttpServletRequest request,HttpServletResponse response) throws IOException, QQConnectException{
		
		response.setContentType("text/html; charset=utf-8");
		

        try {
            AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);

            String accessToken   = null,
                   openID        = null;


            if (accessTokenObj.getAccessToken().equals("")) {
//                我们的网站被CSRF攻击了或者用户取消了授权
//                做一些数据统计工作
            } else {
                accessToken = accessTokenObj.getAccessToken();

                // 利用获取到的accessToken 去获取当前用的openid -------- start
                OpenID openIDObj =  new OpenID(accessToken);
                openID = openIDObj.getUserOpenID();

                Users users = usersService.qqLogin(openID);

                UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
                UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();
                
                users.setUsername(userInfoBean.getNickname());
                
                request.getSession().setAttribute("users", users);
                
                String referer=(String) request.getSession().getAttribute("referer");
                
                if (referer!=null) {
        			response.sendRedirect(referer);
        			request.getSession().removeAttribute("referer");
        		}else {
        			response.sendRedirect("index.jsp");
        		}
                
            }
        } catch (QQConnectException e) {
        	
        }
	}
}
