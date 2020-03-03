<%@page import="dao.LoaiSuKienDAO"%>
<%@page import="model.LoaiSuKien"%>
<%@page import="dao.TaiKhoanDAO"%>
<%@page import="dao.PhieuChamCongDAO"%>
<%@page import="dao.chamcongDAO"%>
<%@page import="model.NhanVien"%>
<%@page import="dao.nhanvienDAO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximun-scale=1">
    <title>Thực Hiện Chấm Công</title>
	<!--<link rel="stylesheet" type="text/css" href="css/menu.css">
	<link rel="stylesheet" type="text/css" href="css/button.css">-->
    <style>
    
    	body{
    		background: gray;
    	}	
        
        #menu table{
                  background: yellow;
                  width: 100%;    
                  border: 2px solid black;
                  border-collapse: collapse;   
                  padding: 3px 2px;                 
              }
        #nhap table{
               margin-top: 5px;   
               border: 2px solid black;
               border-collapse: collapse;   
               padding: 3px 2px; 
               background: white;
              }

        #nhapcong table {
               margin-top: 5px;
               font-family: tahoma;
               background: white;
               font-weight: bold;
               border: 2px solid black;
               border-collapse: collapse; 
               margin: 0px auto;
              }

        #bangketqua table {
                margin-top: 5px;
                border: 2px solid black;
                border-collapse: collapse;  
                background: rgb(255,255,0); 
                width: 100%;
                font-family: tahoma;
                text-align: center;
              }   

        #bangketqua table tr th, #bangketqua table tr td{
            border: 1px solid #AAAAAA;
            padding: 3px 2px;
            }

        .button {
			  background-color: black;
			  border: none;
			  color: white;
			  padding: 15px 32px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 16px;
			  cursor: pointer;
              width: 100%;
			}
			

        @media (max-width: 700px) {
            body{
                font-size: 16px;
            }

            textarea, select{
                font-size: 16px;
            }  

            input[type="text"], input[type="date"], input[type="time"]
            {
                font-size: 16px;
            }     

              #menu table{
              	  background: highlighttext;
              	  width: 400px;    
              	  border: 2px solid black;
           		  border-collapse: collapse;   
              	  padding: 3px 2px;                 
              }

              #menu table tr th a {
                  background-color: white;
                  border: none;
                  color: black;
                  padding: 4px 10px;
                  text-align: center;
                  text-decoration: none;
                  display: inline-block;
                  font-size: 15px;
                  cursor: pointer;  
              }

              #nhap table{
              	   width: 400px;
                   margin-top: 5px;   
                   border: 2px solid black;
           		   border-collapse: collapse;   
                   padding: 3px 2px; 
                   background: white;
              }
              
              #nhap table tr th {           	
              	background: yellow;
              }
              
              #nhap table tr td input{
              	width: 85%;          	
              }

              #nhap table tr td select{
                width: 89%;
                text-align: center;                
              }

              #nhapcong table {
               margin-top: 5px;
               font-family: tahoma;
               font-size: 15px;
               background: white;
               font-weight: bold;
               border: 2px solid black;
                border-collapse: collapse; 
              }
              
              #nhapcong table tr th{
              	background: rgb(255,255,0); 
              	width: 400px;
              }

              #bangketqua table {
                margin-top: 5px;
                border: 2px solid black;
                border-collapse: collapse;  
                background: rgb(255,255,0); 
                width: 400px;
                font-family: tahoma;
                font-size: 8px;
              }

              #bangketqua table tr td{
                background: white;
              }

              #bangketqua table tr th, #bangketqua table tr td{
                border: 1px solid #AAAAAA;
                padding: 3px 2px;
              }

        }
			
    </style>

</head>

