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
    internal class DriverViewModel : INotifyPropertyChanged
    {
        private TransportCompanyEntities transportCompanyEntities;

        private Водитель selectedDriver; // конкретный Водитель

        public Водитель _selectedDriver
        {
            get { return selectedDriver; }
            set { selectedDriver = value; OnPropertyChanged("_selectedDriver"); }
        }

        private ObservableCollection<Водитель> driverList;

        public ObservableCollection<Водитель> _driverList
        {
            get { return driverList; }
            set { driverList = value; OnPropertyChanged("_driverList"); }
        }   

        private DriverQueryInfo driverQueryInfo;

        public DriverQueryInfo  _driverQueryInfo
        {
            get { return driverQueryInfo; }
            set { driverQueryInfo = value; OnPropertyChanged("_driverQueryInfo"); }
        }

        public DriverViewModel()
        {
            transportCompanyEntities = new TransportCompanyEntities();
            Load();
        }

        private void Load() //задает контекст, загружает лист и заказ
        {
            _driverList = new ObservableCollection<Водитель>(transportCompanyEntities.Водитель);
            _selectedDriver = new Водитель();
            _driverQueryInfo = new DriverQueryInfo();
            _reportCard = (from t1 in transportCompanyEntities.Заказ
                           join t2 in transportCompanyEntities.Водитель on t1.КодВодителя equals t2.КодВодителя
                           select new { t2.Имя, t2.Фамилия, t1.Дата, t1.ДатаНачала, t1.ДатаОкончания }).ToList<object>();
        }



        // КОММАНДЫ



        private RelayCommand addDriver; // команда добавления записи

        public RelayCommand _addDriver // геттер, как работает пока не ясно т_т
        {
            get
            {
                return addDriver ??
                  (addDriver = new RelayCommand(obj =>
                  {

                      transportCompanyEntities.Водитель.Add(_selectedDriver);
                      transportCompanyEntities.SaveChanges();
                      _driverList.Add(_selectedDriver);
                      _selectedDriver = new Водитель();
                  }));
            }
        }

        private RelayCommand getDriverCard;

        public RelayCommand _getDriverCard
        {
            get
            {
                return getDriverCard ??
                  (getDriverCard = new RelayCommand(obj =>
                  {
                      driverQueryInfo._driverCard = transportCompanyEntities.Водитель.Find(driverQueryInfo._id);
                      
                  }));
            }
        }

        private IList<object> reportCard;

        public IList<object> _reportCard
        {
            get { return reportCard; }
            set { reportCard = value; OnPropertyChanged("_reportCard"); }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
