using System.Collections.Generic;
using FinalProject.DAL;
using FinalProject.Models;

namespace FinalProject.BLL
{
    public class CityManager
    {
        public int Save(City city)
        {
            CityGateway cityGateway = new CityGateway();
            return cityGateway.Save(city);
        }

        public List<City> GetAllCity()
        {
           CityGateway cityGateway = new CityGateway();
          return cityGateway.GetAllCity();
        }
    }
}