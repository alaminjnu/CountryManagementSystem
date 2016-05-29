using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using FinalProject.Models;

namespace FinalProject.DAL
{
    public class CountryGateway
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CountryCityInformationApp"].ConnectionString;
        private SqlConnection connection;

        public CountryGateway()
        {
            connection= new SqlConnection(connectionString);
        }

        public int Save(Country country)
        {
            string query = "INSERT INTO Countries VALUES ('"+country.CountryName+"','"+country.About+"')";
            SqlCommand command = new SqlCommand(query,connection);
            connection.Open();
            int rowAffected = command.ExecuteNonQuery();
            connection.Close();
            return rowAffected;
        }

        public List<Country> GetAllCountry()
        {
            List<Country> countryList = new List<Country>();
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM Countries ORDER BY CountryName ASC";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Country aCountry = new Country();
                aCountry.Id = Convert.ToInt32(reader["Id"].ToString());
                aCountry.CountryName = reader["CountryName"].ToString();
                aCountry.About = reader["About"].ToString();
                countryList.Add(aCountry);
            }
            reader.Close();
            connection.Close();
            return countryList;
        }

        public List<ViewCountryByName> GetCountryByName(string countryName)
        {
            string query = "SELECT * FROM FinalCountryViewInfo WHERE CountryName LIKE '%" + countryName + "%'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<ViewCountryByName> countryList = new List<ViewCountryByName>();
            while (reader.Read())
            {
                ViewCountryByName viewCountryName = new ViewCountryByName();
                viewCountryName.Id = Convert.ToInt32(reader["Id"].ToString());
                viewCountryName.CountryName = reader["CountryName"].ToString();
                viewCountryName.About = reader["About"].ToString();
                viewCountryName.CitiesNo = Convert.ToInt32(reader["NumberOfCities"].ToString());
                viewCountryName.DwellersNo = Convert.ToInt32(reader["NumberOfDwellers"].ToString());
                countryList.Add(viewCountryName);
            }
            reader.Close();
            connection.Close();
            return countryList;
        }

        public List<ViewCountryByName> GetCountriesOnLoad()
        {
            string query = "SELECT * FROM FinalCountryViewInfo ORDER BY CountryName";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            List<ViewCountryByName> countryList = new List<ViewCountryByName>();
            while (reader.Read())
            {
                ViewCountryByName viewCountryName = new ViewCountryByName();
                viewCountryName.Id = Convert.ToInt32(reader["Id"].ToString());
                viewCountryName.CountryName = reader["CountryName"].ToString();
                viewCountryName.About = reader["About"].ToString();
                viewCountryName.CitiesNo = Convert.ToInt32(reader["NumberOfCities"].ToString());
                viewCountryName.DwellersNo = Convert.ToInt32(reader["NumberOfDwellers"].ToString());
                countryList.Add(viewCountryName);
            }
            reader.Close();
            connection.Close();
            return countryList;
        }
    }
    }
