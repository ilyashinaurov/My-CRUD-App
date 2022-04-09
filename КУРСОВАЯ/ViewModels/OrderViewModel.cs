using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using КУРСОВАЯ.Models;

namespace КУРСОВАЯ.ViewModels
{
    public class OrderViewModel : INotifyPropertyChanged
    {
        private ObservableCollection<Заказ> orderList; //список записей в таблице Заказ
        private Заказ selectedOrder; //конкретный запись в Заказ
        private TransportCompanyEntities transportCompanyEntities; // контекст? 
     
        public Заказ _selectedOrder // геттер и сеттер записи
        {
            get { return selectedOrder; }
            set
            {
                selectedOrder = value;      
                OnPropertyChanged("_selectedOrder");
            }

        }  
        public ObservableCollection<Заказ> _orderList // геттер и сеттер листа Заказов
        {
            get { return orderList; }
            set
            {
                orderList = value;
                OnPropertyChanged("_orderList") ;
            }
            
        }   

        public OrderViewModel() // конструктор
        {
            transportCompanyEntities = new TransportCompanyEntities();
            Load();
           
        }

        private void Load() //задает контекст, загружает лист и заказ
        {
            _orderList = new ObservableCollection<Заказ>(transportCompanyEntities.Заказ);
            _selectedOrder = new Заказ();
        }

        private RelayCommand addCommand; // команда добавления записи

        public RelayCommand _addCommand // геттер, как работает пока не ясно т_т
        {
            get
            {
                return addCommand ??
                  (addCommand = new RelayCommand(obj =>
                  {
                      
                      transportCompanyEntities.Заказ.Add(_selectedOrder);
                      transportCompanyEntities.SaveChanges();
                      _orderList.Add(_selectedOrder);
                      _selectedOrder = new Заказ();
                  }));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop=null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }


        
    }
}
        
