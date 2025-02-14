using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace _375ProjectVersion1.Models
{
    public class RentalModel
    {
        [Key]
        public Int64 RentalId { get; set; }
        [ForeignKey("Customer")]
        public Int64 CustomerId { get; set; }
        [ForeignKey("Movie")]
        public Int64 MovieId { get; set; }
        public DateTime? RentDate { get; set; }
        public DateTime ReturnDate { get; set; }
    }
}
