// EXERCICES - SEMAINE 4
print("Semaine 4 - Exercices!")

// Enchaînement d’optionnelles
print("Exercice - Enchaînement d’optionnelles - 1")
// 1. Créez un objet de classe avec une propriété optionnelle, puis essayez d’accéder à cette propriété
// en utilisant l’enchaînement optionnel.
class Chienne {
  var nom: String?
}

let unChien = Chienne()
if let nomDuChien = unChien.nom {
  print("Le nom du chien est " + nomDuChien)
} else {
  print("Le chien n'a pas encore de nom")
}

print("Exercice - Enchaînement d’optionnelles - 2")
// 2. Ajoutez une propriété optionnelle à une structure, puis essayez d’accéder à cette propriété en
// utilisant l’enchaînement optionnel.
struct Etudiant {
  var nom: String
  var age: Int
  var note: Int?
}

var unEtudiant: Etudiant = Etudiant(nom:"John", age:23, note: 55)

print("La note de l'étudiant " + unEtudiant.nom + " est:")
if let uneNote = unEtudiant.note {
  print(uneNote)
} else {
  print("aucune")
}      

print("Exercice - Enchaînement d’optionnelles - 3")
// 3. Créez un dictionnaire avec des clés de type String et des valeurs optionnelles de type Int.
// Essayez d’accéder à une valeur en utilisant l’enchaînement optionnel.
let jourSemaine: [String: Int?] = ["lundi": 1, "mardi": 2, "mercredi": 3, "jeudi": 4, "vendredi": 5, "samedi": 6, "dimanche": 7]
print("lundi est le ")
if let jourEnChiffre = jourSemaine["lundi"] {
  print(jourEnChiffre!) //warning quand même ??? alors déballage forcé
} else {
  print(0)
}
print("jour de la semaine")

// Coercition optionnelle et déballage forcé
print("Exercice - Coercition optionnelle et déballage forcé - 1")
// 1. Créez une variable optionnelle, puis utilisez la coercition pour assigner une valeur par défaut si
// l’optionnelle est nil.
var couleur: String?
var uneCouleur = couleur ?? "jaune"
print("Couleur de ma variable couleur: " + uneCouleur)

print("Exercice - Coercition optionnelle et déballage forcé - 2")
// 2. Créez une variable optionnelle, puis utilisez le déballage forcé pour accéder à sa valeur. Que se
// passe-t-il si l’optionnelle est nil ?
var espece: String? = "chêne"
var unArbre = espece!
print("Cet arbre est un " + unArbre)

// espece = nil
// unArbre = espece!
// print("L'espèce de cet arbre est " + unArbre) // Fatal error car unArbre est nil

print("Exercice - Coercition optionnelle et déballage forcé - 3")
// 3. Créez une fonction qui accepte une variable optionnelle en tant que paramètre, puis utilisez la
// coercition optionnelle pour assigner une valeur par défaut si l’optionnelle est nil dans le corps
// de la fonction.
func testOptionnelle(jeSuisNil: Int?) {
  let jeNeSuisPlusNil = jeSuisNil ?? 0
  print("J'étais nil et la je suis: \(jeNeSuisPlusNil)")
}
testOptionnelle(jeSuisNil: nil)


// Protocoles
print("Exercice - Protocoles - 1")
// 1. Créez un protocole Animal qui spécifie une propriété nom et une méthode faireDuBruit().
protocol Animal {
  var nom: String { get set }
  
  func faireDuBruit()
}

print("Exercice - Protocoles - 2")
// 2. Créez des structures Chien et Chat qui se conforment au protocole Animal. Créez un tableau de
// cinq instances d'Animal
struct Chien: Animal {
  var nom: String 

  func faireDuBruit() {
    print("\(nom) fait wouff wouff")
  }
}

struct Chat: Animal {
  var nom: String

  func faireDuBruit() {
    print("\(nom) fait miaw miaw")
  }
}

let chien1 = Chien(nom: "jax")
let chien2 = Chien(nom: "pitch")
let chien3 = Chien(nom: "timbit")
let chat1 = Chat(nom: "pouki")
let chat2 = Chat(nom: "caillou")

let animaux: [Animal] = [chien1, chat1, chien3, chien2, chat2]

for aninal in animaux {
  aninal.faireDuBruit()
}

