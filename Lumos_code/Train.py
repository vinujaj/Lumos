import cv2
import numpy as np
import os
from sklearn.model_selection import train_test_split
import tensorflow as tf
import math

# Load and preprocess data
folders = ["A", "B", "C", "D", "E", "F", "G"]
img_size = 300
offset = 20

X = []
y_labels = []

for i, folder in enumerate(folders):
    folder_path = f"Data/{folder}"
    for filename in os.listdir(folder_path):
        if filename.lower().endswith((".jpg", ".png")):
            img_path = os.path.join(folder_path, filename)
            img = cv2.imread(img_path)
            img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            img_white = np.ones((img_size, img_size, 3), np.uint8) * 255
            _, img_thresh = cv2.threshold(img_gray, 127, 255, cv2.THRESH_BINARY_INV)
            contours, _ = cv2.findContours(img_thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

            if contours:
                cnt = max(contours, key=cv2.contourArea)
                x, y, w, h = cv2.boundingRect(cnt)

                img_crop = img[y - offset : y + h + offset, x - offset : x + w + offset]
                img_crop_shape = img_crop.shape
                aspect_ratio = h / w

                if aspect_ratio > 1:
                    k = img_size / h
                    w_cal = math.ceil(k * w)
                    img_resize = cv2.resize(img_crop, (w_cal, img_size))
                    img_resize_shape = img_resize.shape
                    w_gap = math.ceil((img_size - w_cal) / 2)
                    img_white[:, w_gap : w_cal + w_gap] = img_resize

                else:
                    k = img_size / w
                    h_cal = math.ceil(k * h)
                    img_resize = cv2.resize(img_crop, (img_size, h_cal))
                    img_resize_shape = img_resize.shape
                    h_gap = math.ceil((img_size - h_cal) / 2)
                    img_white[h_gap : h_cal + h_gap, :] = img_resize

                X.append(img_white)
                y_labels.append(i)

X = np.array(X)
y_labels = np.array(y_labels)

# Split data into training and validation sets
X_train, X_val, y_train, y_val = train_test_split(X, y_labels, test_size=0.2, random_state=42)

# Define CNN architecture
model = tf.keras.models.Sequential([
    tf.keras.layers.Conv2D(32, (3, 3), activation='relu', input_shape=(img_size, img_size, 3)),
    tf.keras.layers.MaxPooling2D((2, 2)),
    tf.keras.layers.Conv2D(64, (3, 3), activation='relu'),
    tf.keras.layers.MaxPooling2D((2, 2)),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dense(64, activation='relu'),
    tf.keras.layers.Dense(len(folders))
])

# Compile model
model.compile(optimizer='adam',
              loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])

# Train model
history = model.fit(X_train, y_train, epochs=10, validation_data=(X_val, y_val))

# Save trained model
model.save("my_model.h5")

# Evaluate model
test_loss, test_acc = model.evaluate(X_val, y_val)
print(f"Test Loss: {test_loss}")
