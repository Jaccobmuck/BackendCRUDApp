using _375ProjectVersion1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
                return BadRequest(e);
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
                return BadRequest(e);
            }
        }
        [HttpPut("[action]/{id}")] // http action followed by the specified id that's being worked with
        public async Task<IActionResult> updateItem([FromBody] MovieModel value, Int64 id) // id's are int64 in the model
        {
            try
            {
                Console.WriteLine("updating the user with the id: ", id);
                using (MyContext db = new MyContext())
                {
                    MovieModel model = await db.Movie.FirstOrDefaultAsync(x => x.MovieId == id);
                    // creates an object for the movie model to update similarly to "postItems" function
                    // mapping it to the id at the first or default id that matches
                    if (model == null)
                    {
                        Console.WriteLine("Id ", id, " Not found");
                        return NotFound(id);
                    }

                    model.Title = value.Title;
                    model.Genre = value.Genre;
                    model.ReleaseYear = value.ReleaseYear;
                    model.Director = value.Director;

                    db.Movie.Update(model);
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
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> deleteItem(Int64 id)
        {
            try
            {
                using(MyContext db = new MyContext())
                {
                    MovieModel movie = await db.Movie.FirstOrDefaultAsync(n => n.MovieId == id);
                    if(movie != null)
                    {
                        Console.WriteLine("deleting item: " + movie);
                        db.Movie.Remove(movie);
                        await db.SaveChangesAsync();
                    }
                    Console.WriteLine("The item doesn't exist or was already deleted");
                    return new OkResult();
                }
            }
            catch(Exception e)
            {
                Console.WriteLine("Caught exception: ", e.Message, "Stack Trace: ", e.StackTrace);
                return BadRequest(e);
            }
        }

    }
}
