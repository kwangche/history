<!-- #include virtual="/include/goto_https.asp" -->
<!-- #include virtual = "/dbconn/GetDbConStr.asp" -->
<!-- #include virtual = "/include/refer_info.asp" -->

<%
    ' refer info ************ start ***********************************************************************
	 If request("referer") <> "" Then 'referer 넘겨준 페이지 검색
			referer = request("referer")
	Else                                    'referer 넘겨준 페이지 없으면, 이 페이지의 앞페이지 URL 값을 담기.
			referer = page_info(4)
    End If 
	If referer <> "" Then Session("referer") = referer End If 
    ' refer info ************ end ***********************************************************************
%>


<% If Session("wwwNum") <> "" Then
     req_webNum =  Session("wwwNum")
	Set DBRs = Server.CreateObject("ADODB.RecordSet")
		SQL = "SELECT recom_subject, recom_type, recom_url, recom_num FROM GtblRecomCode Where recom_type='Homepage'  and  recom_num = '"&req_webNum&"' and recom_num <> ''"	
		DBRs.Open SQL,adoconn,1 
		  if Not DBRs.Eof then 
				Do Until DBRs.Eof 
				   go_web_Home  = DBRs("recom_url") 
				  DBRs.MoveNext	
				Loop
            Response.redirect "/n/"&go_web_Home 	
		   end If
   End If 
%>

<% 'If Session("new91") <> "91" Then 	Response.End %>


<% '쿠키활용하여 로그인 안누르고, 저절로 로그인된 화면 보여주기
   If Request.cookies("userid") <> "" And  Request.cookies("longlogin")="yes" Then   
		 session("username") = Request.Cookies("username")
		 session("userid") = Request.Cookies("userid")
         Session("userid") = Request.cookies("userid")
		 session("userpwd") = Request.cookies("userpwd") 

	'로그인횟수 및 최근 액세스일 업데이트
	userIP	= Request.ServerVariables("REMOTE_ADDR")
	userMac	= left(Request("userMac"),17)
	adoConn.execute "Update GtblMemberInfo Set mem_accip='"&userIP&"', mem_accmac='"&userMac&"',mem_accdate='" & now() & "' where mem_id='" & session("userid") & "'"  
	
	session("viewmode") = "_recom"
   End If 
%>


<!DOCTYPE html>
<html>
<!-- 263576   a400c4   1600c3    4700c2 -->
<head>

  <link rel="canonical" href="http://www.ili.or.kr/">
  <meta name="Robots" content="ALL">
    <meta property="og:type" content="website">
    <meta property="og:title" content="국제자격검정원">
    <meta property="og:description" content="국제자격검정원 ◈무료수강 이벤트◈ 퍼스트브랜드대상 수상. 한국직업능력개발원 정식등록. 심리상담 및 교육지도, 전문실무분야 자격증">
    <meta property="og:image" content="http://www.ili.or.kr/image/main/logo.jpg">
    <meta property="og:url" content="http://www.ili.or.kr/">
    <meta property="og:image:type" content="image/jpg">
    <meta property="og:image:width" content="216">
    <meta property="og:image:height" content="49">

   <meta name="description" content="국제자격검정원 ◈무료수강 이벤트◈ 퍼스트브랜드대상 수상. 한국직업능력개발원 정식등록. 심리상담 및 교육지도, 전문실무분야 자격증">
   <meta name="keywords" content="국제자격검정원">




    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes">
    <title>
        <!--#include virtual="/include/title.asp"-->
    </title>

    

    <% 
IF  Session("http_log")="memOk" Then '#세션유/무 체크
%>
    <script type="text/javascript">
        var _HCmz = {
            SO: "REGO"
        };

    </script>


    <%
