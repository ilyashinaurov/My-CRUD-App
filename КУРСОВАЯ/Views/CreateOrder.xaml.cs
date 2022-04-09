using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using КУРСОВАЯ.ViewModels;

namespace КУРСОВАЯ.Views
{
    /// <summary>
    /// Логика взаимодействия для CreateOrder.xaml
    /// </summary>
    public partial class CreateOrder : Window
    {
        public CreateOrder()
        {
            InitializeComponent();
            ClearTextBoxes();

            DataContext = new OrderViewModel();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ClearTextBoxes();
        }
        void ClearTextBoxes()
        {
            box1.Clear();
            box2.Clear();
            box2.Clear();
            box3.Clear();
            box4.Clear();
            box5.Clear();
            box6.Clear();
            box7.Clear();
            box8.Clear();
        }
    }
}
