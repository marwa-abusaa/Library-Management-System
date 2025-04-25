--Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books. 

WITH AuthorBorrowingFrequency AS (
select b.Author, Count(*) AS [Book Borrowing Frequency]
from Loans l 
INNER JOIN Books b on l.BookID = b.BookID
group by b.Author
)

select a.*, DENSE_RANK() OVER(ORDER BY a.[Book Borrowing Frequency] DESC) AS AuthorRank
from AuthorBorrowingFrequency a;