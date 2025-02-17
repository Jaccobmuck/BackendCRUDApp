using System.ComponentModel.DataAnnotations;

namespace _375ProjectVersion1.Models
{
    public class CustomerModel
    {
        [Key]
        public Int64 CustomerId { get; set; }
        public string? Name {  get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }     
        public DateTime? MembershipDate { get; set; }
    }
}
