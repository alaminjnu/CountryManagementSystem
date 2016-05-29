using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject.BLL;
using FinalProject.Models;

namespace FinalProject.UI
{
    public partial class CountryViewUI : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ViewCountryByName> countries = countryManager.GetCountriesOnLoad();
            countryGridView.DataSource = countries;
            countryGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string countryName = nameTextBox.Text;

                List<ViewCountryByName> country = countryManager.GetCountryByName(countryName);
                countryGridView.DataSource = country;
                countryGridView.DataBind();
            
        }
    }
}