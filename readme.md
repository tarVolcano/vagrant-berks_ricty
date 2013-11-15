# vagrant-berkshelfでRictyフォントを自動生成する

プログラミング/開発に適したRictyフォントを自動生成するvagrant環境を作ってみました。  
そのまま使うと、生成するRictyフォントは、私の好みで「全角スペースを可視化しない(-z)」オプションがついています。
全角スペースを可視化したい場合は、後述の使い方欄を参考にしてください。

Rictyについては[こちら](http://save.sys.t.u-tokyo.ac.jp/~yusa/fonts/ricty.html)を参考にしてください。

## 前準備

- VirtualBoxのインストール

  - [ダウンロードサイト](https://www.virtualbox.org/wiki/Downloads)

- Vagrantのインストール

  - [ダウンロードサイト](http://downloads.vagrantup.com/)

- vagrant-berkshelfとvagrant-omnibusプラグインのインストール

  - 必要プラグインがないときは、vagrantセットアップ後、下記実行でインストール。

```
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-omnibus
```


## 使い方

- 下記コマンド実行で、VM起動～カレントディレクトリにRictyフォントを生成するところまで自動で行います。

```
$ mkdir ricty
$ cd ricty
$ git clone https://github.com/tarVolcano/vagrant-berks_ricty.git .
$ vagrant up
```

- 全角スペースを可視化する場合は、Vagrantfile内のrun_listで"ricty::non-display_em-space"の箇所を"ricty::default"に変更してから実行してください。

```ruby:Vagrantfile
    :
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "fix_resolv_conf",
      "ricty::default"                   # この行を追加して
      # "ricty::non-display_em-space"    # この行をコメントアウトする
    ]
  end
    :
```

## 環境

- Vagrant 1.3.5

- Virtualbox (ホスト：WinXP = 4.2.18 / MacOS X 10.9 = 4.3.2)


## 実行により作成されるゲスト環境について

- ゲストOS:CentOS 6.4

- vmメモリ:256MB

- hostname:create-ricty-vm

- vagrantBox名:centos-6.4

  - 上のboxがなければ、[ここ](http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box)から自動ダウンロードします。