print("Exercice - Protocoles - 3")
// 3. Définissez un protocole Identifiable avec une propriété id de type String et implémentez-le
// dans une structure Personne.
protocol Identifiable {
  var id: String { get set}  
}

struct Personne: Identifiable {
  var id: String   
}
var moi = Personne(id: "2096939")
print("Mon id est: \(moi.id)")

print("Exercice - Protocoles - 4")
// 4. Créez un protocole Comparable avec une méthode compareTo(other:) `qui prend un autre objet
// du même type et renvoie un `Bool. Implémentez ce protocole dans une structure Chiffre.
protocol Comparable {
  var a: Int { get set }
  func compareTo(other: Comparable) -> Bool
}

struct Chiffre: Comparable {
  var a: Int
  
  func compareTo(other: Comparable) -> Bool {
    return self.a == other.a
  }
}

let chiffre1 = Chiffre(a: 5)
let chiffre2 = Chiffre(a: 6)
let identique = chiffre1.compareTo(other: chiffre2)
print("\(chiffre1) et \(chiffre2) sont identique: \(identique)")

print("Exercice - Protocoles - 5")
// 5. Créez un protocole Imprimable avec une méthode imprimer(). Faites en sorte qu’une structure
// Document se conforme à ce protocole.
protocol Imprimable {
  func imprimer()
}

struct Document {
  func imprimer() {
    print("Imprimez-moi")
  }
}

var unDoc = Document()
unDoc.imprimer()

// Extensions
print("Exercice - Extensions - 1")
// 1. Créez une extension pour le type Double qui ajoute une méthode carre() pour calculer le carré
// du nombre.

print("Exercice - Extensions - 2")
// 2. Créez une extension pour le type String qui ajoute une propriété calculée estPalindrome pour
// vérifier si une chaîne est un palindrome.

print("Exercice - Extensions - 3")
// 3. Créez une extension pour le type Array où les éléments sont Comparable. Ajoutez une méthode
// max() qui renvoie l’élément maximum du tableau.

print("Exercice - Extensions - 4")
// 4. Définissez un protocole Reproductible qui exige une méthode dupliquer(). Créez une extensionde Array où les éléments sont Reproductible qui ajoute une méthode dupliquerTous() qui renvoie
// un nouveau tableau avec tous les éléments dupliqués.

// Enumerations
print("Exercice - Enumerations - 1")
// 1. Créez une énumération JourDeLaSemaine qui représente les jours de la semaine. Ajoutez une
// propriété calculée estWeekend qui retourne true si le jour est un samedi ou un dimanche, et
// false sinon.

print("Exercice - Enumerations - 2")
// 2. Créez une énumération Mois qui représente les mois de l’année. Ajoutez une propriété calculée
// nombreDeJours qui retourne le nombre de jours dans le mois (ignorez les années bissextiles pour
// cet exercice).

print("Exercice - Enumerations - 3")
// 3. Créez une énumération indirecte ArbreBinaire pour un arbre binaire contenant des entiers.

print("Exercice - Enumerations - 4")
// 4. Créez une énumération indirecte Liste pour une liste chaînée de String.

// Fermetures
print("Exercice - Fermetures - 1")
// 1. Créez une fermeture qui prend deux Int en paramètres et retourne leur somme. Utilisez cette
// fermeture pour additionner deux nombres.

print("Exercice - Fermetures - 2")
// 2. Créez une fonction qui prend une fermeture en tant que paramètre. Cette fermeture devrait
// prendre un Int et retourner un Bool. Utilisez cette fonction pour filtrer un tableau d'`Int``.

print("Exercice - Fermetures - 3")
// 3. Créez une fermeture qui capture et modifie une valeur d’une variable extérieure.

print("Exercice - Fermetures - 4")
// 4. Utilisez la syntaxe de fermeture simplifiée pour transformer un tableau de String en un tableau
// de leurs longueurs.

print("Exercice - Fermetures - 5")
// 5. Créez une fermeture qui retourne une fonction. Cette dernière doit prendre un Int en
// paramètre et le multiplier par une valeur capturée par la fermeture.

print("Exercice - Fermetures - 6")
// 6. Créez une fermeture qui agit comme une fonction de rappel (callback). Utilisez-la dans une
// fonction qui simule un téléchargement asynchrone.
