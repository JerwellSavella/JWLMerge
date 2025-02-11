﻿namespace JWLMerge.Tests
{
    using System.Collections.Generic;
    using System.Linq;
    using BackupFileServices.Helpers;
    using BackupFileServices.Models;
    using BackupFileServices.Models.DatabaseModels;
    using Microsoft.VisualStudio.TestTools.UnitTesting;

    [TestClass]
    public class TestImportNotes : TestBase
    {
        [TestMethod]
        public void TestImport1()
        {
            const int numRecords = 100;
            
            var file1 = CreateMockBackup(numRecords);
            var notes = CreateMockBibleNotes().ToArray();
            var mockImportOptions = new ImportBibleNotesParams();

            const int mepsLanguageId = 0;

            var importer = new NotesImporter(
                file1.Database, 
                "nwtsty", 
                mepsLanguageId,
                mockImportOptions);

            var result = importer.Import(notes);

            file1.Database.CheckValidity();

            Assert.AreEqual(notes.Length, result.BibleNotesAdded);
            Assert.IsTrue(result.BibleNotesUnchanged == 0);
            Assert.IsTrue(result.BibleNotesUpdated == 0);

            result = importer.Import(notes);

            Assert.AreEqual(notes.Length, result.BibleNotesUnchanged);
            Assert.IsTrue(result.BibleNotesAdded == 0);
            Assert.IsTrue(result.BibleNotesUpdated == 0);
        }

        private static IEnumerable<BibleNote> CreateMockBibleNotes()
        {
            return new List<BibleNote>
            {
                new()
                {
                    BookChapterAndVerse = new BibleBookChapterAndVerse(1, 1, 1),
                    NoteTitle = "A note 1",
                    NoteContent = "My notes go here",
                },
                new()
                {
                    BookChapterAndVerse = new BibleBookChapterAndVerse(2, 2, 2),
                    NoteTitle = "A note 2",
                    NoteContent = "My notes go here",
                },
            };
        }
    }
}
