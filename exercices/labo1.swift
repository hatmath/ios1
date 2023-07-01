 
// COLLÈGE AHUNTSIC
// AEC-420-290
// Laboratoire 1
// Étudiant: Mathieu Hatin
// Matricule: 2096939
// Date de remise: 9 juin 2023

import Foundation 

// ÉTAPE 1 - Déboguer un programme donné
print("\nÉTAPE 1")
print("*******")
func partie(a: Int, b: Int, c: Int) {
  
  var type: String  
  if a == 1 && b == 100 && c == 10 {
    type = "classique"
  } else if a == 21 && b == 42 && c == 3 {
    type = "rapide"
  } else {
    type = "manuelle"
  }
  
  print("\nBienvenue au jeu! Bonne partie \(type)")
  let borneMin = a 
  let borneMax = b 
  let chiffreMystère = Int.random(in: borneMin...borneMax)
  let nbCoupsMax = c 
   
  print("DB 0: \(chiffreMystère)") 
  
  for i in 1..<nbCoupsMax+1 { 
    print("Entrez un nombre:") 
    let res: String? = readLine()
    let nb = Int(res!) ?? 0 
    print("DB \(i): \(nb)") 
    
    if i > nbCoupsMax { 
      print("Perdu") 
      break // Faut-il mettre un break ici? Oui, pcq le break force la sortie de la boucle
    } else if nb == chiffreMystère { 
      print("Gagné") 
      break 
    } else {       
      if nb < chiffreMystère { 
        print("Le nombre à deviner est plus grand.") 
      } else { 
        print("Le nombre à deviner est plus petit.") 
      }       
    } 
  } 
  print("Bye")
}

partie(a:1,b:100,c:10)

// ÉTAPE 2 - Implantation d'un diagramme d'utilisation
print("\nÉTAPE 2")
print("*******")
var boucler: Bool = true

func menuA() -> String? {
  print("""

  Que voulez vous faire ?
  1. 🥉  Partie classique (Entre 1 et 100 en 10 coups)
  2. 🥈  Partie rapide (Entre 21 et 42 en 3 coups)
  3. 🥇  Entrer un partie manuellement (Entre A et B et C coups)
  """)
  return readLine()
}

func menuB() -> Bool {
  print("\nFin de la partie. Voullez-vous rejouer (O/N) ?")
  let non = readLine()!
  if non != "O" && non != "o" {
    return false
  }
  return true
}

func menuC() -> [Int] {
  print("\nNombre A: ")
  let a = Int(readLine()!) ?? 0
  print("Nombre B: ")
  let b = Int(readLine()!) ?? 0
  print("Nombre de coups: ")
  let c = Int(readLine()!) ?? 0

  return [a, b, c]
}

while boucler {  
  if let choice = menuA() {
    switch choice {
       case "1":
        partie(a:1,b:100,c:10)
        boucler = menuB()        
       case "2":
        partie(a:21,b:42,c:3)
        boucler = menuB()
       case "3":
        let choix = menuC()
        partie(a: choix[0],b: choix[1],c: choix[2])
        boucler = menuB()
       default:
        boucler = false
    }    
  }
}

print("Bye Bye")

// ÉTAPE 3 - Application "single view" du jeu à l'étape 2
print("""
      
ÉTAPE 3
*******
Si vous deviez faire une application avec une seule vue (« single view » ou monovue) de votre jeu après l’étape 2, quel serait votre design? Allez-vous modifiez le diagramme d’utilisation afin de gérer la contrainte monovue? 
Réponse: J'ai fait une application monovue qui respecte le diagramme d'utilisation vu à l'étape 2
      
Quels éléments XCode utiliseriez-vous afin d’offrir la meilleure expérience à vos utilisateurs?
Réponse:  Slider, imageView, label, textField, button, Segmented Control
      
Ajouter une capture d’écran, ou une photo, de votre design. 
Réponse:  J'ai mis plusieurs captures d’écran dans mon fichier HATm_2096939_labo01.zip
      
Vous devez remettre une maquette (« mockup ») faites dans « interface builder », 
Réponse:  Mon projet Xcode contenant ma maquette se trouve sur github. 
          Voici le lien: https://github.com/hatmath/InterfaceBuilderLabo1-1
      
et vous pouvez en plus remettre un diagramme fil de fer, ou d’adobe XD.
""")

// BONUS - Librairie d'objets
print("""
      
BONUS :
*******
Dans la librairie d’objets de Xcode combien y-a-t-il d’éléments? 
Précisez votre version de XCode et la version iOS du projet.
""")

print("\nJ'ai 69 éléments dans ma librairie.")

print("""
Ma VirtualBox Oracle roule un MacOs Big Sur 11.0.1 (Build 20B29) 
J'ai installer Big Sur car c'est ce qu'on avait dans nos classes au collège.
""")

print("""
Peut-être que j'aurais pu installer un version de Xcode plus récente mais pas bcp plus
car j'ai essayé avec une version 14 et elle était trop récente pour l'OS. 
Alors, pour l'instant j'utilise un Xcode 12.4 (17801) (Build 12D4e)
""")      