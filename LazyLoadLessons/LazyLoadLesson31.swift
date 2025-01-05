import Darwin

var matrix = [
  [" ", " ", " "],
  [" ", " ", " "],
  [" ", " ", " "]
]

var curPlayer = ""

var curPlayerName = ""

func getReadLine(_ message: String) -> String {
  var result = ""
  while result == "" {
    print(message + "(Для выхода из программы наберите Выйти или q(Q) ):")
    result = readLine() ?? ""
    
    if ["Выйти", "q", "Q"].contains(result) {
      exit(0)
    }
  }
  
  return result
}

func printBoard() {
  var idxRow = 0
  while idxRow < 3 {
    let row = matrix[idxRow]
    print("\(row[0]) | \(row[1]) | \(row[2])")
    idxRow += 1
    if idxRow < 3 {
      print("---------")
    }
  }
}

func quit(_ command: String) -> Bool {
  return ["Выйти", "выйти", "q", "Q"].contains(command)
}

func printWin() {
  print("Игрок \(curPlayerName) выиграл. Ура!!!")
  printBoard()
  exit(0)
}

func checkWin(_ player: String) {
  var win = false
  
  //Проход по рядам
  for i in 0 ..< 3 {
    win = matrix[i].count(where: {$0 == player}) == 3
    if win {
      printWin()
    }
  }
  
  //Проход по столбцам
  for i in 0 ..< 3 {
    win = matrix[0][i] == player && matrix[1][i] == player && matrix[2][i] == player
    if win {
      printWin()
    }
  }
  
  //Провека по диагонали
  if matrix[1][1] == player {
    win = matrix[0][0] == player && matrix[2][2] == player
    if win {
      printWin()
    }
    
    win = matrix[0][2] == player && matrix[2][0] == player
    if win {
      printWin()
    }
  }
}

func setStep(_ player: String) {
  while true {
    print("""
          Введите число от 1 до 3(ряд), запятую, второе число от 1 до 3 - номер колонки: 
          например: 1,1. (Для выхода наберите q(Q). Для печати текущего состояния наберите p, print или cur:
         """
    )
    printBoard()
    
    guard let str = readLine() else {
      print("Строка не должна быть нулевой(nil)")
      break
    }
    
    if quit(str) {
      exit(0)
    }
    
    if ["p", "print", "cur"].contains(str) {
      printBoard()
      continue
    }
    
    let rowCol = str.split(separator: ",")
    
    if rowCol.count == 2 {
      guard let row = Int(rowCol[0]), let col = Int(rowCol[1]), (1...3).contains(row), (1...3).contains(col) else {
        print("Неправильно введены данные\n")
        continue
      }
      
      if matrix[row - 1][col - 1] != " " {
        print("Ячейка \(row) \(col) уже занята")
        continue
      }
      
      matrix[row - 1][col - 1] = player
      
      checkWin(player)
      
//      print("Введены данные \(row), \(col)")
      
      break
    } else {
      print("Неправильно введены данные\n")
      continue
    }
    
  }
}

func canStep() -> Bool {
  for i in 0 ..< 3 {
    for j in 0 ..< 3 {
      if matrix[i][j] == " " {
        return true
      }
    }
  }
  
  return false
}

func playCrossZero() {
  let playerX = getReadLine("Введите имя первого игрока(будет играть X)")
  let playerO = getReadLine("Введите имя второго игрока(будет играть O)")
  
  curPlayer = "X"
  curPlayerName = playerX
  
  while canStep() {
    print("\nХодит игрок \(curPlayerName)(\(curPlayer))")
    setStep(curPlayer)
    
    if curPlayer == "X" {
      curPlayer = "O"
      curPlayerName = playerO
    } else {
      curPlayer = "X"
      curPlayerName = playerX
    }
  }
  
  print("\n Ничья)")
  printBoard()
  
}


func runLesson31() {
  playCrossZero()
}
