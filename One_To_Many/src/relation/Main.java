package relation;

import java.sql.SQLException;
import java.util.List;



public class Main {
	public static void main(String[] args) {
		DTO book1 = new DTO();
		book1.setBookId(4);
		book1.setBookName("Madolduwada one");
		book1.setAuthorId(4);
		book1.setAuthorName("Matin Wikramasinghe neda");
		
		
		
		
		try {
			//Services.createData(book1);//Create
			//Services.updateData(book1);
			//Services.deleteData(book1);
//			
//			List<DTO> books = Services.getAllData();
//			System.out.println(books.size());
//			for(DTO bookDTO : books) {
//				System.out.println(bookDTO);
//				}
			

			DTO book = Services.getDataById(1);
			System.out.println(book);
			
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
	
		
		
	}
}