Session.Contents.Remove("http_log") '#세션삭제
End IF
%>

    <link type="text/css" rel="stylesheet" href="/n/css/layout.css">
    <link type="text/css" rel="stylesheet" href="/n/css/jquery.mobmenu.css">
    <link type="text/css" rel="stylesheet" href="/n/css/jquery.mobmenu.widescreen.css" media="all and (min-width: 900px)">
    <link type="text/css" rel="stylesheet" href="/n/css/jquery.mobmenu.themes.css" media="all and (min-width: 900px)">
    <link rel="stylesheet" href="/n/css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="/n/css/bootswatch.min.css">

	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- 	xeicon -->
	
	<link rel="stylesheet" href="/quick/font-awsome-all.min.css"/>
	<script src="/quick/font-awsome-all.min.js"></script>
<!-- 	폰트어썸 -->

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/1ee6ded678.js" crossorigin="anonymous"></script>

    <script language="javascript" src="/n/js/ajax.js" charset="utf-8"></script>
    <style type="text/css">
/*        @media all and (min-width: 900px) {*/

/*            html,*/
/*            body {*/
/*                height: 100%;*/
/*            }*/
/**/
/*            #menu {*/
/*                background: #eee;*/
/*            }*/
/**/
/*            #page {*/
/*                border-left: 1px solid #ccc;*/
/*                min-height: 100%;*/
/*            }*/

            /* hide open-button */
/*            a[href="#menu"] {*/
/*                display: none !important;*/
/*            }*/
/*        }*/


        #slides {
            display: none
        }

        #slides .slidesjs-previous {
            display: none
        }

        #slides .slidesjs-next {
            display: none
        }

        .slidesjs-pagination {
            list-style: none;
        }

        .slidesjs-pagination li {
            display: none
        }

    </style>
    <link type="text/css" rel="stylesheet" href="/n/css/mob_A.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/n/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/n/js/jquery.mobmenu.js"></script>
    

    <script type="text/javascript">
        $(function() {
            $('nav#menu').mmenu({
                classes: 'mm-light'
            });
        });
		$(document).ready(function() {
			var varUA = navigator.userAgent.toLowerCase(); //userAgent 값 얻기

			if ( varUA.indexOf("iphone") > -1||varUA.indexOf("ipad") > -1||varUA.indexOf("ipod") > -1 ) { //IOS
				$('.home_app').css('display', 'none');
			}
		});
    </script>


    <% if Session("userid") <> "" then 
id=Session("userid")
%>
    <%
set rs=Server.CreateObject("ADODB.RecordSet") 
SQL="Select * From GtblMemberInfo Where  mem_id='"&id&"' and mem_opt='1'"

rs.open sql,adoConn

'추천인 코드 
'set rs2=Server.CreateObject("ADODB.RecordSet") 
'SQL = "SELECT  count(recom_idx)  FROM   GtblRecomCode  WHERE   (CONVERT(int, recom_startDate) <= "&Replace(date,"-","")&") AND (CONVERT(int, recom_endDate) >= "&Replace(date,"-","")&") and  (recom_Code='"&rs("mem_recomId")&"')"

'Response.write sql
' Response. End 

'rs2.open sql,adoConn

'If (rs2.bof Or rs2.eof) Or (rs2(0)=0) Then 
'session("viewmode") = ""    
'Else  
'session("viewmode") = "_recom" 
'End If 
%>
    <% End If  %>


    <!-- 누구나 무료수강 -->
    <% session("viewmode") = "_recom" 
%>
    <!-- 누구나 무료수강 -->


    <script type="text/javascript">
        <!--
        function go_license(arg) {
            if (arg == 'license') {
                location.href = "/n/license/index.asp";
            }
            if (arg == 'license2') {
                location.href = "/n/license/index2.asp";
            }
        }
        //

        -->
    </script>


<% 
		SQL = "SELECT  COUNT(brd_idx) AS Expr1 FROM     GtblBoard WHERE  (brd_noticeOpt = '1') AND (brd_code = 'ili_01_01_01_17') AND (brd_opt = '1') AND (brd_secret = '0')"
		brdTotalRs = adoConn.Execute (SQL)
		notice_tot_cnt_su = Cint(brdTotalRs(0))

  notice_tot_cnt = notice_tot_cnt_su %>

