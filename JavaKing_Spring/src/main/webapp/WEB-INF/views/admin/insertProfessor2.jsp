<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Title -->
  <title>:: 비트대학교 ::</title>

  <!-- Required Meta Tags Always Come First -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <!-- Favicon -->
  <link rel="shortcut icon" href="../../favicon.ico">

  <!-- Google Fonts -->
  <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">

  <!-- CSS Implementing Plugins -->
  <link rel="stylesheet" href="../../assets/vendor/font-awesome/css/all.min.css">
  <link rel="stylesheet" href="../../assets/vendor/hs-megamenu/src/hs.megamenu.css">
  <link rel="stylesheet" href="../../assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
  <link rel="stylesheet" href="../../assets/vendor/custombox/dist/custombox.min.css">
  <link rel="stylesheet" href="../../assets/vendor/animate.css/animate.min.css">

  <!-- CSS Space Template -->
  <link rel="stylesheet" href="../../assets/css/theme.css">
 
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnAdd").click(function(){

		var Check1 = $("#pro1").val();
		var Check2 = $("#pro2").val();
		var Check3 = $("#pro4").val();
		var Check4 = $("#pro5").val();	
		var Check5 = $("#inputGroupFile01").val();
		
	    if(!Check1 || !Check2 || !Check3 || !Check4 || !Check5){
	        alert("입력되지 않은 값이 존재합니다.");
	        
	      }else{
			var form = new FormData(document.getElementById('pro'));
			$.ajax({
				url: "/admin/insertProfessor",
				type : "post",
				processData: false,
				contentType: false,
				data : form,
				dataType: "json",
				success : function(data) {
					alert("ok");
					
				}});
			$("input").val('');
			$("#inputGroupFile01").val('');
			$('#file_name').empty();
			$('#file_name').append("파일 선택");
	      }
		});

		$('#inputGroupFile01').change(function(){
			$('#file_name').empty();
			var filename = $('input[type=file]').val().replace(/.*(\/|\\)/, '');
			$('#file_name').append(filename);
		});
});
</script>

