using System.ComponentModel.DataAnnotations;

namespace _375ProjectVersion1.Models
{
    // Model for the Movie Db table
    public class MovieModel
    {
        [Key]
        public Int64 MovieId { get; set; }
        public string? Title { get; set; }
        public string? Genre { get; set; }
        public DateTime? ReleaseYear { get; set; } 
        public string? Director { get; set; }

    }
}   
