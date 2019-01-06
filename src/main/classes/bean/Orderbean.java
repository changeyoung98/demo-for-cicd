package bean;
import java.sql.*;
public class Orderbean {

  String user = "root";
  String password = "8877452kk"; //改成自己的

	private static String strDBDriver = "com.mysql.jdbc.Driver";
	private static String strDBUrl = "jdbc:mysql://localhost:3306/bookstore?useSSL=false" ;

	private static Connection conn =null;
	private ResultSet rs = null;
	private java.lang.String bookinfo = null;
	private java.lang.String oderprice = null;
	private java.lang.String orderDate = null;
	private java.lang.String orderID = null;
	private java.lang.String orderRem = null;
	private java.lang.String receiverAddress = null;
	private java.lang.String receiverName = null;
	private java.lang.String receiverZip = null;
	private java.lang.String userID = null;

	public Orderbean(){
		try {
			Class.forName(strDBDriver );
		}
		catch(java.lang.ClassNotFoundException e){
			System.err.println("Orderbean ():" + e.getMessage());
		}
	}

	public java.lang.String getOderprice() {
			return oderprice;
	}

	public java.lang.String getOrderDate() {
			orderDate = new java.util.Date().toString();
			return orderDate;
	}

	public java.lang.String getOrderID() {
		orderID=String.valueOf(orderID);
		return orderID;
	}

	public java.lang.String getOrderRem() {
			return orderRem;
	}

	public java.lang.String getReceiverAddress() {
		return receiverAddress;
	}

	public java.lang.String getReceiverName() {
			return receiverName;
	}
	public java.lang.String getReceiverZip() {
			return receiverZip;
	}

	public java.lang.String getUserID() {
			return userID;
	}

	public void setBookinfo(java.lang.String newBookinfo) {
			bookinfo = newBookinfo;
			createNewOrder();
			int fromIndex = 0;
			int tmpIndex = 0;
			int tmpEnd = 0;
			String strSql = null;
			try{

				conn = DriverManager.getConnection(strDBUrl,user,password);
				Statement stmt = conn.createStatement();
				while(bookinfo.indexOf(';',fromIndex) != -1 ){
					tmpEnd = bookinfo.indexOf(';',fromIndex);
					tmpIndex = bookinfo.lastIndexOf('=',tmpEnd);
					strSql = "insert into orderdatail (orderID ,bookISBN ,bookcount)"
						+ " values( '" +getOrderID()
						+ "', '" + bookinfo.substring(fromIndex ,tmpIndex) + "', '"
						+ bookinfo.substring(tmpIndex+1 ,tmpEnd) + " ')" ;
					stmt.executeUpdate(strSql);
					fromIndex = tmpEnd + 1;
				}
				stmt.close();
				conn.close();
			}
			catch(SQLException e){
				System.err.println("Buyer.getLogontimes():" + e.getMessage());
			}
	}

	public void setOderprice(java.lang.String newOderprice) {
			oderprice = newOderprice;
	}

	public void setOrderRem(java.lang.String newOrderRem) {
			orderRem = newOrderRem;
	}
	public void setReceiverAddress(java.lang.String newReceiverAddress) {
		receiverAddress = newReceiverAddress;
	}
	public void setReceiverName(java.lang.String newReceiverName) {
		receiverName = newReceiverName;
	}


	public void setReceiverZip(java.lang.String newReceiverZip) {
			receiverZip = newReceiverZip;
	}

	public void setUserID(java.lang.String newUserID) {
			userID = newUserID;
	}

	private void createNewOrder() {
		String strSql = null;
		try{
			conn = DriverManager.getConnection(strDBUrl,user,password);
			Statement stmt = conn.createStatement();
			strSql="insert into orderInfo(userID,receiverName,receiverAddress,receiverZip,orderRem,orderPrice) "
					+ "values('"+getUserID()+"','"+getReceiverName()+"','"+getReceiverAddress()+"','"+getReceiverZip()+"','"
					+getOrderRem()+"','"+getOderprice()+"')";
			stmt.executeUpdate(strSql);
			strSql="select orderID from orderInfo where userID='"+getUserID()+"'and receiverName='"+getReceiverName()+"'";
			rs = stmt.executeQuery(strSql);
			while (rs.next()){
				orderID=rs.getString("orderID");
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch(SQLException e){
			System.err.println("Buyer.getLogontimes():" + e.getMessage());
		}
	}
//	public  static void main(String args[]) {
//		Orderbean order=new Orderbean();
//		order.setUserID("0001");
//
//		order.setReceiverName("张三");
//
//
//		order.setOderprice("80");
//
//		order.setReceiverAddress("安阳");
//
//		order.setReceiverZip("455000");
//
//		order.setBookinfo("1000=1;");
//		//查询
//		System.out.println(order.getOrderID());
//		System.out.println(order.getReceiverZip());
//	}

}
