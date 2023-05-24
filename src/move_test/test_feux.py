import cv2
import numpy as np


def generate_calibration_grid(rows, columns, square_size, output_file):
    # Create an empty image to hold the calibration grid
    image = np.ones(
        (rows * square_size,
         columns * square_size),
        dtype=np.uint8) * 255

    # Draw the calibration grid
    for row in range(rows):
        for col in range(columns):
            if (row + col) % 2 == 0:
                image[row * square_size:(row + 1) * square_size,
                      col * square_size:(col + 1) * square_size] = 0

    # Save the calibration grid image
    cv2.imwrite(output_file, image)


# Parameters for the calibration grid
rows = 6
columns = 9
square_size = 100
output_file = "calibration_grid.png"

# Generate the calibration grid
generate_calibration_grid(rows, columns, square_size, output_file)
