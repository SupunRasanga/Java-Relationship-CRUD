package relation;

public class DTO {
	//columns of table
	private long bookId;
	private String bookName;
	private long authorId;
	private String authorName;
	
	
	
	//public getters and setters
	public long getBookId() {
		return bookId;
	}
	public void setBookId(long bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) { 
		if(bookName != null) {
			this.bookName = bookName.trim();
		}else {
			this.bookName = null;
		}
				
	}
	public long getAuthorId() {
		return authorId;
	}
	public void setAuthorId(long authorId) {
		this.authorId = authorId;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		if(authorName != null) {
			this.authorName = authorName.trim();
		}else {
			this.bookName = null;
		}
	}
	@Override
	public String toString() {
		return "BookId = " + bookId + ", BookName = " + bookName + ", AuthorId = " + authorId + ", AuthorName = "
				+ authorName;
	}
	

}
