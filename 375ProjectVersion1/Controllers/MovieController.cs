using _375ProjectVersion1.Models;
using Microsoft.AspNetCore.Mvc;

namespace _375ProjectVersion1.Controllers
{
    [ApiController]
    [Route("/[controller]")]
    public class MovieController : ControllerBase
    {
        [HttpGet("[action]")]
        public IActionResult getItems()
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    List<MovieModel> Movie = db.Movie.ToList();

                    return new ObjectResult(Movie);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Caught an exception: ", e.Message, "Stack Trace: ", e.StackTrace);
                return BadRequest(e.Message);
            }
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> postItem([FromBody] MovieModel value)
        {
            try
            {
                using (MyContext db = new MyContext())
                {
                    // creates a movie model object to be able to add items to the db
                    MovieModel model = new MovieModel();

                    // mapping the input value to the model object
                    model.Title = value.Title;
                    model.Genre = value.Genre;
                    model.ReleaseYear = value.ReleaseYear;
                    model.Director = value.Director;

                    db.Movie.Add(model);
                    await db.SaveChangesAsync();

                    return new ObjectResult(model);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Caught an exception: ", e.Message, "Stack Trace: ", e.StackTrace);
                return BadRequest(e.Message);
            }
        }
    }
}
