<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
      $( function() {
        $( "#accordion" ).accordion({
        heightStyle: "content" }); });
    </script>
    <script>
        function openDaumPostcode() {
        var width = 500; //팝업창이 실행될때 위치지정
        var height = 600; //팝업창이 실행될때 위치지정
        new daum.Postcode({
        width : width, //팝업창이 실행될때 위치지정
        height : height, //팝업창이 실행될때 위치지정
        oncomplete: function(data) { // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
            // 법정동명이 있을 경우 추가한다.
            if(data.bname !== ''){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있을 경우 추가한다.
            if(data.buildingName !== ''){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
             
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("post1").value = data.postcode1;
            document.getElementById("post2").value = data.postcode2;
            document.getElementById("addr1").value = fullRoadAddr;
            document.getElementById("addr2").value = data.jibunAddress;
 
            document.getElementById('addr2').focus();
        }
    }).open({
        left : (window.screen.width / 2) - (width / 2), //팝업창이 실행될때 위치지정
        top : (window.screen.height / 2) - (height / 2) //팝업창이 실행될때 위치지정
    });
}
        
      function chk(){
    	  var req = document.form.req.checked;
    	  var num =0;
    	  if(req == true){
    		  num = 1;
    	  }
    	  if(num == 1){
    		  document.form.submit();
    	  }else{
    		  alert("개인정보 약관에 동의하셔야 합니다.");
    	  }
      }  
       function nochk(){
    	   alert("동의하지 않으면 가입하실 수 없습니다.");
           location.href="reg_form.jsp"
       }

  
   
      
</script>
    <style>
        body {
            font-family: "KoPubdotum Light";
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            text-align: center;
        }
        p {
        border: 1px #ccc solid ;
        padding: 4px;
        margin: 8px;
        }
        th{background-color: #F6F5FF; font-size: 13px; text-align: left; border: 0.5px solid #ccc; padding: 7px 15px 7px 6px}
        td{font-size: 10px; border: 1px solid #ccc; padding: 7px 15px 7px 6px; text-align: left;}
        table{margin: auto;}
        input{margin-right: 5px;}
        select{padding-left: 0;}
        .but, .but:link, .but:visited, .but:hover{
	      text-decoration: none;
          color: black;
        }
        .but:active{
            text-decoration: none;
            background-color: aliceblue;
        }
        .acc_hd {
          text-align: left;
          background-color: aliceblue;
	      display: block;
	      margin: 0;
	      padding: .5em .5em .5em .7em;
        }   
        #body_header {
          color: black;
          margin-bottom: 0;
          padding-bottom: 0;
          width: 100%;
          height: 2.5em;
        }
        #body_contents {
          background-color: white;
          padding-top: 0;
          width: 100%;
          height: 100%;
        }
        #accordion {
            display: block;
            height: 80%;
            background-color: white;
        }

        #post1, #post2, #post-b{margin-bottom: 3px}
        #div_under {
            padding: 10px;
        }
    </style>

</head>
<body>
	   <form name="joinform" method="post" action="get_logininfo.jsp" onsubmit="return submitForm()">
    <h1 id="body_header">회원가입</h1>
    <div id="body_contents">
    <div id="accordion">
      <h4 class="acc_hd">약관동의</h4>
        <div class="acc_ct">
      <h3>개인정보보호</h3>
      <p>3OA는 모든 회원 여러분들께서 서비스를 이용하기 위해 제공한 개인 정보가 보호 받을 수 있도록 최선을 다하고 있습니다. 3OA의 개인정보 보호정책은 정부의 관련 법률의 지침의 변경, 또는 이용약관 및 내부 규정 변화에 따라 임의로 변경될 수 있습니다. 회원 여러분께서는 사이트 방문 시 개인정보 보호정책을 수시로 확인하시기 바랍니다. 3OA는 사용자의 허락 없이 개인정보를 제 3자에게 제공하지 않습니다.</p>
            <input type="radio" name="gender" value="agree" onclick="chk()">동의합니다.
            <input type="radio" name="gender" value="disagree" onclick="nochk()">동의하지않습니다.
      <div id="div_under">
          <!--        <a href="#acc2"><input type="submit" value="확인" class="but"></a></div> -->  </div>
          </div>
  <h4 id="acc2" class="acc_hd">프로필</h4>
  <div id="acc_ct1">
      <div style="padding-top: 20px;">
        <table>
        		<tr>
        		<th>이름</th>
                <td><input type="text" id="name" name="name" size="11"/></td>
            </tr>
        
            <tr>
                <th>아이디</th>
            <td>
                <input type="text" id="id" size="15" maxlength="20" name="id">
                <input type="button" value="중복검사">
            </td>
            </tr>
            <tr>
            <th>비밀번호</th>
                <td>
                    <input id="pwd" type="password" name="pwd" size="24"/>
                    *8~12자의 영문 대소문자와 숫자를 조합해서 사용하실 수 있습니다.
                </td>
            </tr>
            
            <tr>
                <th>전화번호</th>
                <td>
                <select>
                    <option>010</option>
                    <option>011</option>
                </select>
                    <input type="text" id="phone" size="8" name="phone"/>       
                    <input type="button" value="인증번호발송">
                </td>
            </tr>
            <tr> 
                <th>주소</th>
                <td>
                     <input id="post1" readonly="" size="5" name="post1"> - <input id="post2" readonly="" size="5" name="post2">
					<input onclick="openDaumPostcode()" type="button" value="우편번호찾기"><br>
					<span style="LINE-HEIGHT: 10%"><br></span>
					<input id="addr1" readonly="" size="40" name="addr1" placeholder="도로명주소"><br>
				<span style="LINE-HEIGHT: 10%"><br></span>
					<input id="addr2" size="40" name="addr2" placeholder="지번주소">

                </td>
                </tr>
                <tr>
                <th>상세주소</th>
                <td><input type="text" id="addr3" name="addr3" size="60"/></td>
            </tr>
          </table>
             <div id="div_under">
                 <!--                 <a href="#acc3"><input type="submit" value="확인" class="but"></a></div>--></div>
    </div>
      </div>
  
  <h4 id="acc3" class="acc_hd">승인</h4>
  <div id="acc_ct2">
        <div style="padding-top: 20px;">승인되었습니다.</div>
        
      <div id="div_under">
          <a href="MainHome.html"><button type="submit" value="전송"><img src="home.png" alt="g" width="25"></button></a>
  </div>
        </div>
        </div>
    </div>
    </form>
</body>
</html>