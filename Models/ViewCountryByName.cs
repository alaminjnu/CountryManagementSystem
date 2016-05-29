using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject.Models
{
    public class ViewCountryByName
    {
        public int Id { get; set; }
        public string CountryName { get; set; }
        public string About { get; set; }
        public int CitiesNo { get; set; }
        public int DwellersNo { get; set; }
    }
}