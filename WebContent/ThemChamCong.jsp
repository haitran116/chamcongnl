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
    <title>Thực Hiện Chấm Công</title>
	<link rel="stylesheet" type="text/css" href="css/menu.css">
	<link rel="stylesheet" type="text/css" href="css/button.css">
    <style>
    
    	body{
    		
    	}
    	
    	#nhap{
    		width: auto;
    		margin-top: 20px;
    	}
    	
        table {
            width: 100%;
            background: yellow;
            margin: 0px auto;
            font-family: tomaho;
        }

        table,
        th,
        td {
            border: 2px solid black;
            border-collapse: collapse;
        }

        th {
            background: highlight;
        }
        
        .button {
			  background-color: #4CAF50;
			  border: none;
			  color: navy;
			  padding: 15px 32px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 16px;
			  margin: 4px 2px;
			  cursor: pointer;
			}
			
			
    </style>

</head>

<body>
	<%
		TaiKhoanDAO tkd = new TaiKhoanDAO();
		String _username = request.getParameter("u");
		String Quyen = "Nhân Viên";
	%>
	
	<div id="menu" style="height: 60px;">
			<a  href="TrangChu.jsp" class="myButton">Trang chủ</a>
			<a  href="ThemChamCong.jsp?u=<%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>" class="myButton">Chấm Công</a>
			<a  href="nhanvien_list.jsp" class="myButton">Nhân Viên</a>
			<a  href="chamcong.jsp" class="myButton">Thống kê Công</a>
			<a  style="float: right;" href="logout.jsp" class="tsx">Đăng xuất</a>
			<a style="float: right; margin-top: 11px;"><%=tkd.LayTenLogin((String)session.getAttribute("_user")) %>|<%=Quyen %> | </a>
	</div>

    <form action="AddChamCong" method="get">
    	<div id="nhap">
    		<br> Tên Sự Kiện:  
	        <input type="text" name="txtTenSuKien">
	        <br>
	        <br> Loại Sự Kiện:
	        <input type="text" name="txtLoaiSuKien">
	        <br>
	        <br> Ngày Diễn Ra Sư kiện:   
	        <input type="text" name="txtNgayDRSK">
	        <br>
	        <br> Thời gian setup:   
	        <input type="text" name="txtTimeSetup">
	        <br>
	        <br>
    	</div>
		


        <table id="Table_">
            <tr>
                <th>Ngày Chấm</th>
                <th>Nhân sự</th>
                <th>Công Việc</th>
                <th>Thời gian st</th>
                <th>Thời gian end</th>
                <th></th>
            </tr>

            <tr>
                <td>
                    <input id="Date" type="date" name="txtDate">
                </td>

                <% nhanvienDAO nvd=new nhanvienDAO(); %>

                    <td>
                        <input type="text" name="txtNhanSu" id="themnhansu">
                        <select id="ChonTen">
                            <% for(NhanVien lnv: nvd.getlistNhanVien()){ %>
                                <option value="<%=lnv.getTen_nhan_vien() %>">
                                    <%=lnv.getTen_nhan_vien() %>
                                </option>

                                <%} %>
                        </select>
                        
						<input type="hidden" value="<%=_username %>" id="username">
                        <input type="hidden" name="adapter_data_username" value="<%=request.getParameter("u") %>" >
                        
                        <button type="button" class="button" onclick="addpeo()">Thêm Tên</button>
                        <br>
                        <br>

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

                    <td>                       
                        <textarea id="CongViec" name="txtCongViec" rows="5" cols="55"></textarea>
                    </td>

                    <td>
                        <input id="TimeBD" type="time" name="txtTimeBD">
                    </td>

                    <td>
                        <input id="TimeEnd" type="time" name="txtTimeEnd">                    
                    </td>
                    
                    <td>
                    	<button class="button" type="button" onclick="addrow()">Chấm</button>
                    </td>

                    <script>
                      var gettable = "";  		// tạo biến đọc từ bảng chấm công
                    </script>

                    <script>
                        function addrow() {
                            var table = document.getElementById("Table_");
                            var row = table.insertRow(document.getElementById("Table_").rows.length - 1);

                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            var cell4 = row.insertCell(3);
                            var cell5 = row.insertCell(4);

                            cell1.innerHTML = document.getElementById("Date").value;
                            cell2.innerHTML = document.getElementById("themnhansu").value.trim();
                            cell3.innerHTML = document.getElementById("CongViec").value;
                            cell4.innerHTML = document.getElementById("TimeBD").value;
                            cell5.innerHTML = document.getElementById("TimeEnd").value;

                            document.getElementById("Date").value = "";
                            document.getElementById("themnhansu").value = "";
                            document.getElementById("CongViec").value = "";
                            document.getElementById("TimeBD").value = "";
                            document.getElementById("TimeEnd").value = "";
                            
                            x = document.getElementById("username").value; // là chuỗi tên đã tạo tại js dropbox
                            document.getElementById("themnhansu").value = x;
                            
                            gettable = gettable + cell1.innerHTML + "|" + cell2.innerHTML + "|" + cell3.innerHTML
                            			+ "|" + cell4.innerHTML + "|" + cell5.innerHTML + "[";

                            document.getElementById("chuoidata").value = gettable;
                            //alert(gettable);
                        }
                    </script>

            </tr>

        </table>

        <input type="hidden" name="adapter_data_chamcong" id="chuoidata">  <!-- tạo 1 biến adapter chuyển sang form khác -->
		    	
		
        <input style="margin: 0px auto;" type="submit" value="Chấm Công" class="button">
    </form>


</body>
</html>
