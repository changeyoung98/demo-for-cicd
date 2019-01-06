package bean;
import java.sql.*;
public class Bookbean {
  String user = "root";
  String password = "8877452kk"; //改成自己的
	private String bookISBN = null;		//ͼ����
	private String bookName = null;		//����
	private String bookAuthor = null;		//����
	private String publisher = null;			//������
	private String introduce = null;			//���
	private String price = null;				//�۸�
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	private static String strDBDriver = "com.mysql.jdbc.Driver";  //JDBC����
	private static String strDBUrl = "jdbc:mysql://localhost:3306/bookstore?useSSL=false&&characterEncoding=UTF-8" ;  //����Դ ��

	private Connection conn =null;
	private ResultSet rs = null;

	public Bookbean(){
		//��������
		try {
			Class.forName(strDBDriver );
		}
		catch(java.lang.ClassNotFoundException e){
			System.err.println("BookBean ():" + e.getMessage());
		}
	}
	//ȡ��ǰ�����ȫ��ͼ����Ϣ
	public ResultSet getBookList(){
		String strSql = null;
		try{
			strSql = "Select bookISBN,bookName,bookAuthor,publisher,price from bookInfo ";
			//���������ݿ������
			conn = DriverManager.getConnection(strDBUrl,user,password);
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(strSql);
		}
		//�����쳣
		catch(SQLException e){
			System.err.println("BookBean.getBookList():" + e.getMessage());
		}
		return rs ;
	}
	//����ͼ��ı�Ÿ�ͼ���������Ϣ��ֵ
	public  void getBookInfo(String ISBN){
		String strSql = null;
		bookName = null;
		bookAuthor = null;
		publisher = null;
		introduce = null;
		price = null;
		try{
			//���������ݿ������
			conn = DriverManager.getConnection(strDBUrl,user,password);
			Statement stmt = conn.createStatement();
			strSql = "Select * from bookInfo where bookISBN = '" + ISBN + "'";
			rs = stmt.executeQuery(strSql);
			while (rs.next()){
				bookName = rs.getString("bookName");
				bookAuthor = rs.getString("bookAuthor");
				publisher = rs.getString("publisher");
				introduce = rs.getString("introduce");
				price = rs.getString("price");
			}
		}
		//�����쳣
		catch(SQLException e){
			System.err.println("BookBean.getBookList():" + e.getMessage());
		}
	}
	public void creatBook(){
		String strSql = null;
		try{
			conn = DriverManager.getConnection(strDBUrl,user,password);
			Statement stmt = conn.createStatement();
			strSql="insert into bookInfo(bookISBN,bookName,bookAuthor,publisher,price,introduce) values('"
			+getBookISBN()+"','"+getBookName()+"','"+getBookAuthor()+"','"+getPublisher()+"','"+getPrice()+"','"+getIntroduce()+"')";
			stmt.executeUpdate(strSql);

			stmt.close();
			conn.close();

		}
		catch(SQLException e){
		}

	}
	public void delBook(){
		String strSql = null;
		try{
			conn = DriverManager.getConnection(strDBUrl,user,password);
			Statement stmt = conn.createStatement();
			strSql="delete from bookInfo where bookName='"+getBookName()+"'";
			stmt.executeUpdate(strSql);

			stmt.close();
			conn.close();

		}
		catch(SQLException e){
		}

	}
	public void updateBook(){
		String strSql = null;
		try{
			conn = DriverManager.getConnection(strDBUrl,"sa","123456");
			Statement stmt = conn.createStatement();
			strSql="update bookInfo set price='"+getPrice()+"' where bookName='"+getBookName()+"'";
			stmt.executeUpdate(strSql);

			stmt.close();
			conn.close();

		}
		catch(SQLException e){
		}

	}
	//��ͼ��ı�Ÿ�ֵ��ͬʱ���ú�����ͼ���������Ϣ��ֵ
	public  void setBookISBN (String ISBN){
		this.bookISBN = ISBN;
	//	getBookInfo(bookISBN);
	}
	//ȡͼ����
	public  String getBookISBN (){
		return bookISBN ;
	}
	//ȡ����
	public String getBookName(){
		return bookName ;
	}
	//ȡ������Ϣ
	public String getBookAuthor(){
		return bookAuthor;
	}
	//ȡ��������Ϣ
	public String getPublisher(){
		return publisher;
	}
	//ȡͼ����
	public String getIntroduce(){
		return introduce ;
	}
	//ȡͼ��۸�
	public String getPrice(){
		return price;
	}
	//��Bean��Ϊһ��application���в�����
	/*public  static void main(String args[]){
		Bookbean book = new Bookbean ();
		book.setBookISBN("1000");

		System.out.println(book.getBookName());
		System.out.println(book.getBookAuthor());
		System.out.println(book.getPublisher());
		System.out.println(book.getIntroduce());
		System.out.println(book.getPrice());
//		try{
//			ResultSet tmpRS = book.getBookList();
//			while (tmpRS.next()){
//				System.out.println(tmpRS.getString("bookname"));
//			}
//			tmpRS.close();
//		}
//		//�����쳣
//		catch(Exception e){
//			System.err.println("main()" + e.getMessage());
//		}
		book.setBookName("java");
		book.setBookISBN("a001");
		book.creatBook();

	}	*/

}
