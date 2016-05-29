using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject.Models
{
    public class City
    {
        public int Id { get; set; }
        public string About { get; set; }
        public string CityName { get; set; }
        public int DwellersNo { get; set; }
        public string Location { get; set; }
        public string Weather { get; set; }
        public int CountryId { get; set; }
        public string Country { get; set; }
    }
}