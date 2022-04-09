using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using КУРСОВАЯ.Models;

namespace КУРСОВАЯ.Additional
{
    public class CarQueryInfo : INotifyPropertyChanged
    {
        private DateTime firstTime;

        public DateTime _firstTime
        {
            get { return firstTime; }
            set { firstTime = value; OnPropertyChanged("_firstTime"); }
        }

        private DateTime secondTime;

        public DateTime _secondTime
        {
            get { return secondTime; }
            set { secondTime = value; OnPropertyChanged("_secondTime"); }
        }


        private int carId;

        public int _carId
        {
            get { return carId; }
            set { carId = value; OnPropertyChanged("_carId"); }
        }

        private double mileage;

        public double _mileage
        {
            get { return mileage; }
            set { mileage = value; OnPropertyChanged("_mileage"); }
        }

        private string carNumber;

        public string _carNumber
        {
            get { return carNumber; }
            set { carNumber = value; OnPropertyChanged("_carNumber"); }
        }

        private string brand;

        public string _brand
        {
            get { return brand; }
            set { brand = value; OnPropertyChanged("_brand"); }
        }

        private string model;

        public string _model
        {
            get { return model; }
            set { model = value;OnPropertyChanged("_model") ; }
        }

        private double fuelConsumption;

        public double _fuelConsumption
        {
            get { return fuelConsumption; }
            set { fuelConsumption = value;OnPropertyChanged("_fuelConsumption"); }
        }

        private IList<object> queryResult;

        public IList<object> _queryResult
        {
            get { return queryResult; }
            set { queryResult = value; OnPropertyChanged("_queryResult"); }
        }

        private МодельТС queryResultRecord;

        public МодельТС _queryResultRecord
        {
            get { return queryResultRecord; }
            set { queryResultRecord = value; OnPropertyChanged("_queryResultRecord"); }
        }





        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged([CallerMemberName] string prop = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
