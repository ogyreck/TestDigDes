using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace TestDesDig
{
    class Program
    {
        static void Main(string[] args)
        {
            // Путь до файла с тестом .\Test.txt
            Console.WriteLine("Введите путь до файла с текстом:");
            string filePath = Console.ReadLine();
            Dictionary<string, int> uniqueWords = new Dictionary<string, int>();

            try
            {
                using (StreamReader sr = new StreamReader(filePath))
                {
                    string line;
                    while ((line = sr.ReadLine()) != null)
                    {
                        line = line.ToLower();
                        string[] words = Regex.Split(line, @"(?=[\p{P}\s\d])[^’]");
                        foreach (string word in words)

                        {
                            if (!string.IsNullOrEmpty(word))
                            {
                                if (uniqueWords.ContainsKey(word))
                                {
                                    uniqueWords[word]++;
                                }

                                else
                                {
                                    uniqueWords.Add(word, 1);
                                }

                            }
                        }
                    }
                }

                // Сортируем слова по убыванию количества употреблений и записываем в выходной файл
                var sortedWords = uniqueWords.OrderByDescending(x => x.Value);
                string outputFilePath = Path.GetDirectoryName(filePath) + "/UniqueWords.txt";
                using (StreamWriter sw = new StreamWriter(outputFilePath))
                {
                    foreach (var word in sortedWords)
                    {
                        sw.WriteLine($"{word.Key}: {word.Value}");
                    }
                }

                Console.WriteLine($"Файл, с уникальными словами сохранен по пути {outputFilePath}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Произошла ошибка во время чтения файла {ex.Message}");
            }
        }
    }
}