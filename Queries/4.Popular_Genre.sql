DECLARE @Month INT = 11;

WITH GenreRanking AS (
    SELECT 
        b.Genre,
        COUNT(l.BookID) AS BooksCount,
        RANK() OVER(ORDER BY COUNT(l.BookID) DESC) AS GenreRank
    FROM books b
    JOIN loans l ON b.BookID = l.BookID
    WHERE MONTH(l.Date_Borrowed) = @Month
    GROUP BY b.Genre
)

SELECT Genre, BooksCount FROM GenreRanking WHERE GenreRank = 1;