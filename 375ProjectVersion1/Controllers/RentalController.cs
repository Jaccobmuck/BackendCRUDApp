using _375ProjectVersion1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace _375ProjectVersion1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class RentalController : ControllerBase
    {
        private readonly MyContext _db;
        private readonly ILogger<RentalController> _logger;

        public RentalController(MyContext db, ILogger<RentalController> logger)
        {
            _db = db;
            _logger = logger;
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> GetItems()
        {
            try
            {
                var rentals = await _db.Rental.ToListAsync();
                return Ok(rentals);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error fetching rental items");
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> PostItem([FromBody] RentalModel value, long customerId, long movieId)
        {
            if (value == null) return BadRequest("Rental data cannot be null.");

            try
            {
                var customer = await _db.Customer.FindAsync(customerId);
                var movie = await _db.Movie.FindAsync(movieId);

                if (customer == null || movie == null)
                    return NotFound("Customer or Movie ID not found");

                var model = new RentalModel
                {
                    CustomerId = value.CustomerId,
                    MovieId = value.MovieId,
                    RentDate = value.RentDate,
                    ReturnDate = value.ReturnDate
                };

                _db.Rental.Add(model);
                await _db.SaveChangesAsync();
                return CreatedAtAction(nameof(GetItems), new { id = model.RentalId }, model);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error creating rental");
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpPut("[action]/{rentalId}")]
        public async Task<IActionResult> UpdateItem([FromBody] RentalModel value, long rentalId, long customerId, long movieId)
        {
            if (value == null) return BadRequest("Rental data cannot be null.");

            try
            {
                var rental = await _db.Rental.FindAsync(rentalId);
                var customer = await _db.Customer.FindAsync(customerId);
                var movie = await _db.Movie.FindAsync(movieId);

                if (rental == null || customer == null || movie == null)
                    return NotFound("Rental, Customer, or Movie not found");

                rental.CustomerId = value.CustomerId;
                rental.MovieId = value.MovieId;
                rental.RentDate = value.RentDate;
                rental.ReturnDate = value.ReturnDate;

                await _db.SaveChangesAsync();
                return Ok(rental);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error updating rental");
                return StatusCode(500, "Internal Server Error");
            }
        }

        [HttpDelete("([action]/{id}")]
        public async Task<IActionResult> DeleteItem(long id)
        {
            try
            {
                var rental = await _db.Rental.FindAsync(id);
                if (rental == null) return NotFound();

                _db.Rental.Remove(rental);
                await _db.SaveChangesAsync();
                return NoContent();
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error deleting rental");
                return StatusCode(500, "Internal Server Error");
            }
        }
    }
}