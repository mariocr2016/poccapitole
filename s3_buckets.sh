#!/bin/bash
#Muestra el menu general
clear
function _menuPrincipal()
{
    echo -----------------------------
    echo "AWS S3 Buckets LINUX / OSX "
    echo -----------------------------
    echo
    echo "1) S3 Bucket Linux"
    echo "2) s3 Bucket OSX"
    echo "3) Exit"
    echo
    echo -n "Indica una opcion: "
}
function _submenu1()
{
    echo
    echo -------------------------
    echo "AWS S3 Buckets LINUX "
    echo -------------------------
    echo "1) Review AwsCli"
    echo "2) Install AwsCli"
    echo "3) Configure AwsCli credentials.csv"
    echo "4) Bucket Name"
    echo "5) Creation Date Bucket"
    echo "6) Number of Files"
    echo "7) Total Size of Files"
    echo "8) Salir a Menu"
    echo
    echo -n "eleccione una opcion [1 - 8]"
}
function _submenu2()
{
    echo
    echo -------------------------
    echo "AWS S3 Buckets OSX "
    echo -------------------------
    echo "1) Review AwsCli"
    echo "2) Install AwsCli"
    echo "3) Configure AwsCli credentials.csv"
    echo "4) Bucket Name"
    echo "5) Creation Date Bucket"
    echo "6) Number of Files"
    echo "7) Total Size of Files"
    echo "8) Salir a Menu"
    echo
    echo -n "seleccione una opcion [1 - 8]"
}
opc=0
until [ $opc -eq 8 ]
do
    case $opc in
        1)
            opc1=0
            until [ $opc1 -eq 8 ]
            do
                case $opc1 in
                    1)
                        echo "Review AwsCli Modules"
                        rpm -q awscli; _submenu1;;
                    2)
                        echo "Install AwsCli"
                        yum install awscli -y; _submenu1;;
                    3)
                        echo "Configure AwsCli"
                        aws configure; _submenu1;;
                    4)
                        echo "Bucket Name"
                        BACKETS=$( aws s3 ls |awk '{ print $3 }' ); echo $BACKETS; _submenu1;;
                    5) 
                        echo "Creation Date Bucket"
                        aws s3 ls; _submenu1;;
                    6) 
                        echo "Number of Files"
                        BACKETS=$(aws s3 ls |awk '{ print $3  }');aws s3 ls s3://$BACKETS --recursive | wc -l; _submenu1;;
                    7)
                        echo "Total Size of Files"
                        BACKETS=$(aws s3 ls |awk '{ print $3 }');aws s3 ls s3://$BACKETS; _submenu1;;
                    *) 
                        echo "Salir a Menu"
                        _submenu1
                        ;;
                esac
                unset BACKETS
                read opc1
            done
            _menuPrincipal
            ;;
        2)
            opc2=0
            until [ $opc2 -eq 8 ]
            do
                case $opc2 in
                    1)
                        echo " Review AwsCli Modules "
                        pip3 list | grep -i awscli; _submenu1;;
                    2)
                        echo " Install AwsCli "
                        curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"; unzip awscli-bundle.zip ; sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws; _submenu1;;
                    3) 
                        echo " Configure AwsCli "
                        aws configure; _submenu1;;
                    4) 
                        echo " Bucket Name "
                        BACKETS=$(aws s3 ls |awk '{ print $3 }'); echo $BACKETS; _submenu1;;
                    5) 
                        echo " Creation Date Bucket "
                        aws s3 ls; _submenu1;;
                    6)
                        echo "Number of Files"
                        BACKETS=$(aws s3 ls |awk '{ print $3 }');aws s3 ls s3://$BACKETS --recursive | wc -l; _submenu1;;             
                    7)
                        echo " Total Size of Files "
                        BACKETS=$(aws s3 ls |awk '{ print $3 }');aws s3 ls s3://$BACKETS; _submenu1;;
                    *) 
                        echo "Salir a Menu"
                        _submenu2
                        ;;
                esac
                unset BACKETS
                read opc2
            done
            _menuPrincipal
            ;;
        3)
            exit 1;;
        *)
            _menuPrincipal

            ;;
    
    esac
    read opc
done
