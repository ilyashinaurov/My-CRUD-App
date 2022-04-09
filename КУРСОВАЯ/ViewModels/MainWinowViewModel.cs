using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using КУРСОВАЯ.Views;
using КУРСОВАЯ.Views.Car;

namespace КУРСОВАЯ.ViewModels
{
    internal class MainWindowViewModel : INotifyPropertyChanged
    {

        private Page driverList;

        private Page driverCard;

        private Page driverReportList;

        private Page ordersList;

        private Page newOrder;

        private Page carList;

        private Page carCard;

        private Page carFuelConsuptionPeriod;

        private Page currentPage;

        
        public Page _currentPage
        {
            get { return currentPage; }
            set { currentPage = value; OnPropertyChanged("_currentPage"); }
        }

        public MainWindowViewModel()
        {
            driverList = new Page1();
            driverCard = new driverCardPage();
            driverReportList = new reportCardPage(); 
            ordersList = new ordersListPage();
            newOrder = new newOrderPage();
            carList = new carListPage();
            carCard = new carCardPage();
            carFuelConsuptionPeriod = new carFuelconsumptionPeriodPage(); 
        }

        private RelayCommand getCarCard;

        public RelayCommand _getCarCard
        {
            get
            {
                return getCarCard ??
                  (getCarCard = new RelayCommand(obj =>
                  {
                      _currentPage = carCard;

                  }));
            }
        }

        private RelayCommand getCarList;

        public RelayCommand _getCarList
        {
            get
            {
                return getCarList ??
                  (getCarList = new RelayCommand(obj =>
                  {
                      _currentPage = carList;

                  }));
            }
        }



        private RelayCommand getDriverList; // команда добавления записи

        public RelayCommand _getDriverList // геттер, как работает пока не ясно т_т
        {
            get
            {
                return getDriverList ??
                  (getDriverList = new RelayCommand(obj =>
                  {
                      _currentPage = driverList;
                      
                  }));
            }
        }

        private RelayCommand getDriverCard; // команда добавления записи

        public RelayCommand _getDriverCard // геттер, как работает пока не ясно т_т
        {
            get
            {
                return getDriverCard ??
                  (getDriverCard = new RelayCommand(obj =>
                  {
                      _currentPage = driverCard;

                  }));
            }
        }

        private RelayCommand getDriverReportList; // команда добавления записи

        public RelayCommand _getDriverReportList // геттер, как работает пока не ясно т_т
        {
            get
            {
                return getDriverReportList ??
                  (getDriverReportList = new RelayCommand(obj =>
                  {
                      _currentPage = driverReportList;

                  }));
            }
        }

        private RelayCommand getOrdersList; // команда добавления записи

        public RelayCommand _getOrdersList // геттер, как работает пока не ясно т_т
        {
            get
            {
                return getOrdersList ??
                  (getOrdersList = new RelayCommand(obj =>
                  {
                      _currentPage = ordersList;

                  }));
            }
        }

        private RelayCommand getNewOrder; // команда добавления записи

        public RelayCommand _getNewOrder // геттер, как работает пока не ясно т_т
        {
            get
            {
                return getNewOrder ??
                  (getNewOrder = new RelayCommand(obj =>
                  {
                      _currentPage = newOrder;

                  }));
            }
        }

        private RelayCommand getcarFuelConsuptionPeriod; // команда добавления записи

        public RelayCommand _getcarFuelConsuptionPeriod // геттер, как работает пока не ясно т_т
        {
            get
            {
                return getcarFuelConsuptionPeriod ??
                  (getcarFuelConsuptionPeriod = new RelayCommand(obj =>
                  {
                      _currentPage = carFuelConsuptionPeriod;

                  }));
            }
        }



        

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
