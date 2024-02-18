#!/bin/bash

# Check if updates are available
if [[ $(sudo dnf check-update | grep 'Останню перевірку на застарілість метаданих було виконано' | wc -l) -gt 0 ]]; then
    echo "Оновлень нема. Нічого виконувати... Гарного дня!"
    
else
    echo "Доступні оновлення"
    # Perform system upgrade
    sleep 5
    sudo dnf upgrade -y
    # Reboot the system
    sudo reboot
fi
