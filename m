Content-Type: multipart/mixed; boundary="===============0081051513440961003=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [usb:usb-next 56/58] include/linux/unaligned/access_ok.h:8:28: error: redefinition of 'get_unaligned_le16'
Date: Sat, 16 May 2020 13:28:46 +0200
Message-ID: <20200516112846.GB133224@kroah.com>
In-Reply-To: <202005161756.KxL7u2ha%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0081051513440961003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2020 at 05:01:16PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-next
> head:   2478be82de44bee4346eb1f48d4cfa28cd99d2d0
> commit: 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3 [56/58] usb: renesas-xhc=
i: Add the renesas xhci driver
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross=
 ARCH=3Dia64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> In file included from drivers/usb/host/xhci-pci-renesas.c:9:
> >> include/linux/unaligned/access_ok.h:8:28: error: redefinition of 'get_=
unaligned_le16'
> 8 | static __always_inline u16 get_unaligned_le16(const void *p)
> |                            ^~~~~~~~~~~~~~~~~~
> In file included from arch/ia64/include/asm/unaligned.h:5,


Vinod, you need to include another .h file for this file to properly
define this function.

Can you make up a patch for that?

thanks,

greg k-h
--===============0081051513440961003==--

