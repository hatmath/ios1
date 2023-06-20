// EXERCICES - SEMAINE 3
print("Semaine 3 - Exercices!")

// 1- Fonctions
// Exercice 1 : Calcul de la somme
// Écrivez une fonction nommée calculerSomme qui prend deux paramètres entiers a et b, et retourne
// la somme de ces deux nombres.
print("Exercices 1.1")
func calculerSomme(a: Int, b: Int) -> Int {
  return a + b
}
print(calculerSomme(a:5,b:5))

// Exercice 2 : Vérification de la parité
// Écrivez une fonction nommée estPair qui prend un paramètre entier nombre et retourne true si le
// nombre est pair, et false sinon.
print("Exercices 1.2")
func estPair(_ a: Int) -> Bool {
  return a%2 == 0
}
print(estPair(5))

// Exercice 3 : Conversion de Celsius en Fahrenheit
// Écrivez une fonction nommée convertirEnFahrenheit qui prend un paramètre de type Double
// représentant une température en degrés Celsius, et retourne la valeur équivalente en degrés
// Fahrenheit.
print("Exercices 1.3")
func convertirEnFahrenheit(celcius: Double) -> Double {
  return (celcius * 1.8) + 32
}
print(convertirEnFahrenheit(celcius: 28.0))

// Exercice 4 : Calcul de la factorielle
// Écrivez une fonction nommée calculerFactorielle qui prend un paramètre entier n et retourne la
// factorielle de ce nombre.
print("Exercices 1.4")
func calculerFactorielle(n entier: Int) -> Int {
  var factorielle: Int = 1
  for x in 1...entier {
    factorielle = factorielle*x
  }
  return factorielle
}
print(calculerFactorielle(n:4))

// Exercice 5 : Vérification de la présence d’un élément dans un tableau
// Écrivez une fonction nommée verifierPresence qui prend un paramètre de type Int nommé element
// et un tableau d’entiers nommé tableau, et retourne true si l’élément est présent dans le tableau, et
// false sinon.
print("Exercices 1.4")
func verifierPresence(e element: Int, t tableau: [Int]) -> Bool {
  return tableau.contains(element)
}
print(verifierPresence(e:4,t:[1,2,3]))

// 2- Gestion des erreurs
// Exercice 1 : Validation d’un code PIN
// Écrivez une fonction nommée validerCodePIN qui prend un paramètre de type String représentant
// un code PIN à quatre chiffres. La fonction doit vérifier si le code PIN est valide en appliquant les
// règles suivantes : - Le code PIN doit avoir exactement quatre caractères. - Tous les caractères du
// code PIN doivent être des chiffres de 0 à 9. Si le code PIN est valide, la fonction doit renvoyer true,
// sinon elle doit renvoyer false.
print("Exercices 2.1")
print(validerCodePIN(pin: "a1b2"))
print(validerCodePIN(pin: "0189"))

func validerCodePIN(pin: String) -> Bool {
  let chiffres: Set<Character> = ["0","1","2","3","4","5","6","7","8","9"]   
  var valide: Bool = true
  if pin.count == 4 {
    for caractere in pin {
      if !chiffres.contains(caractere) {
        valide = false
      }
    }
  } else {valide = false}
  return valide
}

// Exercice 2 : Conversion de chaîne en entier
// Écrivez une fonction nommée convertirEnEntier qui prend un paramètre de type String
// représentant un nombre entier. La fonction doit convertir la chaîne en un entier et le renvoyer. Si
// la conversion échoue, la fonction doit renvoyer nil.
print("Exercices 2.2")
print("En commentaire pcq warning")
// print(convertirEnEntier(nbEntier: "1234"))
// print(convertirEnEntier(nbEntier: "abcd"))

// func convertirEnEntier(nbEntier: String) -> Int? {
//   do {
//     let entier: Int?
//     try entier = Int(nbEntier)
//       return entier
//     } catch {
//       return nil
//     }
// }

// Exercice 3 : Division sécurisée
// Écrivez une fonction nommée diviserSécurisée qui prend deux paramètres de type Double,
// numérateur et dénominateur, et effectue la division entre eux. La fonction doit gérer l’erreur lorsque
// le dénominateur est égal à zéro en lançant une erreur de type ErreurDivisionParZero. Cette erreur
// devrait être définie comme une énumération avec un cas unique.
print("Exercices 2.3")

enum Division: Error {
  case ErreurDivisionParZero
}

func diviserSecurisee(numerateur: Double, denominateur: Double) throws -> Double {  
  if denominateur == 0 {
    throw Division.ErreurDivisionParZero
  } else {
    return numerateur / denominateur    
  }
}

