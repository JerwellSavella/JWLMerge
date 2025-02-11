﻿namespace JWLMerge.ViewModel
{
    using MaterialDesignThemes.Wpf;
    using Microsoft.Toolkit.Mvvm.ComponentModel;
    using Microsoft.Toolkit.Mvvm.Input;

    // ReSharper disable once ClassNeverInstantiated.Global
    internal sealed class RedactNotesPromptViewModel : ObservableObject
    {
        public RedactNotesPromptViewModel()
        {
            YesCommand = new RelayCommand(Yes);
            NoCommand = new RelayCommand(No);
        }

        public RelayCommand YesCommand { get; }

        public RelayCommand NoCommand { get; }

        public bool Result { get; private set; }

        private void No()
        {
            Result = false;
            DialogHost.CloseDialogCommand.Execute(null, null);
        }

        private void Yes()
        {
            Result = true;
            DialogHost.CloseDialogCommand.Execute(null, null);
        }
    }
}
