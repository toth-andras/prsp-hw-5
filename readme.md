## ПРСП, ДЗ 5
Тот Андраш, БПИ222
### Запуск ДЗ
Данные серкета в проекте muffin-wallet зашифрованы с помощью плагина helm secrets, поэтому для запуска необходимо выполнить ряд шагов:

Подготавливаем инфраструктуру для шифрования — устанавливаем gnupg и sops, импортируем приватный ключ (в реальной жизни, очевидно, он не будет лежать в git-е):
```bash
brew install gnupg & brew install sops & gpg --import private-key.asc
```

Установить плагин helm secrets:
```bash
helm plugin install https://github.com/jkroepke/helm-secrets --version v4.7.0
```

Создать релизы через helmfile:
```bash
helmfile apply
```

Дополнительно нужно выполнить port-forward контроллера ingress:
```bash
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
```
И сервиса для muffin-currency