<% Response.write "<script>"
 Response.write "var old_menu = '';"
 Response.write " function menuclick(submenu, su) {"
 Response.write "if (old_menu != '') {"
 Response.write " old_menu.style.display = 'none';"
 Response.write " }"
 Response.write " submenu.style.display = '';"
 Response.write " old_menu = submenu;"
 Response.write "  switch (su) {"

	For i=1 To notice_tot_cnt Step 1
	 Response.write " case "&i&":"
		For j=1 To notice_tot_cnt Step 1
		     If i=j Then 
				Response.write "click"&j&".style.display = 'none';"
			 Else
				Response.write "click"&j&".style.display = '';"
			 End If 

		     If i=j Then 
				Response.write "close"&j&".style.display = '';"
			 Else
				Response.write "close"&j&".style.display = 'none';"
			 End If 
		Next 
				Response.write "break;"
    Next 
		 Response.write "}"
 Response.write " }"


	For i=1 To notice_tot_cnt Step 1
		 Response.write "function close_click"&i&"() { "
		 Response.write " faq"&i&".style.display = 'none';"
		 Response.write " click"&i&".style.display = '';"
		 Response.write " close"&i&".style.display = 'none';"
		 Response.write "}"
    Next 
%>
    </script>
    <!-- faq 끝 -->





    <link rel="stylesheet" href="/n/css/rec_after_rightbox.css">

    <!-- LEC_after 블라인드 시작 -->

    <script type="text/javascript">
        <!--
        function lec_lite_boxplay(arg) {
            document.getElementById(arg).style.display = 'block';
            document.getElementById('lec_fade').style.display = 'block';
        }
        //

        -->
    </script>
    <!-- LEC_after 블라인드 끝 -->



    <style type="text/css">
        #index_header {
            margin-top: -109px;
        }

        .quick-area {
            margin: 10px 0 5px 0;
            display: inline-block;
        }

        .quick {
            padding: 0;
            list-style: none;
            width: 100%;
            margin-bottom: 0
        }

        .quick li {
            width: 33.3%;
            float: left
        }

        .quick li img {
            width: 100%
        }

    </style>

    <script src="/js/jquery.easing.1.3.js"></script>

</head>


<script>
    function TopdownTopBanner() {
        $("#index_header").stop().animate({
            "margin-top": "0px"
        }, 5000, "easeOutQuint");
    }

    window.onload = function() {
        //TopdownTopBanner();
    }

</script>


<% if Session("userid") = "" then %>


		<!-- 카카오리타겟팅 스크립트 시작 -->
		<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
		<script type="text/javascript">
			  kakaoPixel('7233548230231477898').pageView();
		</script>
		<!-- 카카오리타겟팅 스크립트 끝 -->
 
		<!-- Global site tag (gtag.js) - Google Ads: 670077036  시작-->
		<script async src="https://www.googletagmanager.com/gtag/js?id=AW-670077036"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());

		  gtag('config', 'AW-670077036');
		</script>
		<!-- Global site tag (gtag.js) - Google Ads: 670077036  끝-->
<% End If %>






<body>

<!-- 동영상서버 공지 팝업 시작 -->
<% 
	date_info_2023 = Replace(Date(),"-","") 
	time_info_2023 = FormatDateTime(Now(), 4)
	time_info_2023_el = Replace(time_info_2023,":","")
	'Response.write date_info_2023
	'Response.write time_info_2023_el
	total_time_info_2023 = date_info_2023&time_info_2023_el
	'Response.write total_time_info_2023
%>

<% If total_time_info_2023 >= 202406100900 And total_time_info_2023 <= 202406262359 Then %>
	<style>
		#popup_2023{width:95%; position:fixed; background:#263576; border-radius:5px; border:1px solid #ccc; top:50%; left:50%;  padding:10px; z-index:99999; transform:translate(-50%,-50%);}
		.cont{width:100%; height:100%; background:white; border-radius:5px 5px 0 0; padding:5px; box-sizing:border-box; font-weight:bold; text-align:center;}
		.cont>a>img{width:100%;}
		.close_btn_2023{color:white;  border-radius:0 0 5px 5px; overflow:hidden;}
