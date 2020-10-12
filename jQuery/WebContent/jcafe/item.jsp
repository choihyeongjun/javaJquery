<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>item.jsp</title>
	<script src="../js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<table border="1">
		<tr>
			<td>Item No</td>
			<td><input type="text" name="itemNo"></td>
		</tr>
		<tr>
			<td>Item</td>
			<td><input type="text" name="item"></td>
		</tr>
		<tr>
			<td>Category</td>
			<td><input type="text" name="category"></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>Content</td>
			<td><input type="text" name="content"></td>
		</tr>
		<tr>
			<td>Like It</td>
			<td><input type="text" name="likeIt"></td>
		</tr>
		<tr>
			<td>Image</td>
			<td><img id="image"></td>
		</tr>
	</table>
	<%
		String itemNo=request.getParameter("itemNo");
	
	%>
	<script>
		$.ajax({
			url:'GetProductServlet',
			data: {itemNo: '<%=itemNo%>'},        
			dataType:'json',
			success:function(result){
				let data=result;
				console.log(data);
				$('input[name="itemNo"]').val(data[0].itemNo);
				$('input[name="item"]').val(data[0].item);
				$('#image').attr('src','../images/'+data[0].image)
				.attr('width','170px');
			},
			error: function(result){
				console.log(result);
			}
		});
	</script>
</body>
</html>