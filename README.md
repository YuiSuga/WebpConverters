# WebpConverters
Local converters for .webp files with different extensions



* WebpToPng.ps1

  This is a powershell script that makes all `.webp` files below the executed hierarchy into `.png` files.

  * How to use
    1. Get `dwebp.exe` from https://chromium.googlesource.com/webm/libwebp/ and set it up
    2. Place this executable in a specific folder
    3. Run from the powershell
    4. Done
  * Note
    * The original `.png` file is not deleted and remains intact.
    * The following links must be addressed prior to running the powershell script on a network drive.
      https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2
    * If a powershell-specific regular expression (e.g., "[", "]") is included in the full path of a file, the current implementation cannot perform the conversion.