/* 		.close_btn_2023>form{background:url("/image/main/ili_notice_2023_footer.png"); background-size:100% 100%;} */
		#check{display: flex; justify-content: flex-end; align-items: center;  margin-right: 5%;}
		.close_btn_2023>form>span{cursor:pointer; font-weight:bold; font-size:18px; }
		#chkday>input{opacity:1;}
		.close_btn_2023>form>span>label{cursor:pointer; opacity:1;}
		#close_2023_popup{opacity:1;}
		@media (max-width:1024px){
			#popup_2023{width:35%}
		}
		@media (max-width:768px){
			#popup_2023{width:50%}
		}
		@media (max-width:600px){
			#popup_2023{width:60%}
		}
		@media (max-width:425px){
			#popup_2023{width:80%}
		}
		@media (max-width:375px){
			#popup_2023{width:90%}
		}
	</style>
	<div id="popup_2023">
			<div class="cont">
				<a href="tel:02-830-3359">
					<img src="/image/main/ili_offline_mt.png?ver=2" alt="실무특강 공지 팝업">
				</a>
			</div>
			<div class="close_btn_2023">
				<form method="post" action="" name="pop_form" style="display:flex; justify-content:flex-end; align-items:center;">
					<span id="check"><label for="chkday">오늘 하루동안 보지 않기</label><input type="checkbox" value="checkbox" name="chkbox" id="chkday"/></span>
					<span id="close_2023_popup">닫기</span>
				</form>
			</div>
	</div>
	<script>
	//이미지만 눌러도 창 닫기
	//var close_img_btn = document.querySelector('.cont>img');
	//close_img_btn.addEventListener('click',()=>{
	//	$('#popup_2023').hide();
	//});

		// 쿠키 가져오기
		var getCookie = function (cname) {
			var name = cname + "=";
			var ca = document.cookie.split(';');
			for(var i=0; i<ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0)==' ') c = c.substring(1);
				if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
			}
			return "";
		}

		// 24시간 기준 쿠키 설정하기  
		var setCookie = function (cname, cvalue, exdays) {
			var todayDate = new Date();
			todayDate.setTime(todayDate.getTime() + (exdays*24*60*60*1000));
			var expires = "expires=" + todayDate.toUTCString(); // UTC기준의 시간에 exdays인자로 받은 값에 의해서 cookie가 설정 됩니다.
			document.cookie = cname + "=" + cvalue + "; " + expires;
		}

		var couponClose = function(){
			if($("input[name='chkbox']").is(":checked") == true){
				setCookie("close","Y",1);   //기간( ex. 1은 하루, 7은 일주일)
			}
			$("#popup_2023").hide();
		}
		
		$(document).ready(function(){
			var cookiedata = document.cookie;
			if(cookiedata.indexOf("close=Y")<0){
				$("#popup_2023").show();
			}else{
				$("#popup_2023").hide();
			}
			$("#close_2023_popup").click(function(){
				couponClose();
			});
		});
	</script>
<% Else %>
<% End If %>
<!-- 동영상서버 공지 팝업 끝 -->

    <!-- #include virtual = "/n/inc/top.asp" -->
	<!-- #include virtual = "/n/inc/info_fixed.asp" -->
    <!-- #include virtual = "/n/inc/nav_menu.asp" -->

    <div class="mm-page">

        <div id="page" style="padding-top: 115px;">

            <div style="margin: 1px 0">
                <!-- #include virtual = "/n/inc/sliding_section7.asp" -->
            </div>

