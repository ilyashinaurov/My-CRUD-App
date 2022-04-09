using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace КУРСОВАЯ.ViewModels
{
     public static class Static
     {
        public static OrderViewModel orderView;

        public static CarViewModel carView;

       

        static Static()
        {
            orderView = new OrderViewModel();
            carView = new CarViewModel();
            
        }

     }
}
