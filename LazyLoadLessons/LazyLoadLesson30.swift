/**
  Создание массива случайных чисел.
  По умолчанию длина массива = 10.
*/
func makeRandomArray(_ length: Int = 10) -> [Int] {
  var arr: [Int] = []
  
  for _ in 1...length {
    arr.append(Int.random(in: 1...100))
  }
  
  return arr
}

/**
 Поиск максимального элемента в массиве
*/
func maxItemInArray(_ arr: [Int]) -> Int {
  var res = arr[0]
  for e in arr {
    if res < e {
      res =
e    }
  }
  
  return res
}

/**
 Возведение в квадрат. Новый массив.
 */
func squareItemArray(_ arr: [Int]) -> [Int] {
  var res: [Int] = []
  
  for e in arr {
    res.append(e * e)
  }
  
  return res
}

/**
 Возведение в квадрат в этом же массиве.
 */
func squareItemArraySelf(_ arr: inout [Int]) {
  for i in 0 ..< arr.count {
    arr[i] = arr[i] * arr[i]
  }
}

/*
 Удалить чётные значения
 */
func removeEvenInArray(_ arr: [Int]) -> [Int] {
  var res: [Int] = []
  
  for e in arr {
    if e % 2 != 0 {
      res.append(e)
    }
  }
  
  return res
}

/**
 Включение в массив случайным образом значение из первого массива
 */
func includeInArray(_ arrForModify: [Int], _ arrSource: [Int]) -> [Int] {
  var arrNew = arrForModify
  
  for e in arrSource {
    let needInclude = Int.random(in: 0...1) == 1
    if needInclude {
      arrNew.append(e)
    }
  }
  
  return arrNew
}

/**
 Сортировка пузырьком.
  - Parameter arr: Сортируемый массив
  - Returns: Отсортированный массив
 */
func bubbleSort(_ arr: [Int]) -> [Int] {
  var res = arr
  
  var lastIdx = arr.count - 1
  var i = 0
  
  while i < lastIdx {
    if res[i] > res[i + 1] {
      let temp = res[i]
      res[i] = res[i + 1]
      res[i + 1] = temp
    }
    i += 1
    
    if(i == lastIdx) {
      i = 0
      lastIdx += -1
    }
  }
  
  return res
}


/**
 Обмен данных двух числовых массивов.
 Предполагается, что размеры массивов совпадают
 - Parameters:
   - firstArr: первый изменяемый массив.
   - secondArr: второй изменяемый массив.
 */
func exchangeArrays(_ firstArr: inout [Int], _ secondArr: inout [Int]) {
  for i in 0..<firstArr.count {
    let temp = firstArr[i]
    firstArr[i] = secondArr[i]
    secondArr[i] = temp
  }
}

func runLesson30() {
  print("Lesson 30 begin ----------------------------\n")
  
  print("Создание массива случайных чисел:")
  var arr = makeRandomArray()
  print(arr)
  
  print("\nПоиск максимального значения:")
  print(maxItemInArray(arr))
  
//  squareItemArraySelf(&arr)
//  print(arr)
  
  print("\nВозвдение каждого элемента в квадрат:")
  print(squareItemArray(arr))
  
  print("\nУдалить чётные элементы:")
  print(removeEvenInArray(arr))
  
  print("\nНовый массив:")
  var arrNew = makeRandomArray()
  print(arrNew)
  
  print("\nВключение некоторых(случайных) элементов в первый массив:")
  print(includeInArray(arr, arrNew))
  
  print("\nСортировка пузырьком")
  print(bubbleSort(arr))
  
  print("\nОбмен двух массивов:")
  
  print("\nДо:")
  print(arr, arrNew)
  
  exchangeArrays(&arr, &arrNew)
  
  print("\nПосле:")
  print(arr, arrNew)
  
  print("\nСоздадим два новых массива и включим в них некоторые элементы из двух исходных:")
  let arrYet1 = makeRandomArray()
  let arrYet2 = makeRandomArray()
  print("arrYe1:", arrYet1, "arrYet2", arrYet2, "array for arrYet1:", arr, "array for arrYet2:", arrNew)
  
  print("\nAfter")
  print(includeInArray(arrYet1, arr), includeInArray(arrYet2, arrNew))
  
  print("\nLesson 30 end ----------------------------\n")
}