var div: Double
var nume: Double = 5
var deno: Double = 1
do {
  div = try diviserSecurisee(numerateur: nume, denominateur: deno)  
  print("Division de \(nume) par \(deno) = " + String(div))
  deno = 0 
  div = try diviserSecurisee(numerateur: nume, denominateur: deno)  
} catch Division.ErreurDivisionParZero {
  print("Division par zéro")
} catch {
  print("oh nooo!")
}

// Exercice 4 : Recherche d’un élément dans un tableau
// Écrivez une fonction nommée rechercherElement qui prend un paramètre de type Int nommé
// élément et un tableau d’entiers nommé tableau. La fonction doit rechercher la première occurrence
// de l’élément dans le tableau et renvoyer son index. Si l’élément n’est pas trouvé, la fonction doit
// lancer une erreur de type ElementNonTrouvé.
print("Exercices 2.4")

enum Recherche: Error {
  case ElementNonTrouve
}

func rechercherElement(element: Int, tableau: [Int]) throws -> Int {
  var index: Int?
  index = tableau.firstIndex(of: element)
  if index == nil {
    throw Recherche.ElementNonTrouve
  }
  return index!
}

var x: Int = 4
var tab: [Int] = [1,2,3]
var index: Int
do {
  index = try rechercherElement(element: x, tableau: tab)  
  // print("Index dans le tableau \(tab) de \(x) est: \(index)")
} catch Recherche.ElementNonTrouve {
  print("Élement \(x) non trouvé dans le tableau \(tab)")
} catch {
  print("oh nooo!")
}

// Exercice 5 : Traitement d’un fichier CSV
// Imaginez que vous devez écrire une fonction qui lit un fichier CSV et effectue un traitement sur les
// données. Écrivez le prototype de cette fonction en précisant les paramètres nécessaires et le type de
// valeur renvoyée. Indiquez également les erreurs potentielles qui peuvent se produire lors de la
// lecture du fichier.
print("Exercices 2.5")
let prototype = """
// prototypage
enum Lecture: Error {
  case fichierNonTrouve
  case fichierIllisible
}

func lireFichier(cheminNom: String, type: String) throws {
  do {
    fichier = try new fileReader(cheminNom)
  } catch {
    throw Lecture.fichierNonTrouve    
  } 

  if type == "csv" {
    do {
      while line != nil {
        line = try fichier.readLine()
        if !conformeCSV(line) {
          throw Lecture.fichierIllisible
        } 
      }
    }
  }  
}
"""
print(prototype)

// 3- ****************  POO  ******************
// Classes
// Exercice 1
// Créez une classe Personne avec des propriétés nom, prenom et age. Ajoutez une méthode sePresenter()
// qui affiche une courte description de la personne.
print("Exercices 3.1")
class Personne {
  var nom: String = ""
  var prenom: String = ""
  var age: Int = 0

  init(nom: String, prenom: String, age: Int) {
    self.nom = nom
    self.prenom = prenom
    self.age = age
  }
  
  func sePresenter() {
    print("Je me nomme \(prenom) \(nom). J'ai \(age) ans")
  }
}
var moi = Personne(nom: "Hatin", prenom: "Mathieu", age: 46)
print(moi.sePresenter())

// Exercice 2
// Créez une classe Voiture avec des propriétés marque, modele, odometre, et annee. Ajoutez une méthode
// demarrer() qui affiche un message indiquant que la voiture démarre. Ajoutez une fonction
// avancer(de kilometres: Int) qui incremente la valeur d’odomètre si la voiture est démarrée.
print("Exercices 3.2")
class Voiture {
  var marque: String
  var modele: String
  var odometre: Int
  var annee: Int
  private var demarre: Bool

  init(marque: String, modele: String, odometre: Int, annee: Int) {
    self.marque = marque
    self.modele = modele
    self.odometre = odometre
    self.annee = annee
    self.demarre = false
  }
  
  func demarrer() {
    demarre = true
    print("Démarrage")
  }

  func avancer(de kilometres: Int) {
    if demarre {
      self.odometre += kilometres
    }
  }
}
var monVue = Voiture(marque: "Saturn", modele: "Vue", odometre: 213000, annee: 2005)
monVue.demarrer()
monVue.avancer(de: 35)
print("Nouvel odemètre: " + String(monVue.odometre))

// Exercice 3
// Définissez une classe Cercle avec une propriété rayon. Ajoutez deux méthodes pour calculer et
// retourner le périmètre et l’aire du cercle.
// Structures
print("Exercices 3.3")
struct Cercle {
  var rayon: Double

  func perimetre() -> Double{
    return rayon*2.0*Double.pi
  }

  func air() -> Double {
    return rayon*rayon*Double.pi
  }  
}

