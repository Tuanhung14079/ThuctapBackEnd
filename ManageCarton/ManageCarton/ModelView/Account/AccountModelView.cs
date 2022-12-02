using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CartonManeger.ModelView.Account
{
    public class AccountModelView
    {
        public int AccountId { get; set; }
        public string PhoneNumber { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Sex { get; set; }
        public string DateOfBirth { get; set; }
        public string Address { get; set; }
        public DateTime? AccountCreationDate { get; set; }
        public DateTime? UpdateDate { get; set; }

    }
}
