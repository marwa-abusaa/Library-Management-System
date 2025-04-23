with BorrowerAgeGroups as (
    select 
	l.BookID,
    b.Genre,
    FLOOR(DATEDIFF(YEAR, br.Date_of_Birth, GETDATE()) / 10) * 10 as AgeGroupStart
    from loans l
    join Borrowers br on br.BorrowerID = l.BorrowerID
    join Books b on b.BookId = l.BookID
),

BookCountsByAgeGroup AS (
    SELECT 
	ba.BookID,
    ba.AgeGroupStart,
    ba.Genre,
    COUNT(*) AS BooksCount
    FROM BorrowerAgeGroups ba
    JOIN Loans l ON ba.BookID = l.BookID
    GROUP BY ba.BookID, ba.AgeGroupStart, ba.Genre
),

RankBooksByAgeGroup AS (
select bg.BookID, bg.AgeGroupStart, bg.Genre, bg.BooksCount,
DENSE_RANK() over (PARTITION BY bg.AgeGroupStart ORDER BY bg.BooksCount DESC) AS GenreRank
from BookCountsByAgeGroup bg
)

select Genre, AgeGroupStart, BooksCount from RankBooksByAgeGroup where GenreRank = 1;