<!-- 			 <div style="overflow: hidden"> -->
<!--                 <ul class="quick"> -->
<!-- 					<% if Session("userid") <> ""  Or Session("userId") <> ""  then %> -->
<!-- 						<li><a href="tel:02-830-3359"><img src="/n/images/icon_call.jpg" alt="문의전화"></a></li> -->
<!-- 					<% Else %> -->
<!-- 						<li><a href="/n/member/j_reg1.asp" class="sign_up"><img src="/n/images/icon_register.jpg" alt="무료회원가입"></a></li> -->
<!-- 					<% End If %> -->
<!--  -->
<!--                     <% if Session("userid") <> "" then %> -->
<!--  -->
<!-- 						<% If session("viewmode") = "_recom" Then %> -->
<!-- 							<li><a href="/n/application/lecturelist_recom.asp"><img src="/n/images/icon_sign.jpg" alt="수강신청"></a></li> -->
<!-- 						<% Else %> -->
<!-- 							<li><a href="/n/service/counsel/list.asp"><img src="/n/images/icon_sign.jpg" alt="수강신청"></a></li> -->
<!-- 						<% End If %> -->
<!--  -->
<!-- 					<% Else %> -->
<!--  -->
<!-- 						<% If session("viewmode") = "_recom" Then %> -->
<!-- 							<li><a href="/n/member/log_in.asp?Gourl=/n/application/lecturelist_recom.asp"><img src="/n/images/icon_sign.jpg" alt="수강신청"></a></li> -->
<!-- 						<% Else %> -->
<!-- 							<li><a href="/n/member/log_in.asp?Gourl=/n/service/counsel/list.asp"><img src="/n/images/icon_sign.jpg" alt="수강신청"></a></li> -->
<!-- 						<% End If %> -->
<!--  -->
<!--                     <% End If %> -->
<!--  -->
<!--  -->
<!--                     <li><a href="/n/license/index.asp"><img src="/n/images/icon_lic.jpg" alt="자격증과정안내"></a></li> -->
<!--  -->
<!--                 </ul> -->
<!--             </div> -->



<!-- 			<div width="100%" style="overflow: hidden; margin-top: 5px;">
				<% if Session("userid") <> ""  Or Session("userId") <> ""  then %>
					<a href="http://pf.kakao.com/_xolQsT"><img src="/n/images/icon_kakao.jpg" width="50%" alt="카톡 상담" style="float: left"></a>
					<a href="/n/service/counsel/list.asp"><img src="/n/images/icon_QA.jpg" width="50%" alt="1:1 게시판" style="float: left"></a>
				<% Else %>
					<a href="tel:02-830-3359"><img src="/n/images/icon_call_login.jpg" width="50%" alt="전화 상담" style="float: left"></a>
					<a href="http://pf.kakao.com/_xolQsT"><img src="/n/images/icon_kakao.jpg" width="50%" alt="카톡 상담" style="float: left"></a>
				<% End If %>
			</div> -->

			<% if Session("new91") = "91"  Then %>
	 		<div width="100%" style="margin-top: 5px;">       
				<a href="/n/service/faq2/list2.asp"><img src="/n/images/newinfo_btn.jpg" width="100%"></a>
			</div>
			<% End If %>

