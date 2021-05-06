import UIKit

//: # Home Work 7

/*:
 ## Задание 1
 1.1 Создайте перечисление `CalculationType`, содержащее четыре математических действия — *сложение*, *вычитание*, *умножение* и *деление*.
 */
enum CalculationType: String {
    case addition = "cложения"
    case subtraction = "вычитания"
    case multiplication = "умножения"
    case division = "деления"
}
//: 1.2 Напишите функцию возвращающую `Int` и принимающую в качестве параметров три значения: число один, число два и тип математической операции. Внутри функции, в зависимости от значения параметра `CalculationType` выполните соответствующую математическую операцию с константами и верните результат. Реализуйте функцию таким образом, что бы при каждом её вызове на консоль выводилось сообщение следующего содержания: «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>».
func calculate (numberOne: Int, numberTwo: Int, calculationType: CalculationType) -> Int? {
    
    let result: Int
    
    switch calculationType {
    case .addition:
        result = numberOne + numberTwo
    case .subtraction:
        result =  numberOne - numberTwo
    case .multiplication:
        result =  numberOne * numberTwo
    case .division:
        if numberTwo != 0 {
            result =  numberOne / numberTwo
        } else {
            print("На ноль делить нельзя")
            return nil
        }
    }
    
    print("Результат \(calculationType.rawValue) \(numberOne) и \(numberTwo) равен \(result)")
    return result
}
//: 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности.
calculate(numberOne: 4, numberTwo: 6, calculationType: .addition)
calculate(numberOne: 4, numberTwo: 6, calculationType: .division)
calculate(numberOne: 4, numberTwo: 6, calculationType: .multiplication)
calculate(numberOne: 4, numberTwo: 6, calculationType: .subtraction)
/*:
 ## Задание 2
 2.1 Создайте перечисление `CurrencyUnit` со следующими кейсами: `rouble`, `dollar`, `euro`.
 
 Внутри перечисления `CurrencyUnit` создайте еще одно перечисление `DollarCountrys`, в котором содержиться перчень стран-эмитентов (USA, Canada, Australia).
 
 Рубль и Евро должны иметь ассоциативный параметры следующего типа: `([String], String)`. Массив должен содеражать перечень стран, в которых катируется валюта, а тип стринг - аббривиатуру валюты.
 
 Доллар должен иметь на один ассоциативный параметр больше, в соответствии с перечислением `DollarCountrys`.
 */
enum CurrencyUnit {
    case rouble(
            countries: [String],
            currencyCode: String
         )
    case dollar(
            countries: [String],
            currencyCode: String,
            emitentsCountry: DollarCountrys
         )
    case euro(
            countries: [String],
            currencyCode: String
         )
    
    enum DollarCountrys: String {
        case usa = "Доллар США"
        case canada = "Канадский доллар"
        case australia = "Австралийский доллар"
    }
}


/*:

 2.2 Создайте экземпляр `dollarCurrency` и присвойете ему значения относящиеся к доллару.
 */

let dollarCurrency = CurrencyUnit.dollar(
    countries: ["США", "Доминикана", "Куба"],
    currencyCode: "USD",
    emitentsCountry: .usa
)

let rubbleCurrency = CurrencyUnit.rouble(
    countries: ["Россия"],
    currencyCode: "RU"
)

print(type(of: dollarCurrency))

/*: 2.3 Создайте функцию, которая должна принимать валюту и выводить на консоль информацию о ней, например: "Доллар США. Катируется в: США, Доминикана, Куба. Краткое наименование: USD. Для рубля и евро нужно будет определить только список стран и аббривиатуру валюты.
*/
func createCurrencyDescription (currencyUnit: CurrencyUnit) -> String {
    switch currencyUnit {
    case let .dollar(countries, currencyCode, emitentsCountry):
        return """
            \(emitentsCountry.rawValue).
            Катируется в: \(countries.joined(separator: ", ")).
            Краткое наименование: \(currencyCode).
            """
    case let .euro(countries, currencyCode),
         let .rouble(countries, currencyCode):
        return """
            Катируется в: \(countries.joined(separator: ", ")).
            Краткое наименование: \(currencyCode).
            """
    }
}

print(createCurrencyDescription(currencyUnit: dollarCurrency))
print(createCurrencyDescription(currencyUnit: rubbleCurrency))
/*:
 ## Задание 3
 3.1 Создайте структуру `ChessPlayer` со следующими свойствами:
 - `name: String`
 - `wins: Int`
 - `description: String`
 
 Свойство `description` должно возвращать сообщение с именем игрока и количеством его побед.
 
 Так же необходимо реализовать метод `addWins` который должен увеличивать количество побед на переданное в него значение.
  */
struct ChessPlayer {
    let name: String
    private(set) var wins: Int
    
    var description: String {
        "Имя \(name) и вот количество его побед \(wins)"
    }
    
    mutating func addWins(countOfWins: Int) {
        wins += countOfWins
    }
}
/*:
 3.2 Создайте экзмепляр струкутуры и инициализируйте её свойства. Выведите значение свойства `description` на консоль, а затем вызовите метод `addWins`. Снова выведите значение свойства `description` на консоль.
*/
var chessPlayer = ChessPlayer(name: "Jordan", wins: 0)
print(chessPlayer.description)

chessPlayer.addWins(countOfWins: 4)
print(chessPlayer.description)
