//
//  birthdaybaxiCal.swift
//  coredataPRaci
//
//  Created by 2015 MBP 16GB 256GB on 1/5/23.
//

import SwiftUI
import CoreData
import Foundation


class birthdaybaxiCal {
    
    
    
    func extractDateComponents(date: Date, entity: FruitEntity) -> (Int, Int, Int, String) {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let day = calendar.component(.day, from: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let time = formatter.string(from: entity.birthday ?? Date())
        return (year, month, day, time)
    }
    
    
    
    func extractDateComponentsYear(dateComponents: (Int, Int, Int,  String)) -> Int {
        return dateComponents.0
    }///example : 2022
    func extractDateComponentsMonth(dateComponents: (Int, Int,Int,String)) -> Int {
        return dateComponents.1
    }///example : jan
    func extractDateComponentsDay(dateComponents: (Int, Int, Int, String)) -> Int {
        return dateComponents.2
    }/// example: 10
    
    func extractDateComponentsTime(dateComponents: (Int, Int, Int, String)) -> String {
        return dateComponents.3
    }///example:"11:32"
    
    func evaluateData(year: Int, month: Int, day: Int) ->(String){
        let oneTothree = Array(1...3)
        let oneTofour = Array(1...4)
        let oneTofive = Array(1...5)
        let oneTosix = Array(1...6)
        let oneTotwo = Array (1...2)
        let oneToseven = Array(1...7)
        let oneTo8 = Array(1...8)
        var shoukan = [Int:[Int]]()
        var haru = [Int:[Int]]()
        var jingzhe = [Int:[Int]]()
        var qingming = [Int:[Int]]()
        var tachinatsu = [Int:[Int]]()
        var mangzhong = [Int:[Int]]()
        var sSummer = [Int:[Int]]()
        var liqiu = [Int:[Int]]()
        var bailu = [Int:[Int]]()
        var frostDrop = [Int:[Int]]()
        var liDong = [Int:[Int]]()
        var bigSnow = [Int:[Int]]()
        
        let shoukanyears4 = [1949, 1953, 1957, 1961, 1965, 1969, 1973, 1977, 1981, 1985, 1986, 1989, 1990, 1994, 1998, 2001, 2002, 2005, 2009, 2010, 2013, 2014, 2018, 2019, 2017, 2021, 2022, 2023, 2025, 2026, 2027, 2029, 2030, 2031, 2033, 2034, 2035, 2037, 2038, 2039, 2041, 2042, 2043]
        let shoukanyears5 = [1900,1901,1902,1903,1905,1906,1907,1909,1910,1911,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926,1927,1928,1929,1930,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1944,1945,1946,1947,1948,1950,1952,1954,1955,1956,1958,1959,1960,1962,1963,1964,1966,1967,1968,1970,1971,1972,1974,1975,1976,1978,1979,1980,1982,1983,1984,1987,1988,1991,1992,1995,1996,1999,2000,2003,2004,2007,2008,2011,2012,2015,2016,2020,2024,
        2028, 2032,2036,2040,2044,2048]
        let shoukanyears6 = [1904,1908,1912]
        
        let haruyear3 = [1900,1901,1905, 1909, 1913, 1914,1917,1918,1921,1922,1925,1926,1930,1933,1934,1937,1938,1941,1942,1945,1946,1947,1949,1950,1951,1953,1954,1955,1957,1958,1959
        ,1961,1962,1963,1965,1966,1967,1969,1970,1971,1973,1974,1975,1977,1978,1979,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2012,2013,2014,2015,2016,2018,2019,2020,2022,2023,2024,2026,2027,2028,2030,2031,2032,2034,2035,2036,2038,2039
        ,2040,2042,2043,2044,2046,2047,2048]
        let haruyear4 = [1902, 1903,1904,1906,1907,1908,1910,1911,1912,1915,1916,1919,1920,1923,1924,1927,1928,1931,1932,1935,1936,1939,1940,1943,1944,1948,1952,1956,1960,1964,1968,1972,1976,1980]
        let haruyear2 = [2017,2021,2025,2029,2033,2037,2041,2045,2049,2050]
        
        
        let jingzheyear6 = [1903,1907,1911]
        let jingzheyear5 = [1900,1901,1902,1904,1905,1906,1908,1909,1910,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926,1927,1928,1929,1930,1931,1932,1933
        ,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1944,1945,1946,1947,1949,1950,1951,1953,1954,1955,1957,1958,1959,1961,1962,1963,1965,1966,1967,1969,1970,1971,1973,1974
        ,1975,1977,1978,1979,1981,1982,1983,1986,1987,1990,1991,1994,1995,1998,1999,2002,2003,2006,2007,2010,2011,2014,2015,2019,2023,2027,2031,2035,2039,2043,2047]
        let jingzheyear4 = [1948,1952,1956,1960,1964,1968,1972,1976,1980,1984,1985,1988,1989,1992,1993,1997,1996,2000,2001,2004,2005,2008,2009,2014,2013,2016,2017,2018,2020,2021,2022
        ,2024,2025,2026,2028,2029,2030,2032,2033,2034,2036,2037,2038,2040,2041,2042,2044,2045,2048,2049,2050]
        
        
        let qingming3 = [1976,1980,1984,1988,1992,1996,2000,2004,2008,2009,2012,2013,2016,2017,2020,2021,2024,2025,2028,2029,2032,2033,2036,2037,2040,2044,2045,
        2046,2048,2049,2050]
        let qingming4 = [1900, 1901, 1904, 1905, 1908,1909, 1912,1913, 1914, 1916, 1917, 1918, 1920, 1921, 1922, 1924, 1925, 1926, 1928, 1929, 1930, 1932, 1933, 1934, 1936, 1937,
                         1938, 1940,1941, 1942, 1944, 1945, 1946, 1947, 1948, 1949, 1950,1951, 1952, 1953, 1954, 1955, 1956 , 1957, 1958, 1959 , 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968,1969, 1970, 1971, 1972, 1973, 1974, 1975, 1977,1978,1979,1981,1982,1983,1985,1986,1987,1989,1990,1991,1993,1994,1995,1997,1998,2001,
        2002,2003,2005,2006,2007,2010,2011,2014,2015,2018,2019,2022,2023,2026,2027, 2030,2031,2034,2035,2038,2039,2043,2047]
        let qingming5 = [1902,1903,1906,1907,1910,1911,1915,1919,1923,1927,1931,1935,1939,1943]
        
        
        
        let tachinatsu4 = [1944,1948, 1952, 1956,1960, 1964, 1968, 1972, 1976, 1980, 1981, 1984, 1985, 1988, 1989, 1992, 1993, 1996, 1997, 2000, 2001, 2004, 2005, 2008, 2009, 2010,
        2012, 2013, 2014, 2016, 2017, 2018, 2020,2021, 2022, 2024, 2025, 2026, 2028, 2029, 2030, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045,
        2046, 2047]
        let tachinatsu5 = [1900,1901,1902,1904,1905,1906,1908,1909,1910,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926
                           ,1927,1928,1929,1930,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1945,1946,1947,1949,1950,1951,1953
        ,1954,1955,1957,1958,1959,1961,1962,1963,1965,1966,1967,1969,1970,1971,1974,1975,1978,1979,1982,1983,1986,1987,1991,1994,1995,1999,2002,2003,2007,2011,2015,2019,2023,2027, 2031]
        let tachinatsu6 = [1903,1907,1911]
        
        let mangzhong5 = [1900,1901,1904,1905,1906,1908,1909,1910,1912,1913,1914,1916,1917,1918,1920,1921,1922,1924,1925,1926,1928,1929,1930,1932,1933,1934,1935,1936,1937,1938,1939,
        1940,1941,1942,1943,1944,1945,1946,1947,1948,1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1970,1971,1973,1974,1975,1977,
        1978,1979,1981,1982,1983,1985,1986,1987,1989,1990,1991,1993,1994,1995,1998,1999,2002,2003,2006,2007,2010,2011,2014,2015,2018,2019,2022,2023,2027,2031,2035,2039,2043,2047]
        let mangzhong6 = [1902,1903,1907,1911,1915,1919,1923,1927,1931]
        let mangzhong4 = [1968,1976,1980,1984,1992,1996,1997,2000,2001,2004,2005,2008,2009,2012,2013,2016,2017,2020,2024,2025,2026,2028,2029,
        2030,2031,2032,2033,2034,2036,2037,2038,2040,2041,2044,2045,2048,2049,2050]
        
        let sSummer5 = [2020,2024,2028,2032,2036,2040,2044]
        let sSummer6 = [1900,1904,1908,1910,1912,1916,1924,1928,1929,1932,1933,1936,1937
        ,1940,1941,1944,1945,1948,1949,1952,1953,1956,1957,1958,1960,1961,1962
        ,1964,1965, 1966, 1968, 1969, 1970, 1972, 1973, 1974, 1976, 1977, 1978
        ,1980,1981,1982,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994
        ,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006, 2007, 2008,2009
        ,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2021,2022,2023,2025
        ,2026,2027,2029,2030,2031,2033,2034,2035,2037,2038,2039,2041,2042,2043,
        2045,2046,2047]
        let sSummer7 = [1901,1902,
        1903,1904,1905,1906,1909,1911,1913,1914,1915,1917,1918,1919
        ,1920,1921,1922,1923,1925,1926,1927,1930,1931,1934,1935,1938,1939,1942,
        1943,1946,1947,1950,1951,1954,1955,1959, 1963, 1967, 1971, 1975,1979,1983]

        let liqiu6 = [1948,1952, 1956, 1960, 1964,1968,1972,1976, 1977, 1980, 1981, 1984
        ,1985 , 1988, 1989, 1992, 1993, 1996, 1997, 1998, 2000, 2001, 2004, 2005, 2006
        , 2008, 2009, 2010, 2012,2013,2014, 2016, 2017,2018 , 2020, 2021, 2022,2024,2025,
        2026, 2028, 2029, 2030, 2032, 2033, 2034, 2035, 2036,2037,2038,2039,2040, 2041,
        2042,2043,2044,2045,2046,2047]
        let liqiu7 = [1900,1901, 1902, 1903,1904,1905,1906,1908,1909,1910,1912,1913,
        1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926,1927,1928,
        1929,1930,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,
        1944,1945,1946,1947,1949,1950,1951,1953,1954,1955,1957,1958,1959,1961,1962,1963
        ,1965, 1966,1967,1969,1970,1971, 1973 ,1974, 1975, 1978, 1979, 1982, 1983, 1986
        , 1987, 1990, 1991, 1994, 1995, 1999, 2002, 2003, 2007, 2011, 2015, 2019, 2023
        , 2027, 2031,]
        let liqiu8 = [1907,1911]
        
        let bailu6 = [1960,1964,1968,1972,1976,1980,1984,1988,1989,1992,1993,1996,1997
        ,2000,2001,2004,2005,2008,2009,2012,2013,2016,2017,2020,2021,2022,2024,2025,
        2026,2028,2029,2030,2032,2033,2034,2036,2037,2038,2040,2041,2042,2044,2045,2046]
        let bailu7 = [1900,1901,1902, 1904,1905,1906,1907, 1908,1909,1910,1912,1913,1914
        ,1916, 1917,1918,1920,1921,1922,1924,1925,1926,1929,1930,1931, 1932,1933,1934,1935,1936, 1937, 1938, 1939, 1940, 1941,1942, 1943,1944, 1945,1946, 1947, 1948, 1949, 1950, 1951, 1952,1953,1954,1955,1956,1957,1958,1959
        ,1961,1962,1963,1965,1966,1967,1969,1970,1971,1973,1974,1975,1977,1978,1979
        ,1981,1982,1983,1985,1986,1987,1990,1991,1994,1995,1998,1999,2002,2003,2006
        ,2007,2010,2011,2014,2015,2018,2019,2023,2027,2035,2039,2043,2047]
        let bailu8 = [1903,1911,1915,1919,1923,1927,1928,2031]
        
        let frostDrop8 = [1900,1901,1902,1903,1904,1905,1906,1907,1908,1909,1910,1911,1912,1913,1914,1915, 1917, 1918, 1919, 1921, 1922, 1923, 1925, 1926, 1927, 1929, 1930, 1931,
        1933, 1934, 1935, 1937, 1938, 1939, 1941, 1942, 1943, 1946, 1947, 1950, 1951, 1954, 1955, 1958, 1959, 1962, 1963, 1966, 1967, 1970, 1971, 1974, 1975, 1979,1983, 1987,1991,
        1995,1999, 2003, 2007]
        let frostDrop7 = [1916, 1920, 1924, 1928, 1932, 1936, 1937, 1940, 1944,1945, 1948, 1949, 1952, 1953, 1956, 1957,1960, 1961, 1964, 1965, 1968, 1969,1972, 1973, 1976
        ,1977, 1978,1980,1981,1982,1984, 1985, 1986, 1988,1989, 1990, 1992,1993, 1994, 1996, 1997, 1998,2000, 2001, 2002, 2005,2006, 2008,2009,2010,2011,2012,2013,2014, 2015, 2016
        ,2017,2018,2019,2020,2021,2022, 2023, 2024, 2025, 2026, 2027, 2028,2029,2030,2031,2032,2033,2034,2035,236,2037,2038,2039, 2041,2042,2043, 2045,2046,2047]
        let frostDrop6 = [2040, 2044]
        let liDong6 = [1928,1932,1940, 1944, 1948 , 1936, 1940, 1952, 1956,1960, 1961, 1964, 1965, 1968, 1969, 1972, 1973, 1976, 1977, 1980, 1981, 1984, 1985, 1988, 1989, 1992,
        1993, 1994, 1996, 1997, 1998, 2000, 2001, 2002, 2004, 2005, 2006, 2008, 2009,2010, 2012, 2013,2014, 2016,2017, 2018, 2020, 2021,2022, 2024,2025,2026,2027, 2028, 2029, 2030,
        2031,2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2047, 2048, 2049, 2050]
        let liDong7 = [1900,1901,1902,1903,1904,1905,1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921, 1922, 1923, 1924, 1925,
        1926, 1927, 1929,1930,1931, 1933, 1934, 1935, 1937, 1938, 1939, 1941,1942, 1943, 1945, 1947, 1949, 1950, 1951, 1953, 1954, 1955, 1957, 1958, 1959, 1962, 1963, 1966,
        1967, 1970, 1971, 1974, 1975, 1978, 1979, 1982, 1983, 1986, 1987, 1990, 1991, 1995, 1999, 2003, 2007, 2011, 2015, 2019, 2023]

        let snow5 = [2020, 2024, 2028, 2032, 2036, 2040, 2044,2048]
        let snow6 = [1900, 1904, 1906, 1912, 1916, 1920, 1921, 1924, 1925, 1928, 1929, 1932, 1933, 1936, 1937, 1940,1941, 1944, 1945, 1948,1949,1950,1951,1952,1953,1954,1956
        ,1957,1958, 1960, 1961,1962,1963, 1964,1965,1966,1968, 1969, 1970, 1972, 1973, 1974, 1976, 1977, 1978, 1980, 1981, 1982, 1984,1985,1986,1987,1988,1989,1990, 1991, 1992,1993,
        1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006,2007,2008, 2009,2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2021,2022,2023,
        2025,2026,2027, 2029, 2030, 2031, 2033,2034,2035,2037,2038, 2039,2041,2042,2045,2047,2047]
        let snow7 = [1901,1902, 1903, 1905, 1906, 1907, 1909,1910,1911, 1913, 1914, 1915, 1917, 1918, 1919, 1922, 1923, 1926, 1927, 1930, 1931, 1934, 1935, 1938, 1939, 1943, 1946
        ,1947,1950,1951, 1955, 1959, 1967, 1971, 1975, 1979, 1983]
        
        
        for l in liDong6 {
            liDong[l] = oneTosix}
        for l in liDong7 {
            liDong[l] = oneToseven}
        
        for snow in snow5{
            bigSnow[snow] = oneTofive}
        for snow in snow6{
            bigSnow[snow] = oneTosix}
        for snow in snow7{
            bigSnow[snow] = oneToseven}
        
        
        for f in frostDrop6 {
            frostDrop[f] = oneTosix}
        for f in frostDrop7 {
            frostDrop[f] = oneToseven}
        for f in frostDrop8 {
            frostDrop[f] = oneTo8}
        
        for b in bailu6{
            bailu[b] = oneTosix}
        for b in bailu7{
            bailu[b] = oneToseven}
        for b in bailu8{
            bailu[b] = oneTo8}
        
        for l in liqiu6 {
            liqiu[l] = oneTosix}
        for l in liqiu7 {
            liqiu[l] = oneToseven}
        for l in liqiu8 {
            liqiu[l] = oneTo8}
        
        
        
        for shoukanyear in shoukanyears4 {
        shoukan[shoukanyear] = oneTofour}
        for shoukanyear in shoukanyears5 {
        shoukan[shoukanyear] = oneTofive}
        //assign specific days to shoukanyear
        for shoukanyear in shoukanyears6 {
            shoukan[shoukanyear] = oneTosix}
        
        for haruyear in haruyear4 {
            haru[haruyear] = oneTofour}
        for haruyear in haruyear2{
            haru[haruyear] = oneTotwo }
        for haruyear in haruyear3{
            haru[haruyear] = oneTothree }
        
        for jingzheyear in jingzheyear4 {
            jingzhe[jingzheyear] = oneTofour}
        for jingzheyear in jingzheyear5 {
            jingzhe[jingzheyear] = oneTofive}
        for jingzheyear in jingzheyear6 {
            jingzhe[jingzheyear] = oneTosix}
        
        for qingmingyear in qingming3 {
            qingming[qingmingyear] = oneTothree}
        for qingmingyear in qingming4 {
            qingming[qingmingyear] = oneTofour}
        for qingmingyear in qingming5 {
            qingming[qingmingyear] = oneTofive}
        
        
        for tachinatsuyear in tachinatsu4{
            tachinatsu[tachinatsuyear] = oneTofour}
        for tachinatsuyear in tachinatsu5{
            tachinatsu[tachinatsuyear] = oneTofive}
        for tachinatsuyear in tachinatsu6{
            tachinatsu[tachinatsuyear] = oneTosix}
        for mangzhongyear in mangzhong5{
            mangzhong[mangzhongyear] = oneTofive}
        for mangzhongyear in mangzhong4{
            mangzhong[mangzhongyear] = oneTofour}
        for mangzhongyear in mangzhong6{
            mangzhong[mangzhongyear] = oneTosix}
        for s in sSummer5 {
        sSummer[s] = oneTofive}
        for s in sSummer6 {
        sSummer[s] = oneTosix}
        for s in sSummer7 {
        sSummer[s] = oneToseven}
        
        for b in bailu6{
            bailu[b] = oneTosix}
        for b in bailu7{
            bailu[b] = oneToseven}
        for b in bailu8{
            bailu[b] = oneTo8}
        
        for l in liqiu6 {
            liqiu[l] = oneTosix}
        for l in liqiu7 {
            liqiu[l] = oneToseven}
        for l in liqiu8 {
            liqiu[l] = oneTo8}
        
        
        let year = extractDateComponentsYear(dateComponents: (year, month, day, ""))
        let month = extractDateComponentsMonth(dateComponents: (year, month, day, ""))
        let day = extractDateComponentsDay(dateComponents: (year, month, day, ""))
        var monthWord:String = " "
        var thefinalword:String = " "
        if month == 1 {
                
                for (key, value) in shoukan {
                    if key == year {
                        if value.contains(day) {
//                            print("in shoukan")
                           
                            thefinalword = getBaxiMonthTop2(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)

                            return thefinalword + monthWord
                        }
                        else{
                            
                            thefinalword = getBaxiMonthTopJan(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                  
                }
            
        }
        if month == 2{
                
                for (key, value) in haru {
                    if key == year {
                        if value.contains(day) {
//                            print("haru")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                            
                        }
                        thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                        monthWord = getBaxiMonthbot(month: month)
                        return thefinalword + monthWord
                    }
                }
            
        }
        if month == 3 {
            
                for (key, value) in jingzhe {
                    if key == year {
                        if value.contains(day) {
//                            print("jinzhe")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
            
        }
        if month == 4 {
            
                for (key, value) in qingming {
                    if key == year {
                        if value.contains(day) {
//                            print("qingming")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        }else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                        
                    }
            }
            
        }
        if month == 5 {
           
                for (key, value) in tachinatsu {
                    if key == year {
                        if value.contains(day) {
//                            print("qingming")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
        }
        if month == 6 {
            
                for (key, value) in mangzhong {
                    if key == year {
                        if value.contains(day) {
//                            print("mangzhong")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
                
        }
        if month == 7 {
            
                for (key, value) in sSummer {
                    if key == year {
                        if value.contains(day) {
//                            print("mangzhong")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
                
        }
        
        if month == 8 {
            
                for (key, value) in liqiu {
                    if key == year {
                        if value.contains(day) {
//                            print("mangzhong")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
                
        }
        if month == 9 {
            
                for (key, value) in bailu {
                    if key == year {
                        if value.contains(day) {
//                            print("mangzhong")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword =  getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
                
        }
        if month == 10 {
            
                for (key, value) in frostDrop {
                    if key == year {
                        if value.contains(day) {
//                            print("mangzhong")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
                
        }
        if month == 11 {
            
                for (key, value) in liDong {
                    if key == year {
                        if value.contains(day) {
//                            print("mangzhong")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
        }
        if month == 12 {
            
                for (key, value) in bigSnow {
                    if key == year {
                        if value.contains(day) {
//                            print("mangzhong")
                            thefinalword = getBaxiMonthTopMinus(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiPrevMonthbot(month: month)
                            return thefinalword + monthWord
                        } else {
                            thefinalword = getBaxiMonthTop(getBaxiyear:getBaxiyear, year: year, thatmonth: month)
                            monthWord = getBaxiMonthbot(month: month)
                            return thefinalword + monthWord
                        }
                    }
                }
        }
        
        return thefinalword + monthWord
    }
    
    
    
    ////https://baike.baidu.com/item/天干地支/278140
    ////:the website to calculate Baxi, year, day and time
    ///////https://www.163.com/dy/article/G5FA0FGK0532D4MK.html
    ////:website to calculate the month
    let yearStems = [
        
            1900: 9, 1901: 14, 1902:19, 1903:24,
            1904: 30, 1905: 35, 1906:40, 1907:45,
            1908: 51, 1909: 56, 1910:1, 1911:6,
            1912: 12, 1913: 17, 1914:22, 1915:27,
            1916: 33, 1917: 38, 1918: 43, 1919: 48,
            1920: 54, 1921: 59, 1922: 4, 1923:9,
            1924: 15, 1925: 20, 1926: 25, 1927: 30,
            1928: 36, 1929: 41, 1930: 46, 1931: 51,
            1932: 57, 1933: 2, 1934: 7, 1935: 12,
            1936: 18, 1937: 23, 1938: 28, 1939:33,
            1940: 39, 1941:44, 1942: 49, 1943: 54,
            1944: 0, 1945:5, 1946: 10, 1947: 15,
            1948: 21, 1949: 26,
            1950: 31, 1951: 36, 1952: 42, 1953: 47,
            1954: 52, 1955: 57, 1956: 3, 1957: 8,
            1958: 13, 1959: 18, 1960: 24, 1961: 29,
            1962: 34, 1963: 39, 1964: 45, 1965: 50,
            1966: 55, 1967: 0, 1968: 6, 1969: 11,
            1970: 16, 1971: 21, 1972: 27, 1973: 32,
            1974: 37, 1975: 42, 1976: 48, 1977: 53,
            1978: 58, 1979: 3, 1980: 9, 1981: 14,
            1982: 19, 1983: 24, 1984: 30, 1985: 35,
            1986: 40, 1987: 45, 1988: 51, 1989: 56,
            1990: 1, 1991: 6, 1992: 12, 1993: 17,
            1994: 22, 1995: 27, 1996: 33, 1997: 38,
            1998: 43, 1999: 48, 2000: 54, 2001: 59,
            2002: 4, 2003: 9, 2004: 15, 2005: 20,
            2006: 25, 2007: 30, 2008: 36, 2009: 41,
            2010: 46, 2011: 51, 2012: 57, 2013: 2,
            2014: 7, 2015: 12, 2016: 18, 2017: 23,
            2018: 28, 2019: 33, 2020: 39, 2021: 44,
            2022: 49, 2023: 54, 2024: 0, 2025: 5,
            2026: 10, 2027: 15, 2028: 21, 2029: 26,
            2030: 31, 2031: 36, 2032: 42, 2033: 47,
            2034: 52, 2035: 57, 2036: 3, 2037: 8,
            2038: 13, 2039: 18, 2040: 24, 2041: 29,
            2042: 34, 2043: 39, 2044: 45, 2045: 50,
            2046: 55, 2047: 0, 2048: 6, 2049: 11

    ]

    let monthdata = [1:6,2:37, 3:0,4:31,5:1,6:32,7:2, 8:33, 9:4,10:34, 11:5, 12:35]
    let data = [
        1: "甲子",2: "乙丑",3: "丙寅",4: "丁卯",5: "戊辰",6: "己巳",7: "庚午",8: "辛未",9: "壬申",
        10: "癸酉",11: "甲戌",12: "乙亥",13: "丙子",14: "丁丑",15: "戊寅",16: "己卯",17: "庚辰",
        18: "辛巳",19: "壬午",20: "癸未",21: "甲申",22: "乙酉",23: "丙戌",24: "丁亥",25: "戊子",
        26: "己丑",27: "庚寅",28: "辛卯",29: "壬辰",30: "癸巳",31: "甲午",32: "乙未",33: "丙申",
        34: "丁酉",35: "戊戌",36: "己亥",37: "庚子",38: "辛丑",39: "壬寅",40: "癸卯",41: "甲辰",
        42: "乙巳",43: "丙午",44: "丁未",45: "戊申",46: "己酉",47: "庚戌",48: "辛亥",49: "壬子",
        50: "癸丑",51: "甲寅",52: "乙卯",53: "丙辰",54: "丁巳",55: "戊午",56: "己未",57: "庚申",
        58: "辛酉",59: "壬戌",60: "癸亥"]

    let 天干 = ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
    let 地支 = ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]

    func getBaxiyearbot(year: Int, month:Int) -> (String) {
        var newYear = year
        if (month == 1){
              newYear -= 1
          }
        var calyearb: String
        if ((newYear - 3) % 12 != 0){
            let year = (newYear-3) % 12
            calyearb = 地支[year - 1]
        }else {
            calyearb = 地支.last ?? ""
        }
        return calyearb
    }


    func getBaxiyear(year: Int, month:Int) -> (String) {
        var newYear = year
        if (month == 1){
              newYear -= 1
          }
        var calyear: String
        if ((newYear - 3) % 10 != 0) {
            let newYear = (newYear-3) % 10
            calyear = 天干[newYear - 1]
        } else {
            calyear = 天干.last ?? ""
        }
        return calyear
    }
    func getBaxiMonthTop(getBaxiyear:(Int, Int) -> String ,year: Int, thatmonth:Int) -> String{
        var newjiazhi = ""
        var newyigeng = ""
        var newbingxin = ""
        var newdingRen = ""
        var newPentadecyl = ""
        let yigeng = ["","丁","戊", "己", "庚", "辛", "壬", "癸", "甲", "乙","丙", "丁","戊" ]
        let jiazhi = ["","乙","丙", "丁", "戊", "己", "庚", "辛", "壬", "癸", "甲", "乙","丙"]
        let bingxin = ["","己","庚", "辛", "壬", "癸", "甲", "乙","丙", "丁","戊", "己", "庚"]
        let dingRen = ["","辛","壬", "癸", "甲", "乙","丙", "丁","戊", "己", "庚", "辛","壬"]
        let pentadecyl = ["","癸","甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸","甲"]
        let result = getBaxiyear(year, thatmonth)
        switch result {
        case "甲", "己" :
            newjiazhi = jiazhi[thatmonth]
            break
        case "乙","庚":
            newyigeng = yigeng[thatmonth]
            break
        case "丙","辛":
            newbingxin = bingxin[thatmonth]
            break
        case "丁","壬":
            newdingRen = dingRen[thatmonth]
            break
        case "戊","癸":
            newPentadecyl = pentadecyl[thatmonth]
            break
        default:
            break
        }
        
        return newyigeng+newbingxin+newdingRen+newjiazhi+newPentadecyl
    }
    func getBaxiMonthTop2(getBaxiyear:(Int, Int) -> String ,year: Int, thatmonth:Int) -> String{
        var newjiazhi = ""
        var newyigeng = ""
        var newbingxin = ""
        var newdingRen = ""
        var newPentadecyl = ""
        let result = getBaxiyear(year, thatmonth)
        switch result {
        case "甲", "己" :
            newjiazhi = "丙"
            break
        case "乙","庚":
            newyigeng = "戊"
            break
        case "丙","辛":
            newbingxin = "庚"
            break
        case "丁","壬":
            newdingRen = "壬"
            break
        case "戊","癸":
            newPentadecyl = "甲"
            break
        default:
            break
        }
        
        return newyigeng+newbingxin+newdingRen+newjiazhi+newPentadecyl
    }
    func getBaxiMonthTopJan(getBaxiyear:(Int, Int) -> String ,year: Int, thatmonth:Int) -> String{
        var newjiazhi = ""
        var newyigeng = ""
        var newbingxin = ""
        var newdingRen = ""
        var newPentadecyl = ""
        let result = getBaxiyear(year, thatmonth)
        switch result {
        case "甲", "己" :
            newjiazhi = "丁"
            break
        case "乙","庚":
            newyigeng = "己"
            break
        case "丙","辛":
            newbingxin = "辛"
            break
        case "丁","壬":
            newdingRen = "癸"
            break
        case "戊","癸":
            newPentadecyl = "乙"
            break
        default:
            break
        }
        
        return newyigeng+newbingxin+newdingRen+newjiazhi+newPentadecyl
    }
    func getBaxiMonthTopMinus(getBaxiyear:(Int, Int) -> String ,year: Int, thatmonth:Int) -> String{
        var newjiazhi = ""
        var newyigeng = ""
        var newbingxin = ""
        var newdingRen = ""
        var newPentadecyl = ""
        let lunarMonth = thatmonth - 1
        let yigeng = ["","丁","戊", "己", "庚", "辛", "壬", "癸", "甲", "乙","丙", "丁","戊" ]
        let jiazhi = ["","乙","丙", "丁", "戊", "己", "庚", "辛", "壬", "癸", "甲", "乙","丙"]
        let bingxin = ["","己","庚", "辛", "壬", "癸", "甲", "乙","丙", "丁","戊", "己", "庚"]
        let dingRen = ["","辛","壬", "癸", "甲", "乙","丙", "丁","戊", "己", "庚", "辛","壬"]
        let pentadecyl = ["","癸","甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸","甲"]
        let result = getBaxiyear(year, thatmonth)
        switch result {
        case "甲", "己" :
            newjiazhi = jiazhi[lunarMonth]
            break
        case "乙","庚":
            newyigeng = yigeng[lunarMonth]
            break
        case "丙","辛":
            newbingxin = bingxin[lunarMonth]
            break
        case "丁","壬":
            newdingRen = dingRen[lunarMonth]
            break
        case "戊","癸":
            newPentadecyl = pentadecyl[lunarMonth]
            break
        default:
            break
        }
        
        return newyigeng+newbingxin+newdingRen+newjiazhi+newPentadecyl
    }
    
    func getBaxiPrevMonthbot(month:Int) ->String{
        var di:String = ""
        switch month {
        case 1:
            di = "子"
        case 2:
            di = "丑"
        case 3:
            di = "寅"
        case 4:
            di = "卯"
        case 5:
            di = "辰"
        case 6:
            di = "巳"
        case 7:
            di = "午"
        case 8:
            di = "未"
        case 9:
            di = "申"
        case 10:
            di = "酉"
        case 11:
            di = "戌"
        case 12:
            di = "亥"
        default:
            di = "未"}
        return di
    }


    func getBaxiMonthbot(month:Int) ->String{
        var di:String = ""
        if month == 12 {
            di = 地支.first ?? ""
        } else {
            di = 地支[month]
        }
        return di
    }
    func getBaxiTimebot(time: String) -> String {
      let hourMinute = time.split(separator: ":", maxSplits: 1).map { String($0) }
      let hour = Int(hourMinute[0])!
        _ = Int(hourMinute[1])!
      // Calculate the number of hours since midnight
      let hoursSinceMidnight = hour
      // Determine the correct 地支
      let baxiTime: String
      switch hoursSinceMidnight {
      case 23, 0:
          baxiTime = "子"
        case 1, 2:
          baxiTime = "丑"
        case 3, 4:
          baxiTime = "寅"
        case 5, 6:
          baxiTime = "卯"
        case 7, 8:
          baxiTime = "辰"
        case 9, 10:
          baxiTime = "巳"
        case 11, 12:
          baxiTime = "午"
        case 13, 14:
          baxiTime = "未"
        case 15, 16:
          baxiTime = "申"
        case 17, 18:
          baxiTime = "酉"
        case 19, 20:
          baxiTime = "戌"
        case 21, 22:
          baxiTime =  "亥"
        default:
          baxiTime = "Invalid time"
      }
      return baxiTime
    }

        func getBaxitime(year: Int, month: Int, day: Int, time: String) -> (String) {
                let baxiTime = getBaxiTimebot(time: time)
                let baxiDay = getbaxiDay(year: year, month: month, day: day)
                let fc = String(baxiDay[baxiDay.startIndex])
                let index = ((天干.firstIndex(of: fc)!+1) * 2) //
                let dinex = (地支.firstIndex(of: baxiTime)!)
                let result = ((dinex + index) - 2) % 10
                return 天干[result]
            }
        func getbaxiDay(year: Int, month: Int, day: Int) -> String {
            let yearToUse = month == 1 || month == 2 ? year - 1 : year
            let yearStem = yearStems[yearToUse] ?? 0
            let monthStem = monthdata[month] ?? 0
            var stem = (yearStem + monthStem + day)
            if stem > 60 {
                stem = stem % 60
            }
            return data[stem] ?? ""
        }
    
   
}