</head>
<body>
  <!-- Skippy -->
  <a id="skippy" class="sr-only sr-only-focusable u-skippy" href="#content">
    <div class="container">
      <span class="u-skiplink-text">Skip to main content</span>
    </div>
  </a>
  <!-- End Skippy -->

  <!-- ========== HEADER ========== -->
  <jsp:include page="../header.jsp"></jsp:include>
  <!-- ========== END HEADER ========== -->

  <!-- ========== MAIN CONTENT ========== -->
  <main id="content">
    <!-- Hero Section -->
    <div class="hanna space-2 space-3-top--lg bg-primary text-white text-center text-weight-bold">
      <h1 class = "h1 hanna">교수정보 관리</h1>
    </div>
    <!-- End Hero Section -->

    <!-- News Blog Content -->
    <div class="container space-3-bottom--lg space-2-top">
      <div class="row">
        <div class="col-lg-9 order-lg-2 mb-9 mb-lg-0">
        	<div class="row bootstrap snippets bootdeys" id="property-list"  >
			
			<form id="pro" class= "mx-auto">
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1" style="background-color: #e6f2ff; font-weight: bold;">교수번호 </span>
				  </div>
				  <input type="number" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="pro_no" id="pro1" />
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1" style="background-color: #e6f2ff; font-weight: bold;">교수이름 </span>
				  </div>
				  <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="pro_name" id="pro2"/>
				</div>
			   
			   <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <label class="input-group-text" for="inputGroupSelect01" style="background-color: #e6f2ff; font-weight: bold;">학부</label>
				  </div>
				  <select class="custom-select" id="inputGroupSelect01" name="pro_type" id="pro3">
				    <option value="인문학부">인문학부</option>
				    <option value="사회경영학부">사회경영학부</option>
				    <option value="공학부">공학부</option>
				    <option value="문화예술학부">문화예술학부</option>
				  </select>
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1" style="background-color: #e6f2ff; font-weight: bold;">전공 </span>
				  </div>
				  <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="pro_major" id="pro4"/>
				</div>
				
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1" style="background-color: #e6f2ff; font-weight: bold;">이메일 </span>
				  </div>
				  <input type="email" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" name="pro_email" id="pro5"/>
				</div>
			   
			   	<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" style="background-color: #e6f2ff; font-weight: bold;" >사진등록</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" id="inputGroupFile01" name="uploadFile" />
				    <label class="custom-file-label" for="inputGroupFile01" id="file_name">파일 선택</label>
				  </div>
				  <br>
				</div>
				
				<div class="input-group mb-3" style="display: block;">
		    		<button type="button" class="btn btn-primary btn-sm"  style="float: right;" id="btnAdd">등록</button>
		   		</div>
		   		
				</form>	
		</div>
        
        

          <!-- End Pagination -->
        </div>

        <div class="col-lg-3 order-lg-1">
          <!-- ========== admin_leftBar_Categories 삽입 ========== -->
			 <jsp:include page="../admin_leftBar_Categories.jsp"/>
			 <!-- ========== END admin_leftBar_Categories 삽입 ========== -->
      </div>
    </div>
    <!-- End News Blog Content -->
  </main>
  <!-- ========== END MAIN CONTENT ========== -->

  <!-- ========== FOOTER ========== -->
  <jsp:include page="../footer.jsp"></jsp:include>
  <!-- ========== END FOOTER ========== -->

  <!-- Go to Top -->
  <a class="js-go-to u-go-to" href="javascript:;"
    data-position='{"bottom": 15, "right": 15 }'
    data-type="fixed"
    data-offset-top="400"
    data-compensation="#header"
    data-show-effect="slideInUp"
    data-hide-effect="slideOutDown">
    <i class="fa fa-arrow-up u-go-to__inner"></i>
  </a>
  <!-- End Go to Top -->

  <!-- JS Global Compulsory -->
  <script src="../../assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="../../assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
  <script src="../../assets/vendor/popper.js/dist/umd/popper.min.js"></script>
  <script src="../../assets/vendor/bootstrap/bootstrap.min.js"></script>

  <!-- JS Implementing Plugins -->
  <script src="../../assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
  <script src="../../assets/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
  <script src="../../assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
  <script src="../../assets/vendor/custombox/dist/custombox.min.js"></script>
  <script src="../../assets/vendor/custombox/dist/custombox.legacy.min.js"></script>
  <script src="../../assets/vendor/instafeed.js/instafeed.min.js"></script>

  <!-- JS Space -->
  <script src="../../assets/js/hs.core.js"></script>
  <script src="../../assets/js/components/hs.header.js"></script>
  <script src="../../assets/js/components/hs.unfold.js"></script>
  <script src="../../assets/js/components/hs.validation.js"></script>
  <script src="../../assets/js/helpers/hs.focus-state.js"></script>
  <script src="../../assets/js/components/hs.malihu-scrollbar.js"></script>
  <script src="../../assets/js/components/hs.modal-window.js"></script>
  <script src="../../assets/js/components/hs.show-animation.js"></script>
  <script src="../../assets/js/components/hs.instagram.js"></script>
  <script src="../../assets/js/components/hs.go-to.js"></script>

  <!-- JS Plugins Init. -->
  <script>
    $(window).on('load', function () {
      // initialization of HSMegaMenu component
      $('.js-mega-menu').HSMegaMenu({
        event: 'hover',
        pageContainer: $('.container'),
        breakpoint: 991,
        hideTimeOut: 0
      });
    });

    $(document).on('ready', function () {
      // initialization of header
      $.HSCore.components.HSHeader.init($('#header'));

      // initialization of unfold component
      $.HSCore.components.HSUnfold.init($('[data-unfold-target]'), {
        afterOpen: function () {
          if (!$('body').hasClass('IE11')) {
            $(this).find('input[type="search"]').focus();
          }
        }
      });

      // initialization of form validation
      $.HSCore.components.HSValidation.init('.js-validate', {
        rules: {
          confirmPassword: {
            equalTo: '#password'
          }
        }
      });

      // initialization of forms
      $.HSCore.helpers.HSFocusState.init();

      // initialization of malihu scrollbar
      $.HSCore.components.HSMalihuScrollBar.init($('.js-scrollbar'));

      // initialization of autonomous popups
      $.HSCore.components.HSModalWindow.init('[data-modal-target]', '.js-signup-modal', {
        autonomous: true
      });

      // initialization of show animations
      $.HSCore.components.HSShowAnimation.init('.js-animation-link');

      // initialization of instagram api
      $.HSCore.components.HSInstagram.init('#instaFeed', {
        resolution: 'standard_resolution',
        after: function () {
          // initialization of masonry.js
          var $grid = $('.js-instagram').masonry({
            percentPosition: true
          });

          // initialization of images loaded
          $grid.imagesLoaded().progress(function () {
            $grid.masonry();
          });
        }
      });

      // initialization of go to
      $.HSCore.components.HSGoTo.init('.js-go-to');
    });
  </script>
</body>
</html>