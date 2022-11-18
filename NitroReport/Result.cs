using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;

namespace NitroReport
{
    public class Result
    {
        public int resultcode { get; set; }
        public string resulttext { get; set; }
        public object resultdata { get; set; }
    }
}