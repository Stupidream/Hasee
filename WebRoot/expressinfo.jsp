<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet" type="text/css" href="css/orderdetail.css"/>
<title></title>
</head>
<body>

<div class="expressinfo">
	<c:choose>
		<c:when test="${odetailMap.msg==1 }">
			<div class="pdCompany">
				<img src="${odetailMap.companyLogo }">
				<span>${odetailMap.company }</span>
				<label>${odetailMap.epxnum }</label>
			</div>
			<table class="pdInfo">
				<tr>
					<th class="row1">时间</th>
					<th style="padding-left:20px; ">物流跟踪</th>
				</tr>
				<c:forEach items="${odetailMap.PDinfo }" varStatus="vs" var="PDinfo">
					
					<c:choose>
						<c:when test="${odetailMap.status=='1' && odetailMap.state== '3' }">
						
							<c:if test="${vs.count==1 }">
								<tr class="statusColor">
									<td>${PDinfo.time }</th>
									<td class="status_end">${PDinfo.desc }</th>
								</tr>
							</c:if>
							<c:if test="${vs.count==odetailMap.PDinfoSize }">
								<tr>
									<td>${PDinfo.time }</th>
									<td class="status_start">${PDinfo.desc }</th>
								</tr>
							</c:if>
							<c:if test="${vs.count!=odetailMap.PDinfoSize&&vs.count!=1 }">
								<tr>
									<td>${PDinfo.time }</th>
									<td class="status">${PDinfo.desc }</th>
								</tr>
							</c:if>
							
						</c:when>
						<c:otherwise>
							<c:if test="${vs.count==1 }">
								<tr class="NowstatusColor">
									<td>${PDinfo.time }</th>
									<td class="status_now">${PDinfo.desc }</th>
								</tr>
							</c:if>
							<c:if test="${vs.count==odetailMap.PDinfoSize }">
								<tr>
									<td>${PDinfo.time }</th>
									<td class="status_start">${PDinfo.desc }</th>
								</tr>
							</c:if>
							<c:if test="${vs.count!=odetailMap.PDinfoSize&&vs.count!=1 }">
								<tr>
									<td>${PDinfo.time }</th>
									<td class="status">${PDinfo.desc }</th>
								</tr>
							</c:if>
						</c:otherwise>
						
					</c:choose>
				
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<p>暂无物流信息</p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>