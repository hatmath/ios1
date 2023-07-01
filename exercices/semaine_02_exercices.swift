print("Semaine 2 - Exercices!")

// Partie 1: Structures de contrôles
// 1. Exercice 1 : Condition if-else Écrivez un programme qui détermine si un nombre est pair ou impair.
print("Exercice 1.1")
let nombre: Int = 5;
let reponse: String;
if nombre % 2 == 0 {
  reponse = "pair"
} else {
   reponse = "impair"
}
print(reponse)

// 1. Exercice 2 : Boucle for-in Écrivez un programme qui imprime les 10 premiers nombres de la
// suite de Fibonacci. Fn = Fn-1 + Fn-2
print("Exercice 1.2")
var suiteDeFibonacci: [Int] = [0,1]
for i in 2..<10 {
  suiteDeFibonacci.append(suiteDeFibonacci[i-1] + suiteDeFibonacci[i-2])
}
print("Les 10 premiers nombres de la suite de Fibonacci sont: ")
for nombre in suiteDeFibonacci {
  print(nombre)
}
//print(suiteDeFibonacci,",")

// 1. Exercice 3 : Boucle while Écrivez un programme qui trouve le plus petit nombre entier n tel
// que 2^n dépasse un million.
print("Exercice 1.3")
var n: Int = 1
var puissanceN: Int = 2
while puissanceN < 1000000 {
    puissanceN = 2
    n += 1
    for _ in 1..<n {
        puissanceN = puissanceN * 2
    }    
}
print("Le plus petit nombre entier n tel que 2^n dépasse un million est: ")
print(n)

// 1. Exercice 4 : Boucle repeat-while Écrivez un programme qui demande à l’utilisateur de saisir un
// nombre jusqu’à ce qu’il saisisse un nombre dans la plage de 1 à 10.
print("Exercice 1.4")
var nombreEntierStr: String
var nombreEntier: Int
repeat {
  print("Entrer un nombre: ")
  nombreEntierStr = readLine() ?? "0" // Force un String non-optional condition pour pouvoir caster car ainsi ne peut être nil   
  nombreEntier = Int(nombreEntierStr)! // idem mais avec le !
} while !(1...10 ~= nombreEntier)
// } while !(1...10).contains(nombreEntier) // idem
print("Nombre \(nombreEntierStr) se trouve dans la plage de 1 à 10")

// **********************************************
func convertirStringOptional(str: String) -> Int{
  var nombreEntierStr: String
  var nombreEntier: Int
  nombreEntierStr = str
  nombreEntier = Int(nombreEntierStr)!
  return nombreEntier
}
// **********************************************

// 1. Exercice 5 : Conditions if-else if-else Écrivez un programme qui simule un système de
// notation. Si le score est supérieur à 90, imprimez "A". Si le score est supérieur à 80, imprimez
// "B", etc. Traitez le cas où le score est inférieur à 50 comme "F".
print("Exercice 1.5")
var note: Int
let listeScore: [Int: String] = [90: "A", 80: "B", 70: "C", 60: "D", 50: "E"]
var score: String?
print("Entrer la note: ")
note = convertirStringOptional(str: readLine()!)
if note > 90 {
  score = listeScore[90]
} else if note > 80 {
  score = listeScore[80]
} else if note > 70 {
  score = listeScore[70]
} else if note > 60 {
  score = listeScore[60]
}  else if note > 50 {
  score = listeScore[50]
} else {
  score = "F"
}
print("Score: " + score!)

// 1. Exercice 6 : Condition switch Écrivez un programme qui traduit les jours de la semaine de
// l’anglais vers le français en utilisant switch.
print("Exercice 1.6")
let jourSemaine: [String] = ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"]
let jourSemaineMultilingue: [String: String] = ["lundi": "monday", "mardi": "Tuesday", "mercredi": "wednesday", "jeudi": "thursday", "vendredi": "friday", "samedi": "saturday", "dimanche": "sunday"]
var jour: String
var jourAnglais: String?
print("Entrer le jour: ")
jour = readLine()!
if jourSemaine.contains(jour) {
  print("Oui, il s'agit d'un jour valide")
}
switch jour {
  case "lundi":
    jourAnglais = jourSemaineMultilingue["\(jour)"]
  case "mardi":
    jourAnglais = jourSemaineMultilingue["\(jour)"]
  case "mercredi":
    jourAnglais = jourSemaineMultilingue["\(jour)"]
    case "jeudi":
    jourAnglais = jourSemaineMultilingue["\(jour)"]
  case "vendredi":
    jourAnglais = jourSemaineMultilingue["\(jour)"]
  case "samedi":
    jourAnglais = jourSemaineMultilingue["\(jour)"]
   case "dimanche":
    jourAnglais = jourSemaineMultilingue["\(jour)"]
  default:
    jourAnglais = "\(jour)"
}
print("En anglais: " + jourAnglais!)


