USE final_project;

-- Data Warehouse -
CREATE OR REPLACE VIEW warehouse AS
SELECT c.CustomerId, c.FirstName,c.LastName,c.City,c.Country,c.Email,Invoice_number,Total,Track_number,Genre_number,Album_number,Artist_number
FROM Customer c
	JOIN (SELECT i.CustomerId,COUNT(DISTINCT(i.InvoiceId)) AS Invoice_number, COUNT(DISTINCT(Track.TrackId)) AS Track_number, COUNT(DISTINCT(Genre.GenreId)) AS Genre_number,COUNT(DISTINCT(Album.AlbumId)) AS Album_number, COUNT(DISTINCT(Artist.ArtistId)) AS Artist_number
			FROM Invoice i
				JOIN Invoiceline ON i.InvoiceId = Invoiceline.InvoiceId
                JOIN Track ON Track.TrackId = Invoiceline.TrackId
                JOIN Album ON Track.AlbumId = Album.AlbumId
                JOIN Genre ON Genre.GenreId = Track.GenreId
                JOIN Artist ON Artist.ArtistId = Album.ArtistId
			GROUP BY i.CustomerId)
            AS Infor
            ON c.CustomerId = Infor.CustomerId
	JOIN (SELECT i.CustomerId, SUM(i.Total) AS Total
		FROM Invoice i
        GROUP BY i.CustomerId) AS Expense
        ON Expense.CustomerId = c.CustomerId
ORDER BY CustomerId;
SELECT * from warehouse;
