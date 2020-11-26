using _1714jschmitt2g;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace _1714jschmitt3b3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        System.Windows.Data.CollectionViewSource apartmentViewSource;
        System.Windows.Data.CollectionViewSource apartmentInvoicesViewSource;
        PropertyManager2ModelContainer dbContext;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            apartmentViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("apartmentViewSource")));
            apartmentInvoicesViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("apartmentInvoicesViewSource")));

            dbContext = new PropertyManager2ModelContainer();
            dbContext.Apartments.Load();
            apartmentViewSource.Source = dbContext.Apartments.Local;
            dbContext.Configuration.AutoDetectChangesEnabled = true;
            // Load data by setting the CollectionViewSource.Source property:
            // apartmentViewSource.Source = [generic data source]
        }

        private void FirstButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToFirst();
        }

        private void backButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToPrevious();
        }

        private void nextButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToNext();
        }

        private void lastButton_Click(object sender, RoutedEventArgs e)
        {
            apartmentViewSource.View.MoveCurrentToLast();
        }

        private void FirstButton1_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToFirst();
        }

        private void backButton1_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToPrevious();
        }

        private void nextButton1_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToNext();
        }

        private void lastButton1_Click(object sender, RoutedEventArgs e)
        {
            apartmentInvoicesViewSource.View.MoveCurrentToLast();
        }
    }
}
