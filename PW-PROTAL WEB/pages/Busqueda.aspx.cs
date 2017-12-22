using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;

namespace WebApplication1.Pages
{
    public partial class Busqueda : System.Web.UI.Page
    {
        private string SearchString = "";
        DateTime currenttime = DateTime.Now; //Si es String : .ToShortTimeString()
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                //lblTime.Text = hCinco.ToShortTimeString();
                lblTime.Text = currenttime.ToShortTimeString();
                juegoHoras();
            }
            else
            {
                Response.Redirect("~/index.aspx");
            }
        }
        public string HighlightText(string InputTxt)
        {
            string Search_Str = txtSearch.Text;
            // Setup the regular expression and add the Or operator.
            Regex RegExp = new Regex(Search_Str.Replace(" ", "|").Trim(), RegexOptions.IgnoreCase);
            // Highlight keywords by calling the
            //delegate each time a keyword is found.
            return RegExp.Replace(InputTxt, new MatchEvaluator(ReplaceKeyWords));
        }

        public string ReplaceKeyWords(Match m)
        {
            return ("<span class=highlight>" + m.Value + "</span>");
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //  Set the value of the SearchString so it gets
            SearchString = txtSearch.Text;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            SearchString = txtSearch.Text;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //  Simple clean up text to return the Gridview to it's default state
            txtSearch.Text = "";
            SearchString = "";
            dgvSearch.DataBind();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            juegoHoras();
        }

        private void juegoHoras()
        {
            //Creamos las tres variables limites de actualización
            var dateNow = DateTime.Now;
            DateTime hOcho = new DateTime(dateNow.Year, dateNow.Month, dateNow.Day, 08, 00, 00);
            DateTime hDoce = new DateTime(dateNow.Year, dateNow.Month, dateNow.Day, 12, 00, 00);
            DateTime hCinco = new DateTime(dateNow.Year, dateNow.Month, dateNow.Day, 17, 00, 00);
            //currenttime = DateTime.Now;
            //Prueba de zona central
            TimeZoneInfo targetZone = TimeZoneInfo.FindSystemTimeZoneById("Central Standard Time");
            DateTime newDT = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, targetZone);
            currenttime = newDT.AddHours(-1);
            //
            lblActu.Text = "Reporte generado a las : " + currenttime.ToShortTimeString();
            //lblActu.Text = "Reporte generado a las : " + newDT.ToShortTimeString();
            //Si la hora coincide con la actuañ, se recargará la página
            if(dateNow == hOcho || dateNow == hDoce || dateNow == hCinco){
                Response.Redirect(Request.RawUrl);
            }
            //Comparación de horas con el current time
            if (currenttime < hOcho)
            {
                lblTime.Text = "La próxima actualización será a las 8:00 am";
                var restante = hOcho - currenttime;
                if (restante.Hours == 0)
                {
                    lblRest.Text = "Restan : " + restante.Minutes + " Minutos";
                }
                else
                {
                    lblRest.Text = "Restan : " + restante.Hours + " Horas con " + restante.Minutes + " Minutos";
                }
            }
            else if (currenttime > hOcho && currenttime < hDoce)
            {
                lblTime.Text = "La próxima actualización será a las 12:00 pm";
                var restante = hDoce - currenttime;
                if (restante.Hours == 0)
                {
                    lblRest.Text = "Restan : " + restante.Minutes + " Minutos";
                }
                else
                {
                    lblRest.Text = "Restan : " + restante.Hours + " Horas con " + restante.Minutes + " Minutos";
                }
            }
            else if (currenttime > hDoce && currenttime < hCinco)
            {
                lblTime.Text = "La próxima actualización será a las 5:00pm";
                var restante = hCinco - currenttime;
                if (restante.Hours == 0)
                {
                    lblRest.Text = "Restan : " + restante.Minutes + " Minutos";
                }
                else
                {
                    lblRest.Text = "Restan : " + restante.Hours + " Horas con " + restante.Minutes + " Minutos";
                }
            }
            else if (currenttime > hCinco)
            {
                lblTime.Text = "La próxima actualización será a las 8:00 am de mañana";
                //Nuevo proceso para obtener la fecha y hora de mañana
                var man = dateNow.Day + 1;
                DateTime hMan = new DateTime(dateNow.Year, dateNow.Month, man, 08, 00, 00);
                var restante = hMan - currenttime;
                lblRest.Text = "Restan : " + restante.Hours + " Horas con " + restante.Minutes + " Minutos";
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/index.aspx");
        }
    }
}