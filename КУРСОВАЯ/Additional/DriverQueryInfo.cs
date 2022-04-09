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
    internal class DriverQueryInfo : INotifyPropertyChanged
    {
        private int id;

        public int _id
        {
            get { return id; }
            set { id = value; OnPropertyChanged("_id"); }
        }

        private string name;

        public string _name
        {
            get { return name; }
            set { name = value; OnPropertyChanged("_name"); }
        }

        private string secondName;

        public string _secondName
        {
            get { return secondName; }
            set { secondName = value; OnPropertyChanged("_secondName"); }
        }

        private string patronymic;

        public string _patronymic
        {
            get { return patronymic; }
            set { patronymic = value; OnPropertyChanged("_patronymic"); }
        }

        private string dateOfBirth;

        public string _dateOfBirth
        {
            get { return dateOfBirth; }
            set { dateOfBirth = value; OnPropertyChanged("_dateOfBirth"); }
        }

        private Водитель driverCard;

        public Водитель _driverCard
        {
            get { return driverCard; }
            set { driverCard = value; OnPropertyChanged("_driverCard"); }
        }



        public event PropertyChangedEventHandler PropertyChanged;

        public void OnPropertyChanged([CallerMemberName] string prop = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }
    }
}
