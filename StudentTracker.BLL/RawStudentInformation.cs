using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StudentTracker.Domain.Entities;

namespace StudentTracker.BLL
{
    public class RawStudentInformation
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Sex { get; set; }
        public string Age { get; set; }
    }
}
