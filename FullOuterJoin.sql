SELECT [Movie].[MovieId], [Movie].[Title], [Movie].[Genre], [Movie].[ReleaseYear], 
[Movie].[Director], [Rental].[RentalId], [Rental].[CustomerId], [Rental].[RentDate], [Rental].[ReturnDate]
FROM [dbo].[Movie]

FULL OUTER JOIN [dbo].[Rental]
ON [Movie].[MovieId] = [Rental].[MovieId]
WHERE [Movie].[MovieId] = [Rental].[MovieId]