// Partie 2 : Les collections
// 1. Créez un tableau d’entiers appelé "nombres" avec cinq éléments. Ajoutez ensuite un sixième
print("Exercice 2.1")
var nombres: [Int] = [1,2,3,4,5]
nombres.append(6)
print(nombres)

// 2. Créez un Set de chaînes de caractères appelé "fruits" avec trois éléments. Vérifiez ensuite si le
// set contient l’élément "pomme". .Créez un dictionnaire qui contient le nom des jours de la
// semaine en français et leur équivalent en anglais. Par exemple, "lundi" serait la clé et "Monday"
// serait la valeur. Essayez ensuite de récupérer la traduction en anglais de "mercredi".
print("Exercice 2.2")
var fruits: Set<String> = ["raison", "bleuet", "banane"]
print(fruits.contains("pomme"))
fruits.insert("pomme")
print(fruits.contains("pomme"))
// Pour les jours de la semaine j'ai déjà fait la ça pour l'exercices 1.6

// 3. Soit un tableau d’entiers appelé "notes" avec les éléments [12, 15, 13, 14, 16, 15, 14].
// Calculez la note moyenne.
print("Exercice 2.3")
var notes: [Int] = [12, 15, 13, 14, 16, 15, 14]
var total = 0
for n in notes {
  total = total + n
}
var moyenne = total / notes.count
print(moyenne)

// 4. Créez un tableau d’entiers appelé "nombresDupliqués" qui contient des doublons. Utilisez un
// Set pour éliminer les doublons, et reconvertissez en tableau le résultat sans doublons.
print("Exercice 2.4")
let nombresDupliques: [Int] = [1,2,3,4,5,3]
print(nombresDupliques)
let sansDoublons: Set<Int>
sansDoublons = Set(nombresDupliques)
print(sansDoublons)
let nombresSansDupliques = Array(sansDoublons)
print(nombresSansDupliques)

// Partie 3
// Exercice 1 : Structures de contrôle
// Écrivez un programme qui utilise une boucle for-in pour imprimer les 10 premiers nombres de la
// séquence de Fibonacci.
print("Exercice 3.1")
print("Voir exercice 1.2 c'est idem")

// Exercice 2 : Génération de couleurs hexadécimales
// Écrivez un programme qui génère un code couleur hexadécimal aléatoire. Un code couleur
// hexadécimal est une chaîne de 6 caractères où chaque caractère peut être l’un des suivants : 0, 1, 2,
// 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F. Chaque code couleur hexadécimal commence par un dièse (#).
print("Exercice 3.2")
var codeCouleur: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
var unCodeCouleur: Int
var uneCouleur: String = "#"
for _ in 1...6 {
  unCodeCouleur = Int.random(in: 1...15)
  uneCouleur.append(codeCouleur[unCodeCouleur])
}
print(uneCouleur)

// Exercice 3 : Structures de contrôle et collections
// Utilisez une boucle for-in pour trouver le nombre le plus grand dans un tableau d’entiers.
print("Exercice 3.3")
var tabEntier: [Int] = [1,5,3,4]
var nb: Int = tabEntier[0]
for x in tabEntier {
  if nb < x {
    nb = x
  }
}
print(nb)

// Exercice 4 : Fonctions
// Créez une fonction qui prend un nombre entier et renvoie un tableau de tous les diviseurs de ce
// nombre.
print("Exercice 3.4")
var nbEntier: Int
print("Entrer un nombre: ")
nbEntier = Int(readLine()!) ?? 0
print(trouverDiviseurs(nb: nbEntier))

