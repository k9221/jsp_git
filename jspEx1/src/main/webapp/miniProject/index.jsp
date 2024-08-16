<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header class="header">
        <div class="image-container">
            <img src="${pageContext.request.contextPath}/img/mainImg.jpg" alt="메인 페이지 사진" class="background-image">
            <a href="${pageContext.request.contextPath}/mainPage.html" class="logo-link">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고 사진" class="overlay-image">
            </a>
            <div class="text-overlay">
                <p class="p1">
                    What does space mean to you?<h5>당신에게 공간은 어떤 의미를 갖고 있나요?</h5>
                </p>
            </div>
            <div class="main-pointLine1"></div>
            <ul class="main_nav">    
                <li><a href="${pageContext.request.contextPath}/aboutUs.html">ABOUT US</a></li>
                <li><a href="${pageContext.request.contextPath}/creatingSpace.html">CREATING A SPACE</a></li>
                <li><a href="${pageContext.request.contextPath}/remodeling.html">REMODELING</a></li>
                <li><a href="${pageContext.request.contextPath}/office.html">OFFICE</a></li>
            </ul>
            <div class="hover-image">
                <img src="${pageContext.request.contextPath}/img/logo2.png" alt="목록 이미지">
                <div class="hover-box">
                    <ul class="hover-list">
                        <li><a href="${pageContext.request.contextPath}/miniProject/login.jsp">로그인</a></li>
                        <li><a href="${pageContext.request.contextPath}/miniProject/join.jsp">회원가입</a></li>
                        <li><a href="${pageContext.request.contextPath}/miniProject/myStore.html">마이스토어</a></li>
                        <li><a href="${pageContext.request.contextPath}/miniProject/cart.html">장바구니</a></li>
                        <li><a href="${pageContext.request.contextPath}/miniProject/customerService.html">고객센터</a></li>
                    </ul>
                </div>
            </div>    
        </div>
    </header>
    <main>
        <div class="section-background">
            <section class="section1">
                <h1>DECORATING THE SPACE</h1>
                <div class="image-gellery">
                    <ul class="horizontal-list">
                        <li><a href="#"><img src="${pageContext.request.contextPath}/img/section1-1.jpg" alt="개성있는 의자사진">
                            <div><h3>HOME STYLING</h3></div><p>개성있는 공간 꾸미기</p>
                            </a>
                        </li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/img/section1-2.jpg" alt="오래된 감성사진">
                            <div><h3>REMODELING</h3></div><p>낡은 공간 꾸미기</p>
                            </a>
                        </li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/img/section1-3.jpg" alt="변화하는 삶">
                            <div><h3>SPACE PLAN</h3></div><p>라이프 변화에 맞춰 공간 재구성하기</p>
                            </a>
                        </li>
                    </ul>    
                </div>
            </section>
            <section class="section2">
                <div class="section2-pointLine3"></div>
                <div class="section2-pointLine4"></div>
                <div class="section2-pointLine5"></div>
                <div class="section2-pointLine6"></div>
                <div class="section2-pointLine7"></div>
                <div>
                    <img src="${pageContext.request.contextPath}/img/section2.jpg" alt="공감이란? 설명 백그라운드이미지" class="section2-backgroundImag">
                    <div class="section2-text">
                        <h2>ABOUT US</h2>
                        <div class="section2-text-chap1">
                            <ul>
                                <li>친환경 소재와 제품<p style="font-size: 0.5em; padding-top: 30px;">환경과 자원을 지속가능하게</p></li>
                            </ul>
                        </div>
                        <div class="section2-text-chap2">
                            <ul>
                                <li>전문적인 디자인<p style="font-size: 0.5em; padding-top: 30px;">전문디자이너의 손길로</p></li>
                            </ul>
                        </div>
                        <div class="section2-text-chap3">
                            <ul>
                                <li>합리적인 가격<p style="font-size: 0.5em; padding-top: 30px;">불필요한 생성과정을 제거한</p></li>
                            </ul>
                        </div>                 
                    </div>     
                </div> 
            </section>
            <section class="section3">
                <div>
                    <img src="${pageContext.request.contextPath}/img/section3-1.jpg" alt="왼쪽 사이드 이미지" class="section3-image1">
                </div>
                <div class="section3-pointLine1"></div>
                <div class="section3-text">
                    <p>PROJECT</p>
                </div>
                <div>
                    <img src="${pageContext.request.contextPath}/img/section3-2.jpg" alt="오른쪽 사이드 이미지" class="section3-image1-1">
                </div>
            </section> 
        </div>
        <footer>
            <div>
                <img src="${pageContext.request.contextPath}/img/footerImage.jpg" alt="푸터 상단 이미지" class="footerImage">
                <div class="footer-text">
                    <p>상호명: 공간  |  대표자명: kimyongjun  |  주소: 인천광역시 부평구 부평1동 534-17  |  사업자 번호:000-000-0000  |  대표전화: 000-000-0000</p>
                </div>
            </div>
        </footer>       
    </main>
    <script src="${pageContext.request.contextPath}/script.js"></script>
</body>
</html>
