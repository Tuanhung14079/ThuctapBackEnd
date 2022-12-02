using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CartonManeger.Page_Parameters
{
    public class PageParameters
    {
        const int maxPagesize = 50;
        public int PageNumber { get; set; } = 1;
        private int _pagesize = 10;
        public int PageSize
        {
            get
            {
                return _pagesize;
            }
            set
            {
                _pagesize = (value > maxPagesize) ? maxPagesize : value;
            }
        }
    }
}
