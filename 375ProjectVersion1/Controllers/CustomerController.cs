using _375ProjectVersion1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace _375ProjectVersion1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CustomerController : ControllerBase
    {
        private readonly MyContext _db;
        private readonly ILogger<CustomerController> _logger;

        public CustomerController(MyContext db, ILogger<CustomerController> logger)
        {
            _db = db;
            _logger = logger;
        }

        // GET: /customers
        [HttpGet("[action]")]
        public async Task<IActionResult> GetCustomers()
        {
            try
            {
                var customers = await _db.Customer.ToListAsync();
                return Ok(customers);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error fetching customers.");
                return StatusCode(500, "Internal Server Error");
            }
        }

        // POST: /customers
        [HttpPost("[action]")]
        public async Task<IActionResult> CreateCustomer([FromBody] CustomerModel value)
        {
            if (value == null)
                return BadRequest("Customer data cannot be null.");

            try
            {
                var customer = new CustomerModel
                {
                    Name = value.Name,
                    Email = value.Email,
                    Phone = value.Phone,
                    MembershipDate = value.MembershipDate
                };

                _db.Customer.Add(customer);
                await _db.SaveChangesAsync();

                return CreatedAtAction(nameof(GetCustomers), new { id = customer.CustomerId }, customer);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error creating a customer.");
                return StatusCode(500, "Internal Server Error");
            }
        }

        // PUT: /customers/{id}
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> UpdateCustomer([FromBody] CustomerModel value, long id)
        {
            if (value == null)
                return BadRequest("Customer data cannot be null.");

            try
            {
                var customer = await _db.Customer.FindAsync(id);
                if (customer == null)
                    return NotFound($"Customer with ID {id} not found.");

                customer.Name = value.Name;
                customer.Email = value.Email;
                customer.Phone = value.Phone;
                customer.MembershipDate = value.MembershipDate;

                await _db.SaveChangesAsync();
                return Ok(customer);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error updating customer with ID {Id}", id);
                return StatusCode(500, "Internal Server Error");
            }
        }

        // DELETE: /customers/{id}
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> DeleteCustomer(long id)
        {
            try
            {
                var customer = await _db.Customer.FindAsync(id);
                if (customer == null)
                    return NotFound($"Customer with ID {id} not found.");

                _db.Customer.Remove(customer);
                await _db.SaveChangesAsync();
                return NoContent();
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error deleting customer with ID {Id}", id);
                return StatusCode(500, "Internal Server Error");
            }
        }
    }
}