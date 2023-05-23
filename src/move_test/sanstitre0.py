import cv2
import numpy as np


def delimite(img):
    m = np.copy(img)
    x = int(len(img) * 0.15)
    for i in range(len(m)):
        for j in range(len(m[0])):
            if (i < x) | (i > len(m) - x):
                m[i][j] = [0, 0, 0]
    return m


# Paramètres de détection de couleur
lower_yellow = np.array([20, 100, 100])
upper_yellow = np.array([30, 255, 255])
green_color = (0, 255, 0)  # Couleur verte du contour

# Créer l'objet de capture vidéo
cap = cv2.VideoCapture(0)

while True:
    # Lire une image de la caméra
    ret, frame = cap.read()

    # Vérifier si la lecture de l'image est réussie
    if not ret:
        print("Échec de la lecture de l'image depuis la caméra")
        break

    # Convertir l'image de BGR en HSV
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    # Filtrer les pixels jaunes dans l'image HSV
    mask = cv2.inRange(hsv, lower_yellow, upper_yellow)

    # Appliquer une opération morphologique pour éliminer le bruit
    kernel = np.ones((5, 5), np.uint8)
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel)

    # Trouver les contours des objets jaunes
    contours, _ = cv2.findContours(
        mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    # Dessiner un contour vert autour des objets jaunes détectés
    cv2.drawContours(frame, contours, -1, green_color, 2)

    # Afficher l'image
    cv2.imshow("Caméra", delimite(frame))

    # Attendre la pression de la touche 'q' pour quitter
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Libérer les ressources
cap.release()
cv2.destroyAllWindows()