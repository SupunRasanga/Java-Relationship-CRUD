package relation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.util.JDBCUtil;

public class Services {
	//Create
			public static void createData(DTO dto) throws SQLException {
				Connection connection = null;
				PreparedStatement prest1 = null;
				PreparedStatement prest2 = null;
				
				String innerSql1 = "INSERT INTO author(author_id,author_name) VALUES(?,?)";
				String innerSql2 = "INSERT INTO book (book_id,book_name,author_id) VALUES(?,?,?)";
				
				try {
					connection = JDBCUtil.getConnection();
					try {
						prest1 = connection.prepareStatement(innerSql1);			
						prest1.setLong(1, dto.getAuthorId());
				    	prest1.setString(2, dto.getAuthorName());
				    	
				    	
				    	int returnValue = prest1.executeUpdate();
						System.out.println("Return of Insert Author SQL - "+returnValue);
						
					}catch(SQLException e) {
						System.out.println();
					}
					
					prest2 = connection.prepareStatement(innerSql2);
					prest2.setLong(1, dto.getBookId());
					prest2.setString(2, dto.getBookName());
					prest2.setLong(3, dto.getAuthorId());
					
					int returnValue = prest2.executeUpdate();
					System.out.println("Return of Insert Book SQL - "+returnValue);
					
					
				}catch(SQLException e) {
					System.out.println("Insert Faild "+e.getMessage());
				}finally {
					prest1.close();
					prest2.close();
					connection.close();
				}
			}
			
			//Update
			public static void updateData(DTO dto) throws SQLException{
				Connection connection = null;
				PreparedStatement prest1 = null;
				PreparedStatement prest2 = null;
				
				String innerSql1 = "UPDATE author SET author_name =? WHERE author_id =?";
				String innerSql2 = "UPDATE book SET book_name =? WHERE book_id =?";
				
				try {
					connection = JDBCUtil.getConnection();
					prest1 = connection.prepareStatement(innerSql1);
					prest1.setString(1, dto.getAuthorName());
					prest1.setLong(2, dto.getAuthorId());
					
					int returnValue = prest1.executeUpdate();
					System.out.println("Return of Update Author SQL - "+returnValue);
					
					prest2 = connection.prepareStatement(innerSql2);
					prest2.setString(1, dto.getBookName());
					prest2.setLong(2, dto.getBookId());
					
					returnValue = prest2.executeUpdate();
					System.out.println("Return of Update Book SQL - "+returnValue);
					
				}catch(SQLException e) {
					System.out.println("Update Faild "+e.getMessage());
				}finally {
					prest1.close();
					prest2.close();
					connection.close();
				}
			}
			
			//Delete
			public static void deleteData(DTO dto) throws SQLException {
				Connection connection = null;
				PreparedStatement prest1 = null;
				PreparedStatement prest2 = null;
		
				String innerSql1 = "DELETE FROM author WHERE author_id=?";
				String innerSql2 = "DELETE FROM book WHERE book_id =?";
				
				try {
					connection = JDBCUtil.getConnection();
					prest1 = connection.prepareStatement(innerSql1);
					prest1.setLong(1, dto.getAuthorId());
					
					prest2 = connection.prepareStatement(innerSql2);
					prest2.setLong(1, dto.getBookId());
					
					int returnValue = prest1.executeUpdate();
					System.out.println("Return of Delete Author SQL - "+returnValue);
					
					returnValue = prest2.executeUpdate();
					System.out.println("Return of Delete Book SQL - "+returnValue);
					
					
				}catch(SQLException e) {
					System.out.println("Delete Faild "+e.getMessage());
				}finally {
					prest1.close();
					prest2.close();
					connection.close();
				}
			}	
			
			//Read all data
			public static List<DTO> getAllData()throws SQLException{
				Connection connection = null;
				PreparedStatement prest = null;
				
				String selectSQL = "SELECT book_id,book_name,author_id,author_name FROM author FULL OUTER JOIN book USING(author_id)";

				connection = JDBCUtil.getConnection();
				prest = connection.prepareStatement(selectSQL);
				
				ResultSet rs = prest.executeQuery();
				List<DTO> bookList = new ArrayList<>();
				while(rs.next()) {
					DTO book = new DTO();
					book.setBookId(rs.getLong("book_id"));
					book.setBookName(rs.getString("book_name"));
					book.setAuthorId(rs.getLong("author_id"));
					book.setAuthorName(rs.getString("author_name"));
				
					bookList.add(book);
				}
					
				return bookList;
			}
			//Read data by id
			public static DTO getDataById(long dataId)throws SQLException{
				Connection connection = null;
				PreparedStatement prest = null;
				
				
				String getByIdSQL = "SELECT * FROM book FULL OUTER JOIN author USING(author_id) WHERE book_id=? OR author_id=?;";
				DTO dto = new DTO();
				try {
					connection = JDBCUtil.getConnection();
					prest = connection.prepareStatement(getByIdSQL);
					prest.setLong(1, dataId);
					prest.setLong(2, dataId);
					ResultSet rs = prest.executeQuery();
					
					while(rs.next()) {
						dto.setBookId(rs.getLong("book_id"));
						dto.setBookName(rs.getString("book_name"));
						dto.setAuthorId(rs.getLong("author_id"));
						dto.setAuthorName(rs.getString("author_name"));
					}
				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}finally {
					prest.close();
					connection.close();
				}
				return dto;
			}					
			
}
