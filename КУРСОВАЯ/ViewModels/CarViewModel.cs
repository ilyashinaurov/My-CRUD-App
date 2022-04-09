using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using КУРСОВАЯ.Additional;
using КУРСОВАЯ.Models;

namespace КУРСОВАЯ.ViewModels
{
    public class CarViewModel : INotifyPropertyChanged
    {
        private TransportCompanyEntities transportCompanyEntities;
        
        private ObservableCollection<ТС> carList;

        public ObservableCollection<ТС> _carList
        {
            get { return carList; }
            set { carList = value; OnPropertyChanged("_driverList"); }
        }

        private CarQueryInfo carCard;

        public CarQueryInfo _carCard
        {
            get { return carCard; }
            set { carCard = value; OnPropertyChanged("_carCard"); }
        }

        private CarQueryInfo carFuelPeriod;

        public CarQueryInfo _carFuelPeriod
        {
            get { return carFuelPeriod; }
            set { carFuelPeriod = value; OnPropertyChanged("carFuelPeriod"); }
        }


        private CarQueryInfo mileagePeriod;

        public CarQueryInfo _mileagePeriod
        {
            get { return mileagePeriod; }
            set { mileagePeriod = value; OnPropertyChanged("mileagePeriod"); }
        }



        public CarViewModel()
        {
            transportCompanyEntities = new TransportCompanyEntities();
            Load();
        }

        private void Load()
        {
            _carList = new ObservableCollection<ТС>(transportCompanyEntities.ТС);
            _carCard = new CarQueryInfo();
            _carFuelPeriod = new CarQueryInfo();
            _mileagePeriod = new CarQueryInfo();

        }

        // команды

        private RelayCommand getCarCard; // команда добавления записи

        public RelayCommand _getCarCard // геттер, как работает пока не ясно т_т
        {
            get
            {
                return getCarCard ??
                  (getCarCard = new RelayCommand(obj =>
                  {
                      var test = (from Car in transportCompanyEntities.ТС
                                  join CarModel in transportCompanyEntities.МодельТС on Car.КодМоделиТС equals CarModel.КодМоделиТС
                                  select new { Car.Госномер, CarModel.Марка, CarModel.Модель, CarModel.Расход });
                      var record = test.Where(u => u.Госномер == _carCard._carNumber).ToList();

                      foreach (var item in record)
                      {
                          _carCard._brand = item.Марка;
                          _carCard._model = item.Модель;
                          _carCard._fuelConsumption = item.Расход;
                      }


                  }));
            }
        }

        private RelayCommand getFuelconsumptionPeriod; // команда добавления записи

        public RelayCommand _getFuelconsumptionPeriod// геттер, как работает пока не ясно т_т
        {
            get
            {
                return getFuelconsumptionPeriod ??
                  (getFuelconsumptionPeriod = new RelayCommand(obj =>
                  {
                      _carFuelPeriod._queryResult = transportCompanyEntities.РасходТС2Период(_carFuelPeriod._firstTime, _carFuelPeriod._secondTime).ToList<object>();
                  }));
            }
        }

        private RelayCommand getMileagePeriod; // команда добавления записи

        public RelayCommand _getMileagePeriod// геттер, как работает пока не ясно т_т
        {
            get
            {
                return getMileagePeriod ??
                  (getMileagePeriod = new RelayCommand(obj =>
                  {
                      _mileagePeriod._queryResult = transportCompanyEntities.ПробегТСПериод(_mileagePeriod._firstTime, _mileagePeriod._secondTime).ToList<object>();
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
