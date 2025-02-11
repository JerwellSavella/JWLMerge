﻿using System.Collections.Generic;
using JWLMerge.ExcelServices.Models;

namespace JWLMerge.ExcelServices
{
    public interface IExcelService
    {
        ExportBibleNotesResult AppendToBibleNotesFile(
            string excelFilePath, 
            IReadOnlyCollection<BibleNote>? notes, 
            int startRow, 
            string backupFilePath);
    }
}
