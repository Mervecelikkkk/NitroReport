using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace NitroReport
{
    /// <summary>
    /// Summary description for captcha
    /// </summary>
    public class captcha : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            Random r = new Random();


            int x = 0;
            int y = 0;
            int width = 120;
            int height = 45;
            string fontname = FontFamily.Families.ElementAt(r.Next(5, 10)).Name;
            List<Brush> colors = new List<Brush>();
            colors.Add(Brushes.Maroon);
            colors.Add(Brushes.DarkBlue);
            colors.Add(Brushes.DarkCyan);
            colors.Add(Brushes.DeepPink);

            int fontsize = r.Next(20, 28);



            Font font = new Font(fontname, fontsize);

            int sayi = r.Next(1000, 9999);
            HttpContext.Current.Session["captcha"] = sayi;

            SizeF size = new SizeF();

            using (Graphics temp = Graphics.FromHwnd(IntPtr.Zero))
            {
                size = temp.MeasureString(sayi.ToString(), font);
            }

            Bitmap bmp = new Bitmap(width, height);
            Graphics g = Graphics.FromImage(bmp);

            //System.Drawing.Image img = System.Drawing.Image.FromFile(arkaplanResmi);
            //g.DrawImage(img, 1, 1);
            g.DrawString(sayi.ToString(), font, colors[r.Next(0, 3)], r.Next(0, 15), r.Next(0, 15));
            g.CompositingQuality = CompositingQuality.HighQuality;
            //bmp.Save(Server.MapPath("images/captcha.png"), ImageFormat.Png);

            MemoryStream ms = new MemoryStream();
            bmp.Save(ms, ImageFormat.Png);


            context.Response.ContentType = "image/png";
            context.Response.BinaryWrite(ms.ToArray());

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}