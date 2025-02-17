using _375ProjectVersion1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace _375ProjectVersion1.Controllers
{
    [ApiController]
    [Route("/[controller]")]
    public class RentalController:ControllerBase
    {
        [HttpGet("[action]")]
        public IActionResult getItems()
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    List<RentalModel> rentals = db.Rental.ToList();

                    return new ObjectResult(rentals);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("caught exception:", e.Message, "Stack trace: ", e.StackTrace);
                return BadRequest(e);
            }
        }
        [HttpPost("[action]")]
        public async Task<IActionResult> postItem([FromBody] RentalModel value, Int64 customerId, Int64 movieId)
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    RentalModel model = new RentalModel();
                    // allows us to search for the id in the primary key table to see if it exists
                    CustomerModel customer = await db.Customer.FirstOrDefaultAsync(x => x.CustomerId == customerId);
                    MovieModel movie = await db.Movie.FirstOrDefaultAsync(x => x.MovieId == movieId);

                    if (customer == null || movie == null) {
                        // both ids (MovieId and CustomerId) need to exist or else you cannot add data into the rental table
                        Console.WriteLine("One or both of the MovieId or CustomerID does not exist");
                        return NotFound();
                    }
                    model.CustomerId = value.CustomerId;
                    model.MovieId = value.MovieId;
                    model.RentDate = value.RentDate;
                    model.ReturnDate = value.ReturnDate;

                    db.Rental.Add(model);
                    await db.SaveChangesAsync();

                    return new ObjectResult(model);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Caught exception: ", e.Message, "Stack trace: ", e.StackTrace);
                return BadRequest(e);   
            }
        }
    }
}
