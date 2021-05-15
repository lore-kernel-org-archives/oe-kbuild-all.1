Content-Type: multipart/mixed; boundary="===============4054484193138525099=="
MIME-Version: 1.0
From: José Expósito <jose.exposito89@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/5] HID: magicmouse: Magic Trackpad 2 USB battery capacity
Date: Sat, 15 May 2021 20:50:21 +0200
Message-ID: <20210515185021.GA177131@elementary-os.localdomain>
In-Reply-To: <202105121712.MGWeLu1Q-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4054484193138525099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 05:39:31PM +0800, kernel test robot wrote:
> Hi "Jos=C3=A9,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on hid/for-next]
> [also build test ERROR on v5.13-rc1 next-20210511]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/HID-magicmo=
use-register-power-supply/20210512-022327
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-n=
ext
> config: s390-randconfig-r002-20210512 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/701f395a5566b6d2fd3a783=
89983237668902998
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jos-Exp-sito/HID-magicmouse-regi=
ster-power-supply/20210512-022327
>         git checkout 701f395a5566b6d2fd3a78389983237668902998
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Ds390 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    s390-linux-ld: drivers/pcmcia/cistpl.o: in function `set_cis_map':
>    cistpl.c:(.text+0x3a2): undefined reference to `ioremap'
>    s390-linux-ld: cistpl.c:(.text+0x3dc): undefined reference to `iounmap'
>    s390-linux-ld: cistpl.c:(.text+0x404): undefined reference to `iounmap'
>    s390-linux-ld: cistpl.c:(.text+0x416): undefined reference to `ioremap'
>    s390-linux-ld: drivers/pcmcia/cistpl.o: in function `release_cis_mem':
>    cistpl.c:(.text+0xe16): undefined reference to `iounmap'
>    s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_r=
emove':
>    hid-magicmouse.c:(.text+0xd2c): undefined reference to `usb_kill_urb'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0xd48): undefined reference to =
`usb_free_coherent'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0xd54): undefined reference to =
`usb_free_urb'
>    s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_b=
attery_usb_urb_complete':
>    hid-magicmouse.c:(.text+0xe12): undefined reference to `usb_submit_urb'
>    s390-linux-ld: drivers/hid/hid-magicmouse.o: in function `magicmouse_p=
robe':
>    hid-magicmouse.c:(.text+0x1194): undefined reference to `usb_alloc_urb'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0x121a): undefined reference to=
 `usb_alloc_coherent'
>    s390-linux-ld: hid-magicmouse.c:(.text+0x1422): undefined reference to=
 `usb_free_coherent'
>    s390-linux-ld: hid-magicmouse.c:(.text+0x142e): undefined reference to=
 `usb_free_urb'
> >> s390-linux-ld: hid-magicmouse.c:(.text+0x1462): undefined reference to=
 `usb_submit_urb'
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Hi all,

I'm a little bit confused about the build errors reported by Intel's test b=
ot and I'd really appreciate human input.
This is the first patch I submit, so apologies in advance if I missed a bas=
ic step.

I compiled and tested every patch before submission and they all compiled a=
nd worked on this tree:
git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git

After receiving this email, I followed the instructions attached to build i=
t and indeed it failed.
However, I reverted my changes and the kernel still didn't compile.

Is this something I need to fix?

Thank you very much in advance,
Jos=C3=A9 Exp=C3=B3sito
--===============4054484193138525099==--

