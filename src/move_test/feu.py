import cv2
import numpy as np
green_lower = np.array([50, 100, 100])
green_upper = np.array([70, 255, 255])
cap = cv2.VideoCapture(0)

while True:
    # Lire une image de la caméra
    ret, frame = cap.read()

    # Vérifier si la lecture de l'image est réussie
    # Vérifier si la lecture de l'image est réussie
    if not ret:
        print("Échec de la lecture de l'image depuis la caméra")
        break

    # Convertir l'image en espace de couleur HSV
    hsv_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    # Filtrer l'image pour obtenir les régions correspondant à la couleur verte
    green_mask = cv2.inRange(hsv_frame, green_lower, green_upper)

    # Appliquer le masque à l'image pour ne garder que les pixels verts
    green_frame = cv2.bitwise_and(frame, frame, mask=green_mask)

    # Afficher l'image avec la couleur verte mise en évidence
    cv2.imshow("Caméra", green_frame)

    # Vérifier si des pixels verts sont présents
    if cv2.countNonZero(green_mask) > 0:
        print("Couleur : Verte")
    else:
        print("Pas de couleur verte détectée")

    # Attendre la pression de la touche 'q' pour quitter
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
