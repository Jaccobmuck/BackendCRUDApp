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
        [HttpPut("[action]/{rentalId}")]
        public async Task<IActionResult> updateItem([FromBody] RentalModel value,Int64 rentalId, Int64 customerId, Int64 movieId)
        {
            try
            {
                using (MyContext db = new MyContext()) 
                { 
                    RentalModel model = await db.Rental.FirstOrDefaultAsync(x => x.RentalId == rentalId);
                    CustomerModel customer = await db.Customer.FirstOrDefaultAsync(x=> x.CustomerId == customerId);
                    MovieModel movie = await db.Movie.FirstOrDefaultAsync(x => x.MovieId == movieId);

                    if (model == null || customerId == null || movieId == null)
                    {
                        Console.WriteLine("The rental, customer, or movie id does not exist");
                        return NotFound();
                    }

                    model.CustomerId = value.CustomerId;
                    model.MovieId = value.MovieId;
                    model.RentDate = value.RentDate;
                    model.ReturnDate = value.ReturnDate;

                    db.Rental.Update(model);
                    await db.SaveChangesAsync();

                    return new ObjectResult(model);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("caught exception: ", e.Message, "stack trace: ", e.StackTrace);
                return BadRequest(e);
            }
        }
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> deleteItem(int id)
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    RentalModel rental = await db.Rental.FirstOrDefaultAsync(x => x.RentalId == id);

                    if (rental == null) 
                    {
                        Console.WriteLine("The id entered doesn't exist: ", id);
                    }
                    Console.WriteLine("deleting the rental with the id: ", id);
                    db.Rental.Remove(rental);
                    await db.SaveChangesAsync();
                    return Ok();
                }
            }
            catch (Exception e) 
            { 
                Console.WriteLine("caught exception: ", e.Message, "stack trace: ", e.StackTrace);
                return BadRequest(e);
            }
        }
    }
}
