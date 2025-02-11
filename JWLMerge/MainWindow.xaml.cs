﻿namespace JWLMerge
{
    using System.ComponentModel;
    using System.Windows;
    using Messages;
    using Microsoft.Toolkit.Mvvm.Messaging;

    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void PanelOnDragOver(object sender, DragEventArgs e)
        {
            WeakReferenceMessenger.Default.Send(new DragOverMessage(e));
        }

        private void PanelOnDrop(object sender, DragEventArgs e)
        {
            WeakReferenceMessenger.Default.Send(new DragDropMessage(e));
        }

        private void MainWindowOnClosing(object sender, CancelEventArgs e)
        {
            WeakReferenceMessenger.Default.Send(new MainWindowClosingMessage(e));
        }
    }
}
