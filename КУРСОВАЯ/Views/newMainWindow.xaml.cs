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
    /// Логика взаимодействия для newMainWindow.xaml
    /// </summary>
    public partial class newMainWindow : Window
    {
        public newMainWindow()
        {
            InitializeComponent();
            DataContext = new MainWindowViewModel();
        }
    }
}
