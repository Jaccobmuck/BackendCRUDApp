using _375ProjectVersion1.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace _375ProjectVersion1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MovieController : ControllerBase
    {
        private readonly MyContext _db;
        private readonly ILogger<MovieController> _logger;

        public MovieController(MyContext db, ILogger<MovieController> logger)
        {
            _db = db;
            _logger = logger;
        }

        // GET: /movies
        [HttpGet("[action]")]
        public async Task<IActionResult> GetMovies()
        {
            try
            {
                var movies = await _db.Movie.ToListAsync();
                return Ok(movies);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error fetching movies.");
                return StatusCode(500, "Internal Server Error");
            }
        }

        // POST: /movies
        [HttpPost("[action]")]
        public async Task<IActionResult> CreateMovie([FromBody] MovieModel value)
        {
            if (value == null)
                return BadRequest("Movie data cannot be null.");

            try
            {
                var model = new MovieModel
                {
                    Title = value.Title,
                    Genre = value.Genre,
                    ReleaseYear = value.ReleaseYear,
                    Director = value.Director
                };

                _db.Movie.Add(model);
                await _db.SaveChangesAsync();

                return CreatedAtAction(nameof(GetMovies), new { id = model.MovieId }, model);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error creating a movie.");
                return StatusCode(500, "Internal Server Error");
            }
        }

        // PUT: /movies/{id}
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> UpdateMovie([FromBody] MovieModel value, long id)
        {
            if (value == null)
                return BadRequest("Movie data cannot be null.");

            try
            {
                var movie = await _db.Movie.FindAsync(id);
                if (movie == null)
                    return NotFound($"Movie with ID {id} not found.");

                movie.Title = value.Title;
                movie.Genre = value.Genre;
                movie.ReleaseYear = value.ReleaseYear;
                movie.Director = value.Director;

                await _db.SaveChangesAsync();
                return Ok(movie);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error updating movie with ID {Id}", id);
                return StatusCode(500, "Internal Server Error");
            }
        }

        // DELETE: /movies/{id}
        [HttpDelete("[action]/{id}")]
        public async Task<IActionResult> DeleteMovie(long id)
        {
            try
            {
                var movie = await _db.Movie.FindAsync(id);
                if (movie == null)
                    return NotFound($"Movie with ID {id} not found.");

                _db.Movie.Remove(movie);
                await _db.SaveChangesAsync();
                return NoContent();
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error deleting movie with ID {Id}", id);
                return StatusCode(500, "Internal Server Error");
            }
        }
    }
}