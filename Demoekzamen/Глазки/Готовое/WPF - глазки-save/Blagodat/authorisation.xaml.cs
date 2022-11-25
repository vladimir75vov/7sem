﻿using System;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Blagodat
{
    /// <summary>
    /// Логика взаимодействия для authorisation.xaml
    /// </summary>
    public partial class authorisation : Page
    {
        public authorisation()
        {
            InitializeComponent();
            Classes.DataBaseConnect.modeldb = new Models.glazkiEntities();
        }

        private void Login(object sender, RoutedEventArgs e)
        {
            try
            {
                var userObj = Classes.DataBaseConnect.modeldb.User.FirstOrDefault(x => x.Login == login.Text && x.Password == passwd.Password);

                if (userObj != null)
                {
                    MessageBox.Show("Здравствуйте " + userObj.Role.Title + "," + userObj.Login, "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                    switch (userObj.ID)
                    {
                        case 1:
                            NavigationService.Navigate(new admin());
                            break;
                        case 2:
                            NavigationService.Navigate(new user());
                            break;
                        case 3:
                            NavigationService.Navigate(new manager());
                            break;
                        default:
                            MessageBox.Show("Данные не обнаружены!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Warning);
                            break;
                    }
                }
                else MessageBox.Show("Пользователя в БД нет", "Уведомление",MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            catch
            {

            }
        }
    }
}
