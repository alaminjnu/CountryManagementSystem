using System.Collections.Generic;
using FinalProject.DAL;
using FinalProject.Models;

namespace FinalProject.BLL
{
    public class CountryManager
    {
        public int Save(Country country)
        {
            CountryGateway countryGateway = new CountryGateway();
            return countryGateway.Save(country);
        }

        public List<Country> GetAllCountry()
        {
            CountryGateway countryGateway = new CountryGateway();
            return countryGateway.GetAllCountry();
        }

        public List<ViewCountryByName> GetCountryByName(string countryName)
        {
            CountryGateway countryGateway = new CountryGateway();
            return countryGateway.GetCountryByName(countryName);
        }

        public List<ViewCountryByName> GetCountriesOnLoad()
        {
            CountryGateway countryGateway = new CountryGateway();
            return countryGateway.GetCountriesOnLoad();
        }
    }
}