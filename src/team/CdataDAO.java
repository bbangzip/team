package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.polytech.utility.Encoding;

public class CdataDAO extends Encoding {
	Context envCtx;
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void dbClose(){
		try{
			if(rs!=null){rs.close();}
			if(pstmt!=null){pstmt.close();}
			if(con!=null){con.close();}			
		}catch(Exception e){e.printStackTrace();}
	}
	
	public CdataDAO(){
		try{
			Context ctx = new InitialContext();
			envCtx = (Context)ctx.lookup("java:/comp/env");
			ds = (DataSource)envCtx.lookup("jdbc/myoracle");
		}catch(Exception e){}
	}
	//데이터 넣기
	
	public int dataInsert(ListVO dataBean){
		int result = 0;
		try{
			String sql = "insert into listtbl values(listSq.nextVal, ?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?)";
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dataBean.getHdName());
			pstmt.setString(2, dataBean.getSubJect());
			pstmt.setString(3, dataBean.getContent());
			pstmt.setString(4, dataBean.getUserId());
			pstmt.setString(5, dataBean.getListPwd());
			pstmt.setString(6, dataBean.getLocation());
			
			int inx = 3;
			String fileNames[] = dataBean.getFilename();
			
			for(int i=0; i<fileNames.length; i++){//0~4까지
				if(fileNames[i]!=null){//null이 아닌곳을 찾음 -> 파일이 있는 곳을 찾아서 inx에 넣음.
					inx=i; break;
				}
			}
			int p=2;
			if(inx<=p){pstmt.setString(7, fileNames[p--]);}else{pstmt.setString(7, "");}
			if(inx<=p){pstmt.setString(8, fileNames[p--]);}else{pstmt.setString(8, "");}
			if(inx<=p){pstmt.setString(9, fileNames[p--]);}else{pstmt.setString(9, "");}						
			pstmt.setString(10, dataBean.getDong());
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbClose();
		}
		return result;
	}
	
}