var monCercle = Cercle(rayon: 3)
print("Perimetre: \(monCercle.perimetre()) , air: \(monCercle.air())")

// Exercice 4
// Définissez une structure Point qui représente un point dans un système de coordonnées 3D. Ajoutez
// une méthode distanceJusqua(autrePoint: Point) pour calculer la distance entre deux points.
print("Exercices 3.4")
import Foundation
precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Double, power: Double) -> Double {
    return (pow(Double(radix), Double(power)))
}
// Then you can do this...
// let i = 2 ^^ 3

struct Point {
  var x: Double
  var y: Double
  var z: Double

  // formule sqrt[(Xa-Xb)²+(Ya-Yb)²+(Za-Zb)²]
  func distance(p point: Point) -> Double{
    var distance: Double = 0
    distance = sqrt((self.x-point.x)^^2 + (self.y-point.y)^^2 + (self.z-point.z)^^2)
    return distance
  }  
}

let pointUn = Point(x: 0, y: 0, z: 0)
let pointDeux = Point(x: 2, y: 2, z: 2)
print("Distance entre nos deux point: " + String(pointUn.distance(p: pointDeux)))

// Exercice 5
// Créez une structure Rectangle qui a deux propriétés longueur et largeur. Ajoutez des méthodes pour
// calculer l’aire et le périmètre du rectangle. Ajoutez une méthode pour comparer l’instance à une
// autre instance et retourner si son aire est plus petite ou non.
// Gérer les erreurs si longueur ou largeur est négatif.
// Intancier 5 rectangles et faire 5 comparaisons (de votre choix).
print("Exercices 3.5")
enum Initialisation: Error {
  case ArgumentNegatif
}

struct Rectangle {  
  var longueur: Double
  var largeur: Double

  init(long: Double, larg: Double) throws {
    if long < 0 || larg < 0 {
      throw Initialisation.ArgumentNegatif
    }
    self.longueur = long
    self.largeur = larg
  }
  
  func perimetre() -> Double{
    return (longueur+largeur)*2
  }

  func air() -> Double {
    return longueur*largeur
  }  

  func compareAir(rect: Rectangle) -> Bool {
    return (self.air() - rect.air() > 0)
  } 
  
}
do {
  let rect1 = try Rectangle(long: 3, larg: 3)
  let rect2 = try Rectangle(long: 2, larg: 2)
  let rect3 = try Rectangle(long: 10, larg: 5)
  let rect4 = try Rectangle(long: 2, larg: 3)
  let rect5 = try Rectangle(long: 3, larg: 2)
  var rect6 = try Rectangle(long: 10, larg: 2)
  let tabRect: [Rectangle] = [rect1, rect2, rect3, rect4, rect5, rect6]
  for i in 0...4 {
    print("comparation de l'air de 2 rectangles: " + String(tabRect[i].compareAir(rect: tabRect[i+1])))
  }
  rect6 = try Rectangle(long: -1, larg: 2)  
} catch Initialisation.ArgumentNegatif {
  print("Opération avortée, valeur négative")
}

// Enums
// Exercice 6
// Définissez une énumération Jour qui représente les jours de la semaine.
print("Exercices 3.6")
enum JourDeLaSemaine: String {
  case lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche
}
let premierJour = JourDeLaSemaine.lundi
print(premierJour.rawValue) // Affiche "Lundi"

// Exercice 7
// Définissez une énumération Note pour représenter les notes d’un étudiant. Chaque cas doit avoir
// une valeur brute de type Int.
print("Exercices 3.7")
enum Note: Int {
  case note1 = 91
  case note2 = 92
  case note3 = 93
}
print("note3: " + String(Note.note3.rawValue)) // Affiche "93"

// Intégration
// Exercice 8
// Créez une classe Eleve qui hérite de la classe Personne et ajoute une propriété note. Ajoutez une
// méthode passerExamen() qui détermine si l’élève a réussi l’examen en fonction de sa note.
print("Exercices 3.8")
class Eleve: Personne {
  var note: Int

  init(nom: String, prenom: String, age: Int, note: Int) {
    self.note = note    
    super.init(nom: nom, prenom: prenom, age: age)  
  }
  
  func passerExamen() -> Bool {
    if note >= 60 {return true}      
    return false
  }
}

var unEleve = Eleve(nom: "Hatin", prenom: "Mathieu", age: 46, note: 70)
print("Élève ( \(unEleve.nom) , \(unEleve.prenom) ) passage aux examens:")
print(unEleve.passerExamen())
unEleve.note = 40
print(unEleve.passerExamen())

// Exercice 9
// Créez une structure Vecteur qui représente un vecteur dans un système de coordonnées 3D. Ajoutez
// des méthodes pour calculer la longueur du vecteur et une autre pour additionner deux vecteurs.
print("Exercices 3.9")
struct Vecteur {  
  var x: Double = 0
  var y: Double = 0
  var z: Double = 0

