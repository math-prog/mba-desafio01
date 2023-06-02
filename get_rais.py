import os
from ftplib import FTP
import zipfile
import shutil

# FTP server details
ftp_url = "ftp.mtps.gov.br"
ftp_path = "/pdet/microdados/RAIS/2020"
output_folder = "/content/data/raw"  # Modify this to your desired local directory

# Connect to the FTP server
ftp = FTP(ftp_url)
ftp.login()  # Login anonymously

# Change to the desired directory on the FTP server
ftp.cwd(ftp_path)

# Create the output folder if it doesn't exist
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# List all files in the current directory on the FTP server
file_list = ftp.nlst()

# Get the list of files in the output folder
files = os.listdir(output_folder)

# Download and extract each file
for filename in file_list:
    local_filepath = os.path.join(output_folder, filename)

    # Download the file
    with open(local_filepath, "wb") as file:
        ftp.retrbinary("RETR " + filename, file.write)
        print(f"Downloaded: {filename}")

# Disconnect from the FTP server
ftp.quit()

print("All files downloaded successfully.")

# Path to the folder with .7z files
source_folder = '/content/data/raw'

# Get the list of files in the source folder
files = os.listdir(source_folder)

# Iterate over all files in the folder
for file in files:
    # Check if the file is a .7z file
    if file.endswith('.7z'):
        # Extract the file using 7-Zip (make sure you have 7-Zip installed)
        command = f'7z x "{os.path.join(source_folder, file)}" -o"{source_folder}"'
        os.system(command)
        
        # Delete the .7z file
        os.remove(os.path.join(source_folder, file))

print("Extraction and deletion zipped files completed successfully.")