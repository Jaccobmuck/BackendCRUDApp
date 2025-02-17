using _375ProjectVersion1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace _375ProjectVersion1.Controllers
{
    [ApiController]
    [Route("/[controller]")]
    public class CustomerController : ControllerBase
    {
        [HttpGet("[action]")]
        public IActionResult getItems()
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    List<CustomerModel> customers = db.Customer.ToList();

                    return new ObjectResult(customers);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return BadRequest(e);
            }
        }
        [HttpPost("[action]")]
        public async Task<IActionResult> postItems([FromBody] CustomerModel value)
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    CustomerModel model = new CustomerModel();

                    model.Name = value.Name;
                    model.Email = value.Email;
                    model.Phone = value.Phone;
                    model.MembershipDate = value.MembershipDate;

                    db.Customer.Add(model);
                    await db.SaveChangesAsync();

                    return new ObjectResult(model);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return BadRequest(e);
            }
        }
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> updateItem([FromBody] CustomerModel value, Int64 id)
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    // does not check if the id actually exists so don't fuck it up 
                    CustomerModel model = await db.Customer.FirstOrDefaultAsync(x => x.CustomerId == id);
                    if (model == null)
                    {
                        Console.WriteLine("Id: ", id, " does not exist");
                        return NotFound("customer not found");
                    }


                    model.Name = value.Name;
                    model.Email = value.Email;
                    model.Phone = value.Phone;
                    model.MembershipDate = value.MembershipDate;

                    db.Customer.Update(model);
                    await db.SaveChangesAsync();

                    return new ObjectResult(model);
                }
            }
            catch (Exception e)
            {
                Console.Write("exception: ", e.Message, "stack trace: ", e.StackTrace);
                return BadRequest(e);
            }
        }
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> deletItem(Int64 id)
        {
            try
            {
                using (MyContext db = new MyContext()) 
                {
                    CustomerModel model = await db.Customer.FirstOrDefaultAsync(x => x.CustomerId == id);

                    if(model != null)
                    {
                        Console.WriteLine("deleting the customer with id: ", id);
                        db.Customer.Remove(model);
                        await db.SaveChangesAsync();
                    }
                    Console.WriteLine("customer with the id: ", id, "was already deletd or never existed");
                    return new OkObjectResult(model);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("caught exception: ", e.Message);
                return BadRequest(e);
            }
        }
    }
}