<body>
	<%
		TaiKhoanDAO tkd = new TaiKhoanDAO();
		String _username = request.getParameter("u");
		String Quyen = "Nhân Viên";
	%>
	
	<div id="menu">
        <table>
            <tr>
                <th><a  href="TrangChu.jsp" >Trang chủ</a></th>
                <th><a  href="ThemChamCong.jsp?u=<%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>">Chấm Công</a></th>
                <th><a  href="nhanvien_list.jsp" >Nhân Viên</a></th>
                <th><a  href="" >Thống kê Công</a></th>
            </tr>

            <tr>
                <th colspan="4">
                    <a ><%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>|<%=Quyen %> | </a>
                    <a  href="logout.jsp" >Đăng xuất</a>
                </th>
            </tr>
        </table>
			
			
			
			
			
           
	</div>

    <form action="AddChamCong" method="get">
        <div id="nhap">
            <table>
                <tr>
                    <th colspan="2">Nhập thông tin sự kiện</th>
                </tr>

                <tr>
                    <td>Tên Sự Kiện:</td>
                    <td><input type="text" name="txtTenSuKien"></td>
                </tr>

                <tr>
                    <td>Loại Sự Kiện:</td>
                    <td>
                        <% LoaiSuKienDAO lskd = new LoaiSuKienDAO(); %>
                        <select name="txtLoaiSuKien" >
                        <% for(LoaiSuKien lsk: lskd.GetListLoaiSuKen()){ %>
                            <option value="<%=lsk.getLoaiSK() %>">
                                <%=lsk.getLoaiSK() %>
                            </option>

                        <%} %>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Ngày Diễn Ra Sư kiện:</td>
                    <td><input type="text" name="txtNgayDRSK"></td>
                </tr>

                <tr>
                    <td>Thời gian setup:</td>
                    <td><input type="text" name="txtTimeSetup"></td>
                </tr>
            </table>
        </div>

	        <input name="NguoiChamcong" type="hidden" value="<%=_username %>">

        <div id="bangketqua">
            <table id="ketqua_">
                <tr>
                    <th>Chấm ngày</th>
                    <th>Nhân sự</th>
                    <th>Công việc</th>
                    <th>Time từ</th>
                    <th>Time xong</th>
                    <th>21h-24h</th>
                    <th>0h-6h</th>
                    <th>ghi chú</th>
                </tr>

            </table>
        </div>

		<div id="nhapcong">
			<table>
            <tr>
                <th colspan="2">Tạo phiếu chấm công</th>
            </tr>

            <tr>
                <td>                  
                    Chấm ngày: 
                </td>
                <td>
                    <input id="Date" type="date" name="txtDate">
                </td>
            </tr>  
                <td>Nhân sự: </td>      
                <% nhanvienDAO nvd=new nhanvienDAO(); %>
                <td>                       
                    <textarea name="txtNhanSu" id="themnhansu" rows="3" cols="0"></textarea>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <select id="ChonTen">
                        <% for(NhanVien lnv: nvd.getlistNhanVien()){ %>
                            <option value="<%=lnv.getTen_nhan_vien() %>">
                                <%=lnv.getTen_nhan_vien() %>
                            </option>

                            <%} %>
                    </select>
                </td>
            </tr> 
            <tr>
                <td></td>
                <td>
                    <input type="hidden" value="<%=_username %>" id="username">
                    <input type="hidden" name="adapter_data_username" value="<%=request.getParameter("u") %>" >
                    
                    <button class="button" type="button" onclick="addpeo()">Thêm Tên</button>

                    <script type="text/javascript">
                        var x = document.getElementById("username").value; //khai báo biến nhân sự
                        document.getElementById("themnhansu").value = x;
                    </script>

                    <script>
                        function addpeo() {
                            x = x + ", " + document.getElementById("ChonTen").value; //thực hiện thêm nhận sự
                            document.getElementById("themnhansu").value = x;

                        }
                    </script>
                </td> 
            </tr>   

            <tr>
                <td>Công việc: </td>
                <td>                       
                    <textarea id="CongViec" name="txtCongViec" rows="3" cols="0"></textarea>
                </td>
            </tr> 

            <tr>
                <td>Thời gian từ: </td>
                <td>
                    <input id="TimeBD" type="time" name="txtTimeBD">
                </td>
            </tr>    

            <tr>
                <td>Thời gian xong: </td>
                <td>
                    <input id="TimeEnd" type="time" name="txtTimeEnd">                    
                </td>
            </tr>

            <tr>
                <td>Làm đêm 21h-24h: </td>
                <td>
                    <input type="checkbox" id="lamdem1" value="0"  onclick="checkbox1()">Yes/No
                </td>
            </tr>    
            
            <tr>
                <td>Làm đêm 0h-6h: </td>
                <td>
                    <input type="checkbox" id="lamdem2" value="0" onclick="checkbox2()">Yes/No
                </td>
            </tr>        

            <tr>
                <td>Ghi chú: </td>
                <td>
                    <textarea id="ghichu" rows="3" cols="0"></textarea>
                </td>
            </tr>
            
            <tr>
                <th colspan="2">
                    <button class="button" type="button" onclick="addrow()">Chấm một</button>
                </th>
            </tr>                        
                    
            <script>		// checkbox sau khi tích hoặc bỏ
            	function checkbox1(){
            		var checkBox = document.getElementById("lamdem1");
            		if (checkBox.checked == true){
            			//alert("yes");
            			document.getElementById("lamdem1").value = "1";
            		}
            		else {
						//alert("no");
            			document.getElementById("lamdem1").value = "0";
					}
            	}
                    	
            	function checkbox2(){
            		var checkBox2 = document.getElementById("lamdem2");
            		if (checkBox2.checked == true){
            			//alert("yes");
            			document.getElementById("lamdem2").value = "1";
            		}
            		else {
						//alert("no");
            			document.getElementById("lamdem2").value = "0";
					}
            	}
            </script>	

            <script>
              var gettable = "";  		// tạo biến đọc từ bảng chấm công
            </script>

            <script>
                function addrow() {
                    var table = document.getElementById("ketqua_");
                    var row = table.insertRow(document.getElementById("ketqua_").rows.length);

                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    var cell4 = row.insertCell(3);
                    var cell5 = row.insertCell(4);
                    var cell6 = row.insertCell(5);
                    var cell7 = row.insertCell(6);
                    var cell8 = row.insertCell(7);                          

                    cell1.innerHTML = document.getElementById("Date").value;
                    cell2.innerHTML = document.getElementById("themnhansu").value.trim();
                    cell3.innerHTML = document.getElementById("CongViec").value;
                    cell4.innerHTML = document.getElementById("TimeBD").value;
                    cell5.innerHTML = document.getElementById("TimeEnd").value;
                    cell6.innerHTML = document.getElementById("lamdem1").value;
                    cell7.innerHTML = document.getElementById("lamdem2").value;
                    cell8.innerHTML = document.getElementById("ghichu").value;

                    document.getElementById("Date").value = "";
                    document.getElementById("themnhansu").value = "";
                    document.getElementById("CongViec").value = "";
                    document.getElementById("TimeBD").value = "";
                    document.getElementById("TimeEnd").value = "";
                    document.getElementById("lamdem1").value = "0";
                    document.getElementById("lamdem2").value = "0";
                    document.getElementById("ghichu").value = "";
                    
                    checkBox = document.getElementById("lamdem1");
                    checkBox2 = document.getElementById("lamdem2");
                    checkBox.checked = false;
                    checkBox2.checked = false;
                    
                    x = document.getElementById("username").value; // là chuỗi tên đã tạo tại js dropbox
                    document.getElementById("themnhansu").value = x;
                                          
                    
                    gettable = gettable + cell1.innerHTML + "|" + cell2.innerHTML + "|" + cell3.innerHTML
                    			+ "|" + cell4.innerHTML + "|" + cell5.innerHTML + "|" + cell6.innerHTML 
                    			+ "|" + cell7.innerHTML + "|" + cell8.innerHTML + "[";

                    document.getElementById("chuoidata").value = gettable;
                    //alert(gettable);
                }
            </script>

            <tr>
                <th colspan="2">
                    <input type="hidden" name="adapter_data_chamcong" id="chuoidata">  <!-- tạo 1 biến adapter chuyển sang form khác -->                         
                    <button class="button" type="submit">Chấm công</button>
                </th>
            </tr>
    	</table>
		</div>
		

    </form>


</body>
</html>
