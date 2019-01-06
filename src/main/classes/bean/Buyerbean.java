package bean;
import java.sql.*;
public class Buyerbean {
  String user = "root";
  String password = "8877452kk"; //改成自己的
	private String memberID = null ;     //��ԱID
	private String memberName = null;   //��Ա����
	private String pwd = null;			//����
	private int logintimes = -1;			//��¼�Ĵ���
	private String phone=null;

	private static String strDBDriver = "com.mysql.jdbc.Driver";  //JDBC����
	private static String strDBUrl = "jdbc:mysql://localhost:3306/bookstore?useSSL=false" ;  //����Դ ��
	private Connection conn =null;             //����
	private ResultSet rs = null;					//�����

	public Buyerbean(){
		//����JDBC-ODBC����
		try {
			Class.forName(strDBDriver );
		}
		//�����쳣
		catch(java.lang.ClassNotFoundException e){
			System.err.println("Buyerbean():" + e.getMessage());
			System.out.println("����ʧ��");
		}
	}

	//��õ�¼��������¼�Ļ�Ա������Ҳ�ڸ÷�������ʱ���
	public int getLogontimes(){
		String strSql = null;
		strSql = "Select logintimes,membername from buyer where memberID = '" +
				memberID + "'and pwd ='" + pwd + "'";
		try{

			//�������ݿ�
			conn = DriverManager.getConnection(strDBUrl,user,password);
			//����Statement����
			Statement stmt = conn.createStatement();
			//ִ��
			rs = stmt.executeQuery(strSql);
			while (rs.next()){
				// ��¼�Ĵ���
				logintimes = rs.getInt("logintimes");
				//��Ա����
				 memberName = rs.getString("membername");
			}
			rs.close();
			//����ǺϷ���Ա�����¼������1
			if (logintimes != -1 ) {
				strSql = "Update buyer set logintimes = logintimes +1 where memberID = '" + memberID + "'";
				stmt.executeUpdate(strSql);
			}
			stmt.close();
			conn.close();

		}
		//�����쳣
		catch(SQLException e){
			System.err.println("Buyer.getLogontimes():" + e.getMessage());
			System.out.println("ʧ��");
		}
		return logintimes ;
	}

	public void creatMember() {
		String strSql = null;
		try{
			conn = DriverManager.getConnection(strDBUrl,user,password);
			Statement stmt = conn.createStatement();
			strSql="insert into buyer(memberID,membername,pwd,logintimes,phone) values ('"+getMemberID()+"','"+getMemberName()+"','"+getPwd()+"','"+0+"','"+getPhone()+"')";
			int a = stmt.executeUpdate(strSql);
      if(a==1){

        System.out.println("添加成功");
      }else{

        System.out.println("添加失败");
      }

      rs.close();
			stmt.close();
			conn.close();

		}
		catch(NullPointerException e){
		  System.err.println("bad");
    }
		catch(SQLException e){
      System.err.println("Message:" + e.getMessage());
    }
	}



	//����memberID���ԣ�
	public  void setMemberID(String ID){
		this.memberID = ID;
	}
	//����pwd ����
	public void  setPwd(String password){
		this.pwd = password;
	}
	public void  setMemberName(String name){
		this.memberName = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMemberID(){
		memberID=String.valueOf(memberID);
		return memberID;
	}
	public String getPwd(){
		return pwd;
	}
	//��øû�Ա����ʵ������������ȡ�û�Ա��¼�Ĵ���֮����ܱ�������ȷ��ֵ
	public String getMemberName(){
		return memberName;
	}
	public String getPhone() {
		return phone;
	}


	//����Bean�еĸ��������Ƿ��ܹ���������
	/*public  static void main(String args[]){
		Buyerbean buyer = new Buyerbean();
		buyer.setMemberID("10004");
		buyer.setPwd("489");
		System.out.println(buyer.getLogontimes());
		System.out.println(buyer.getMemberName());
//		buyer.setMemberName("����");
//		buyer.setPwd("489");
//		buyer.creatMember();
//		System.out.println(buyer.getMemberID());
	}*/



}
