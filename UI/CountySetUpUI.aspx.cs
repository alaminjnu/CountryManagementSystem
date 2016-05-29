using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalProject.BLL;
using FinalProject.Models;

namespace FinalProject
{
    public partial class CountySetUpUI : System.Web.UI.Page
    {
        CountryManager countryManager = new CountryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCountries();
        }

        private void LoadCountries()
        {
            List<Country> countryList = countryManager.GetAllCountry();
            countryGridView.DataSource = countryList;
            countryGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Country country = new Country();
            country.CountryName = nameText.Value;
            country.About = aboutTextArea.Value;

            if (countryManager.Save(country)>0)
            {
                messageLabel.Text = "Country Saved Succesfully";
                LoadCountries();
            }
            else
            {
                messageLabel.Text = "Country Couldn't Save";
            }
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("");
        }
    }
}