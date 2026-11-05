import platform
import subprocess
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

if platform.system() == "Windows":
    subprocess.run(
        [
            "powershell",
            "-ExecutionPolicy", "Bypass",
            "-File", os.path.join(BASE_DIR, "windows.ps1")
        ],
        check=True
    )

elif platform.system() == "Linux":
    subprocess.run(
        ["bash", os.path.join(BASE_DIR, "linux.sh")],
        check=True,
        cwd=BASE_DIR
    )

else:
    print("Unsupported operating system")
