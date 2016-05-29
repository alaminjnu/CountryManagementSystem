using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using FinalProject.Models;

namespace FinalProject.DAL
{

    public class CityGateway

    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CountryCityInformationApp"].ConnectionString;
        private SqlConnection connection;

        public CityGateway()
        {
            connection= new SqlConnection(connectionString);
        }

        public int Save(City city)
        {
            string query = "INSERT INTO City VALUES('"+city.CityName+"','"+city.About+"',"+city.DwellersNo+",'"+city.Location+"','"+city.Weather+"',"+city.CountryId+")";
            SqlCommand command = new SqlCommand(query,connection);
            connection.Open();
            int rowAffected=command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        public List<City> GetAllCity()
        {
            string query = "SELECT * FROM City";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<City> cities = new List<City>();
            while (reader.Read())
            {
                City city = new City();
                city.Id = Convert.ToInt32(reader["ID"].ToString());
                city.CityName = reader["CityName"].ToString();
                city.About = reader["About"].ToString();
                city.DwellersNo = Convert.ToInt32(reader["DwellersNo"].ToString());
                city.Location = reader["Location"].ToString();
                city.Weather = reader["Weather"].ToString();
                city.CountryId = Convert.ToInt32(reader["CountryId"].ToString());
                cities.Add(city);
            }
            reader.Close();
            connection.Close();
            return cities;
        }
    }
}