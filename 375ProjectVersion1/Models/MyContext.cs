using Microsoft.EntityFrameworkCore;

namespace _375ProjectVersion1.Models
{
    public class MyContext : DbContext
    {
        private String connectionString = "Data Source=MSI\\SQLEXPRESS;Initial Catalog=MovieRental;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False";
        // Lab String -> Data Source=CS-16\\COMP375JMUCK;Initial Catalog=MovieRental;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False
        // Home String -> Data Source=MSI\SQLEXPRESS;Initial Catalog=MovieRental;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connectionString);
        }
        public DbSet<MovieModel> Movie { get; set; }   
        public DbSet<CustomerModel> Customer { get; set; }
        public DbSet<RentalModel> Rental { get; set; }  

    }
}