  init(x: Double, y: Double, z: Double) {
    self.x = x
    self.y = y
    self.z = z
  }
  // formule racine carree de x^2 + y^2 + z^2
  func longueur() -> Double{
    return sqrt(x^^2+y^^2+z^^2)
  }

  // formule x1+x2,y1+y2,z1+z2
  func addition(v: Vecteur) -> Vecteur {
    return Vecteur(x: x+v2.x,y: y+v2.y,z: z+v2.z)
  }  
}
var v1 = Vecteur(x:1,y:1,z:1)
var v2 = Vecteur(x:-2,y:-2,z:-2)
print("Longueur de v1(1,1,1): " + String(v1.longueur()))
print("Longueur de v2(-2,-2,-2): " + String(v2.longueur()))
print("v1.addition(v2): ")
print(v1.addition(v: v2))

// Exercice 10
// Créez une classe Livre qui a des propriétés pour le titre, l'`auteur` et le nombreDePages. Créez une
// classe Bibliothèque qui a une propriété pour une collectionDeLivres, qui est une liste de Livre`s.
// Ajoutez une méthode à `Bibliothèque pour ajouterLivre(livre: Livre), qui ajoute un livre à la
// collection.
print("Exercices 3.10")

class Livre {
  var titre: String = ""
  var auteur: String = ""
  var nbPages: Int = 0
}

class Bibliotheque {
  var collectionDeLivres: [Livre] = []

  func ajouterLivre(livre: Livre) {
    collectionDeLivres.append(livre)
  }  
}

var livreA = Livre()
livreA.titre = "La Gloire de mon père"
livreA.auteur = "Marcel Pagnol"
livreA.nbPages = 309

var livreB = Livre()
livreB.titre = "Le Château de ma mère"

var maBiblio = Bibliotheque();
maBiblio.ajouterLivre(livre: livreA)
maBiblio.ajouterLivre(livre: livreB)

print("Ma Biblio contient:")
for livre in maBiblio.collectionDeLivres {
  print(livre.titre)
}

// Exercice 11
// Définissez une structure Point qui représente un point dans un système de coordonnées 2D avec
// des propriétés x et y. Créez une structure Ligne qui a deux propriétés de type Point, start et end.
// Ajoutez une méthode à Ligne pour calculer la longueur de la ligne.
print("Exercices 3.11")
struct Ligne {
  var start: Point
  var end: Point

  init(point1: Point, point2: Point) {
    start = p1
    end = p2
  }
  
  func longueur () -> Double {
    return sqrt((end.x - start.x)^^2 + (end.y - start.y)^^2)
  }  
}

var p1 = Point(x: 1, y: 1, z: 0)
var p2 = Point(x: 2, y: 2, z: 0)
var l1 = Ligne(point1: p1, point2: p2)
// l1.start = p1
// l1.end = p2
print("La distance entre p1 et p2 est: " + String(l1.longueur()))

// Exercice 12
// Créez une classe CompteBancaire avec des propriétés pour le solde et le titulaire. Ajoutez des
// méthodes pour déposer(montant: Double) et retirer(montant: Double). Assurez-vous que le solde ne
// peut pas descendre en dessous de 0.
print("Exercices 3.12")
class CompteBancaire {
  var solde: Double = 0
  var titulaire: String = ""

  func deposer(montant: Double) {
    solde += montant
  }

  func retirer(montant: Double) {
    if (solde - montant) >= 0 {
      solde -= montant
    }
  }  
}

var monCompte = CompteBancaire()
monCompte.titulaire = "Mathieu Hatin"
monCompte.deposer(montant: 5)
print(monCompte.solde)
monCompte.retirer(montant: 6)
print(monCompte.solde)

// Exercice 13
// Définissez une énumération TypeDeVoiture avec des cas pour différents types de voitures (par
// exemple, berline, SUV, cabriolet). Chaque cas doit avoir une valeur associée qui est une instance de
// la classe Voiture correspondante.
print("Exercices 3.13")
enum TypeDeVoiture {
  case berline
  case suv
  case cabriolet  
}

class Berline: Voiture {
  let type =  TypeDeVoiture.berline  
}

class SUV: Voiture {
  let type = TypeDeVoiture.suv
}

class Cabriolet: Voiture {
  let type = TypeDeVoiture.cabriolet
}

let monSUV = SUV(marque: "Saturn", modele: "Vue", odometre: 213000, annee: 2005)
switch monSUV.type {
  case TypeDeVoiture.suv:
    print("Voiture de type suv")
  default:
    print("Voiture")
}