// // **********************************************
func trouverDiviseurs(nb: Int) -> [Int]{
  var tableauDiviseurs: [Int] = []
  for x in 1...nb {
    if nb%x == 0 {
      tableauDiviseurs.append(x)
    }  
  }
  return tableauDiviseurs
}
// // **********************************************

// Exercice 5 : Structures de contrôle - Instruction switch
// Écrivez un programme qui utilise une instruction switch pour imprimer le nom d’une note
// musicale (do, ré, mi, fa, sol, la, si) en fonction de son numéro (1 pour do, 2 pour ré, etc.). Le
// programme doit gérer les cas où le numéro n’est pas compris entre 1 et 7.
print("Exercice 3.5")
let notesMusicales: [String] = ["aucune","do", "ré", "mi", "fa", "sol", "la", "si"]
var noteMusicale: String
var noteNumerique: Int
print("Entrer une note musical de 1 à 7: ")
noteNumerique = Int(readLine()!) ?? 0
switch noteNumerique {
  case 1:
    noteMusicale = notesMusicales[noteNumerique]
  case 2:
    noteMusicale = notesMusicales[noteNumerique]
  case 3:
    noteMusicale = notesMusicales[noteNumerique]
  case 4:
    noteMusicale = notesMusicales[noteNumerique]
  case 5:
    noteMusicale = notesMusicales[noteNumerique]
  case 6:
    noteMusicale = notesMusicales[noteNumerique]
  case 7:
    noteMusicale = notesMusicales[noteNumerique]
  default:
    noteMusicale = notesMusicales[0]
}
print("Il s'agit de " + noteMusicale)

// Exercice 6 : Types personnalisés et collections
// Créez un type personnalisé Étudiant avec des propriétés pour le nom, l’âge et la note moyenne.
// Ensuite, créez un tableau d’objets Étudiant. Utilisez une boucle for-in pour calculer la note
// moyenne de tous les étudiants.
print("Exercice 3.6")
struct Etudiant {
  var nom: String
  var age: Int
  var note: Int
}

var etudiants: [Etudiant] = [Etudiant(nom:"John", age:23, note: 55), Etudiant(nom:"Jane", age:20, note: 65) ]
var moyen = 0
for un in etudiants {
  moyen = moyen + un.note
}
print(moyen/etudiants.count)

// Partie 4
// 1. En quoi l’utilisation de let pour déclarer une constante peut-elle améliorer la lisibilité et la
// sécurité du code dans Swift? Quels sont les cas où il serait préférable d’utiliser var pour déclarer
// une variable ?
print("Exercice 4.1")
let texte41 = """
let définit quelque chose d'immuable c'est très pratique de la savoir et de le dire ouvertement. On le sais. Le
reste varie dans var
"""
print(texte41)

// 2. Comment l’utilisation des optionnels en Swift aide-t-elle à gérer les situations où une valeur
// peut être présente ou absente ? Quels problèmes peut-elle résoudre par rapport à d’autres
// langages de programmation qui n’ont pas ce concept ?
print("Exercice 4.2")
let texte42 = """
Très pratique aussi les optionnels gèrent les situations où notre objet ne serait en bout de ligne jamais affecté d'une valeur réglementaire. Ce qui arrive fréquement en programmation.
"""
print(texte42)

// 3. Quel est l’impact de l’utilisation de différentes structures de contrôle, telles que for, while,
// repeat-while, if, else if et switch dans la gestion du flux de contrôle dans un programme Swift
// ? Pouvez-vous donner un exemple concret d’une situation où l’utilisation d’une certaine
// structure de contrôle serait plus appropriée que les autres ?
print("Exercice 432")
let texte43 = """
Les structures de contrôle d'un language de programmation sont les verbes et le reste c'est les mots, sommairement, si on veux faire une analogie avec la langue française. Un example d'utilisation d'une structure plutôt qu'une autre pourrait être: je ne me servirais pas d'un while si je veux boucler un certain nombre de fois et que ce nombre de fois je le connais. Comme le while vérifie tjr une condition avant de reprendre, si je n'ai pas de condition à lui faire tester, je m'en servirais pas.
"""
print(texte43)