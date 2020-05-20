Content-Type: multipart/mixed; boundary="===============0484084667867035370=="
MIME-Version: 1.0
From: Tony Chuang <yhchuang@realtek.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 10024/10701] drivers/net/wireless/realtek/rtw88/pci.c:1477:5: warning: no previous prototype for function 'rtw_pci_probe'
Date: Wed, 20 May 2020 08:30:20 +0000
Message-ID: <cd6a53995365404ca33f325e9cc5ba03@realtek.com>
In-Reply-To: <202005201637.yF4tG9Py%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0484084667867035370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
> master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 72f256c2b948622cc45ff8bc0456dd6039d8fe36 [10024/10701]
> rtw88: extract: export symbols about pci interface
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project
> e6658079aca6d971b4e9d7137a3a2ecbc9c34aec)
> reproduce:
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =
-O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 72f256c2b948622cc45ff8bc0456dd6039d8fe36
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> drivers/net/wireless/realtek/rtw88/pci.c:1477:5: warning: no previous
> >> prototype for function 'rtw_pci_probe' [-Wmissing-prototypes]
> int rtw_pci_probe(struct pci_dev *pdev,
> ^
> drivers/net/wireless/realtek/rtw88/pci.c:1477:1: note: declare 'static' i=
f the
> function is not intended to be used outside of this translation unit int
> rtw_pci_probe(struct pci_dev *pdev, ^ static

These exported symbols are used outside in rtw88 driver's
new entry points such as rtw8822be.ko/rtw8822ce.ko.
But for easier to review the patch is split and the patch that
contains the entry point is applied after this.
So it can be treated as false alarms.

Yen-Hsuan
--===============0484084667867035370==--