<!--240109 신규 추가-->
<link rel="stylesheet" href="/quick/font-awsome-all.min.css"/>
<script src="/quick/font-awsome-all.min.js"></script>
	<style>
		.swip_menu{position:relative; height:100px; margin:10px 0;}
		.mySwiper{height:100%; }
		.swiper-pagination{height:20%; bottom:0;}
		swiper-slide{width:180px; height:80%;}
		swiper-slide>a:visited, swiper-slide>a:link, swiper-slide>a:active, swiper-slide>a:hover{text-decoration:none; color:#222;}
		swiper-slide>div>a:visited, swiper-slide>div>a:link, swiper-slide>div>a:active, swiper-slide>div>a:hover{text-decoration:none; color:#222;}
	</style>
	<div class="swip_menu">
		<swiper-container class="mySwiper" pagination="true" pagination-clickable="true" slides-per-view="auto" space-between="15" autoplay-delay="5000" autoplay-disable-on-interaction="false">
			<swiper-slide style="overflow:hidden;">
				<div class="home_app_etc" style="display:none;">
					<a  onclick="alert('해당기능은 안드로이드에서만 제공 중에 있습니다.');" class="u_sc_etc" style="width: 100%; border:1px solid #aaa; height:100%; display:inline-block; border-radius:10px; background:white; color:#222; padding:14px 10px; box-shadow: 1px 1px #aaa; position:relative;" >
						<i class="fas fa-bookmark" style="position:absolute; top:0; left:10px; font-size:17px; color:#2dbf47;"></i>
						<div style="display:flex; justify-content:space-around; align-items:center;">
							<span style="font-weight:bold; font-size:18px; text-align:center;">홈화면<br>바로가기</span>
							<img src="/n/img/ili_right_logo_naver.png" alt="logo" style="width:35%;">
						</div>
					</a>
				</div>
  				<div class="home_app">
					<a href="intent://addshortcut?url=https://www.ili.or.kr/n/index.asp&amp;icon=https://www.ili.or.kr/n/images/ili_home.jpg&amp;title=국제자격검정원&oq=%ED%8C%A8%EC%85%98%ED%92%80&amp;serviceCode=sports&amp;version=7#Intent;scheme=naversearchapp;action=android.intent.action.VIEW;category=android.intent.category.BROWSABLE;package=com.nhn.android.search;end" onclick="nclk(this,'fot.shorcut','','',event);" class="u_sc" style="width: 100%; border:1px solid #aaa; height:100%; display:inline-block; border-radius:10px; background:white; color:#222; padding:14px 10px; box-shadow: 1px 1px #aaa; position:relative;" >
						<i class="fas fa-bookmark" style="position:absolute; top:0; left:10px; font-size:17px; color:#2dbf47;"></i>
						<div style="display:flex; justify-content:space-around; align-items:center;">
							<span style="font-weight:bold; font-size:18px; text-align:center;">홈화면<br>바로가기</span>
							<img src="/n/img/ili_right_logo_naver.png" alt="logo" style="width:35%;">
						</div>
					</a>
				</div>
			</swiper-slide>
			<swiper-slide>
				<a href="/n/application/lecturelist_01.asp" style="width: 100%; border:1px solid #aaa; height:100%; display:inline-block; border-radius:10px; background:white; color:#222; padding:15px 10px; box-shadow: 1px 1px #aaa; position:relative;">
					<i class="fas fa-bookmark" style="position:absolute; top:0; left:10px; color:red; font-size:17px;"></i>
					<span style="font-weight:bold; font-size:17px;">자격증 신청</span>
					<i class="fas fa-medal" style="font-size:18px;"></i>
					<p style="display:flex; justify-content:space-between; align-items:center;">
						<span>바로가기</span>
						<span>▶</span>
					</p>
				</a>
			</swiper-slide>
			<swiper-slide>
				<a href="http://www.recruit.or.kr/mobile/index.asp?arg1=<%=Session("userid")%>&arg2=ili" target="_blank" style="width: 100%; border:1px solid #aaa; height:100%; display:inline-block; border-radius:10px; background:white; color:#222; padding:15px 10px; box-shadow: 1px 1px #aaa; position:relative;" >
					<i class="fas fa-bookmark" style="position:absolute; top:0; left:10px; font-size:17px; color:#43158f;"></i>
					<span style="font-weight:bold; font-size:18px;">취업정보센터</span>
					<i class="fas fa-user-graduate" style="font-size:17px;"></i>
					<p style="display:flex; justify-content:space-between; align-items:center;">
						<span>바로가기</span>
						<span>▶</span>
					</p>
				</a>
			</swiper-slide>
			<swiper-slide>
				<a href="/n/lic_table.asp" style="width: 100%; border:1px solid #aaa; height:100%; display:inline-block; border-radius:10px; background:white; color:#222; padding:15px 10px; box-shadow: 1px 1px #aaa; position:relative;">
					<i class="fas fa-bookmark" style="position:absolute; top:0; left:10px; font-size:17px; color:#4898d3;"></i>
					<span style="font-weight:bold; font-size:16px;">한국직업능력연구원</span>
					<p style="display:flex; justify-content:space-between; align-items:center;">
						<span>자격등록현황</span>
						<span>▶</span>
					</p>
				</a>
			</swiper-slide>
		</swiper-container>
	</div>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
  <script>
  	/*스와이퍼 쉐도우돔트리 css 변경*/
  	const mySwiper_before_shadowDom = document.querySelector('.mySwiper');
	const swiper_pagination = mySwiper_before_shadowDom.shadowRoot.querySelector('.swiper-pagination');

	swiper_pagination.style.bottom = 0+"px";

	/*네이버 바로가기 관련한 처리*/
	let home_app = document.querySelector('.home_app');
	let home_app_etc = document.querySelector('.home_app_etc');



	document.addEventListener("DOMContentLoaded", ()=>{
		if(home_app.style.display == "none"){
			home_app_etc.style.display="block";
		}else{
			return;
		}
	});
  </script>
<!--240109 신규 추가 끝-->

<!-- 		

		home_app_etc.addEventListener("click",()=>{
		if(confirm("해당 기능은 안드로이드 환경내의 네이버앱을 통해서만 지원합니다. 플레이스토어로 이동하시겠습니까?")){
			window.location = "	http://play.google.com/store/apps/details?id=com.nhn.android.search"
		}else{
			return;
		}
	});

<a href="/n/application/lecturelist_01.asp" style="width: 97%; margin: 0 1.5% 5px; display: inline-block; overflow: hidden;">
				<img src="/n/images/pay_go.gif" width="100%">
			</a>
			
			<div class="home_app" style="width: 97%; margin: 5px 1.5%;">
				<a href="intent://addshortcut?url=https://www.ili.or.kr/n/index.asp&amp;icon=https://www.ili.or.kr/n/images/ili_home.jpg&amp;title=국제자격검정원&oq=%ED%8C%A8%EC%85%98%ED%92%80&amp;serviceCode=sports&amp;version=7#Intent;scheme=naversearchapp;action=android.intent.action.VIEW;category=android.intent.category.BROWSABLE;package=com.nhn.android.search;end" onclick="nclk(this,'fot.shorcut','','',event);" class="u_sc"><img src="/n/images/home_linkbg.jpg" style="width: 100%;"></a>
			</div>
			
			<a href="http://www.recruit.or.kr/mobile/index.asp?arg1=<%=Session("userid")%>&arg2=ili" target="_blank" style="width: 97%; margin: 0 1.5% 5px; display: inline-block; overflow: hidden;">
				<img src="/n/images/job_info_go.gif" width="100%">
			</a>
			
			<a href="/n/lic_table.asp" style="width: 97%; margin: 0 1.5% 5px; display: inline-block; overflow: hidden;"><img src="/n/images/table_bn.jpg" width="100%"></a> -->


				<!-- #include virtual = "/n/inc/vod_remote.asp" -->
                <!-- #include virtual = "/n/inc/coffee_career.asp" -->
                <!-- #include virtual = "/n/inc/video.asp" -->
				<!-- #include virtual = "/n/inc/koedu.asp" -->

			<img src="/n/images/firstbrand2020.png" width="100%">


                <div class="container">
                    <!-- #include virtual = "/n/inc/notice2.asp" -->
                </div>


			<% If  Session("new91") = "91" Then %>
				<!-- // -->
			<% Else %>
				<!-- #include virtual = "/n/inc/video.asp" -->
			<% End If %>

                <!-- 교수프로필 시작 -->

				<!--#include virtual="/n/inc/teacher_profile.asp"-->
				
                <!-- 교수프로필 끝 -->


<!--                 <div class="quick-area">
                    include virtual = "/n/inc/quick_icon4.asp"
                </div>
 -->
               


                <!-- //container-->
            </div>
            <!-- //content-->
        </div>


    </div>

    <style>
        .col-xs-33,
        .col-sm-33 {
            position: relative;
            min-height: 1px;
            padding-right: 5px;
            padding-left: 5px;
            width: 20%;
            float: left;
            text-align: center;
        }

    </style>



    <style type="text/css">
        /* Makes images fully responsive */

        .img-responsive,
        .thumbnail>img,
        .thumbnail a>img,
        .carousel-inner>.item>img,
        .carousel-inner>.item>a>img {
            display: block;
            width: 100%;
            height: auto;
        }

        /* ------------------- Carousel Styling -------------------

.carousel-inner {
  border-radius: 15px;
}
 */
        .carousel-caption {
            /* background-color: rgba(0,0,0,.5);*/
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 10;
            padding: 0 0 0px 25px;
            color: #fff;
            text-align: left;
        }

        .carousel-indicators {
            position: absolute;
            bottom: 0;
            right: 0;
            left: 0;
            width: 100%;
            z-index: 15;
            margin: 0;
            padding: 0px 0px 0px 0px;
            text-align: center;
        }

        .carousel-control.left,
        .carousel-control.right {
            background-image: none;
        }


        /* ------------------- Section Styling - Not needed for carousel styling ------------------- */

        .section-white {
            padding: 0px 0;
        }

        .section-white {
            background-color: #fff;
            color: #555;
        }

        @media screen and (min-width: 768px) {

            .section-white {
                padding: 0 0;
            }

        }

        @media screen and (min-width: 992px) {

            .container {
                max-width: 930px;
            }

        }

        /*공지사항*/


        .faq-cat-content {
            margin-top: 10px;
        }

        .faq-cat-tabs li a {
            padding: 15px 10px 15px 10px;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            color: #777777;
        }

        .nav-tabs li a:focus,
        .panel-heading a:focus {
            outline: none;
        }

        .panel-heading a,
        .panel-heading a:hover,
        .panel-heading a:focus {
            text-decoration: none;
            color: #777777;
        }

        .faq-cat-content .panel-heading:hover {
            background-color: #efefef;
        }

        .active-faq {
            border-left: 5px solid #888888;
        }

        .panel-faq .panel-heading .panel-title span {
            font-size: 13px;
            font-weight: normal;
        }

        .panel-body img {
            width: 100%;
            max-width: 640px;
            text-align: center
        }

    </style>


    <div id="mm-blocker" style="opacity: 0;"></div>



<% If Session("new91") = "91" Or Replace(Date(),"-","") >= 20210120 Then %>
    <!--#include virtual="/include/bottomlayer_mobile.asp"-->
<% Else %>
    <!--#include virtual="/include/bottomlayer_mobile2.asp"-->
<% End If %>


    <% If Request("shownum") = "902" Then %>
    <script type="text/javascript">
        <!--
        menuclick(faq4, 4);
        //

        -->
    </script>
    <% End If %>

    <% If Request("shownum") = "faq7" Then %>
    <script type="text/javascript">
        <!--
        menuclick(faq7, 7);
        //

        -->
    </script>
    <% End If %>


    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-144721954-2"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-144721954-2');

    </script>



    <!-- Enliple Common Tracker v3.5 [공용] start -->
    <script type="text/javascript">
        <!--
        function mobRf() {
            var rf = new EN();
            rf.setData("userid", "iliorkr");
            rf.setSSL(true);
            rf.sendRf();
        }
        //

        -->
    </script>
    <script src="https://cdn.megadata.co.kr/js/en_script/3.5/enliple_min3.5.js" defer="defer" onload="mobRf()"></script>
    <!-- Enliple Common Tracker v3.5 [공용] end -->



</body>

</html>
<!-- #include virtual = "/n/inc/new_footer.asp" -->

<%	
If Session("adminid") <> "" Then 

Else
    If Session("userid") <> "" then
	adoConn.execute "Update GtblMemberInfo Set mem_accdate='" & now() & "' where mem_id='" & Session("userid") & "'"	
	End If 
End If 
%>


<%
Call DbAllClose()
%>