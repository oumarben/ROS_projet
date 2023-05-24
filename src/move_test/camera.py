import cv2
import numpy as np


def delimite(img):
    m = np.copy(img)  # Copie de l'image d'origine
    # Définition des limites pour la découpe de l'image
    x_start = int(len(m[1]) * 0.25)  # Position de départ horizontale
    x_end = int(len(m[1]) * 0.75)  # Position de fin horizontale
    y_start = int(len(m) * 0.75)  # Position de départ verticale
    y_end = int(len(m))  # Position de fin verticale
    # Découpe de l'image en utilisant les limites définies
    m = m[y_start:y_end, x_start:x_end]
    return m


# Créer l'objet de capture vidéo
cap = cv2.VideoCapture(0)

while True:
    # Lire une image de la caméra
    ret, frame = cap.read()

    # Vérifier si la lecture de l'image est réussie
    if not ret:
        print("Échec de la lecture de l'image depuis la caméra")
    print(np.shape(frame))
    print(np.shape(frame))
    # Afficher l'image
    cv2.imshow("Caméra", delimite(frame))

    # Attendre la pression de la touche 'q' pour quitter
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Libérer les ressources
cap.release()
cv2.destroyAllWindows()
