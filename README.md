# Goal
- End to end encryption (RSA + AES)
- Web/Desktop/Mobile client, encrypt and upload, download and decrypt 
 

# Features
- Personal regular user
  - System created key pair
  - User choose to enter private key password or not
  - User choose to keep private key in the server or not
  - User choose to be able to recover lost private key / private key password or not 
  - User choose to be able to recover without private key or not
- Personal power user
  - Upload self generated public key and/or private key
- File sharing
- Team account
  - Team admin should have a master key to all team content

# System design 

## File storage
- Break large files to small chunks. (maybe 1 MB?)
- AES password will be generated pre file.
- AES password will be used to encrypt file chunk by chunk
- File metadata should keep track of
  - File size
  - File chunk size
  - File hash value before encryption
  - File path 
  - Recovery option
  	- Encrypted ASE password with master public key
  - Owners
  	- Encrypted ASE password for each owner with their public key


# Potential issues
- Change keys will be extrem expensive