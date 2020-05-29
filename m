Content-Type: multipart/mixed; boundary="===============5251348464757401643=="
MIME-Version: 1.0
From: Tony Chuang <yhchuang@realtek.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 9370/13554] drivers/net/wireless/realtek/rtw88/pci.c:1579:6: warning: no previous prototype for 'rtw_pci_shutdown'
Date: Fri, 29 May 2020 02:54:36 +0000
Message-ID: <ba08c8847b7049ecb34311abfd1afcee@realtek.com>
In-Reply-To: <202005290936.5fYW92cG%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5251348464757401643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> drivers/net/wireless/realtek/rtw88/pci.c:1579:6: warning: no previous
> prototype for 'rtw_pci_shutdown'
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
> master
> head:   ff387fc20c697cdc887b2abf7ef494e853795a2f
> commit: ba0fbe236fb8a7b992e82d6eafb03a600f5eba43 [9370/13554] rtw88:
> extract: make 8822c an individual kernel module
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ba0fbe236fb8a7b992e82d6eafb03a600f5eba43
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0
> make.cross ARCH=3Dia64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> drivers/net/wireless/realtek/rtw88/pci.c:1477:5: warning: no previous
> prototype for 'rtw_pci_probe' [-Wmissing-prototypes]
> 1477 | int rtw_pci_probe(struct pci_dev *pdev,
> |     ^~~~~~~~~~~~~
> drivers/net/wireless/realtek/rtw88/pci.c:1557:6: warning: no previous
> prototype for 'rtw_pci_remove' [-Wmissing-prototypes]
> 1557 | void rtw_pci_remove(struct pci_dev *pdev)
> |      ^~~~~~~~~~~~~~
> >> drivers/net/wireless/realtek/rtw88/pci.c:1579:6: warning: no previous
> >> prototype for 'rtw_pci_shutdown' [-Wmissing-prototypes]
> 1579 | void rtw_pci_shutdown(struct pci_dev *pdev)
> |      ^~~~~~~~~~~~~~~~

The symbol was extracted for the follow-up patches, so it's already fixed.

f56f08636dda ("rtw88: extract: make 8723d an individual kernel module")
416e87fcc780 ("rtw88: extract: make 8822b an individual kernel module")
ba0fbe236fb8 ("rtw88: extract: make 8822c an individual kernel module")

Thanks.
Yan-Hsuan
--===============5251348464757401643==--

