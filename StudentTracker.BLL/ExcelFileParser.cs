using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Excel;
using OfficeOpenXml;

namespace StudentTracker.BLL
{
    public class ExcelFileParser
    {
        public List<RawStudentInformation> StudentsRowInformation { get; private set; }
        
        public ExcelFileParser(Stream inputStream)
        {
            StudentsRowInformation = new List<RawStudentInformation>();
            using (var excel = new ExcelPackage(inputStream))
            {
                foreach (ExcelWorksheet worksheet in excel.Workbook.Worksheets)
                {
                    for (int i = 1; i <= worksheet.Dimension.End.Row; i++)
                    {
                        var infoRow = worksheet.Cells[i, 1, i, worksheet.Dimension.End.Column];
                        StudentsRowInformation.Add(new RawStudentInformation
                        {
                            FirstName = infoRow[String.Format("A{0}", i)].Text.Trim(),
                            LastName = infoRow[String.Format("B{0}", i)].Text.Trim(),
                            Sex = infoRow[String.Format("C{0}", i)].Text.Trim(),
                            Age = infoRow[String.Format("D{0}", i)].Text.Trim()
                        });
                    }
                }
            }
        }
    }
}
