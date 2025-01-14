import os
from PIL import Image

# 현재 스크립트의 디렉토리 경로
base_folder = os.path.dirname(os.path.abspath(__file__))

# 변환할 이미지 폴더와 출력 폴더 경로 설정
input_folder = os.path.join(base_folder, "input")
output_folder = os.path.join(base_folder, "output")

# 출력 폴더 생성
os.makedirs(output_folder, exist_ok=True)

# JPG 이미지를 WEBP로 변환
for filename in os.listdir(input_folder):
    if filename.lower().endswith(".jpg") or filename.lower().endswith(".jpeg"):
        img_path = os.path.join(input_folder, filename)
        webp_filename = os.path.splitext(filename)[0] + ".webp"
        webp_path = os.path.join(output_folder, webp_filename)

        # 이미 변환된 파일이 존재하면 스킵
        if os.path.exists(webp_path):
            print(f"이미 존재: {webp_filename}, 변환 스킵")
            continue

        # 변환 작업 수행
        img = Image.open(img_path)
        img.save(webp_path, "WEBP")
        print(f"Converted: {filename} -> {webp_filename}")

print("모든 이미지가 WEBP로 변환되었습니다!")
