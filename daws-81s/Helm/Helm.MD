#### Helm Charts
- helm charts is a package manager for kubernetes applications
- to templatise manifest files
- to install popular applications in kubernetes like ingress control, CSI drivers, metrics server, prometheus/grafana
- image creation ---> Docker File
- how to run image ---> docker compose/ kubernetes manifest files
- popular tools have opensource images and open sources manifest files 

#### Install Helm 

        $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
        $ chmod 700 get_helm.sh
        $ ./get_helm.sh