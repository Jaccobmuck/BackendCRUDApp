using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace _375ProjectVersion1.Models
{
    public class MyContext : DbContext
    {
        public MyContext(DbContextOptions<MyContext> options) : base(options) { }

        public DbSet<MovieModel> Movie { get; set; }
        public DbSet<CustomerModel> Customer { get; set; }
        public DbSet<RentalModel> Rental { get; set; }
    }
}