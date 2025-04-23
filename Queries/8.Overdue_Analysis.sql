select b.*, bor.*, DATEDIFF(DAY, l.Due_Date, GETDATE()) AS Overdue_Days
from Loans l 
INNER JOIN Books b on l.BookID = b.BookID
INNER JOIN Borrowers bor on l.BorrowerID = bor.BorrowerID
where DATEDIFF(DAY, l.Due_Date, GETDATE()) > 30;