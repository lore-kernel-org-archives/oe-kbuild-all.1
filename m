Content-Type: multipart/mixed; boundary="===============8247518978668071426=="
MIME-Version: 1.0
From: Vinod Koul <vinod.koul@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [usb:usb-next 56/58] include/linux/unaligned/access_ok.h:8:28: error: redefinition of 'get_unaligned_le16'
Date: Sat, 16 May 2020 20:18:16 +0530
Message-ID: <CAEaK=Bwo0-8JEw-C1pBO4=JfyoybEwd3tuM74_i4-nFL3m57Kg@mail.gmail.com>
In-Reply-To: <20200516112846.GB133224@kroah.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8247518978668071426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 16 May 2020 at 16:58, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, May 16, 2020 at 05:01:16PM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git =
usb-next
> > head:   2478be82de44bee4346eb1f48d4cfa28cd99d2d0
> > commit: 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3 [56/58] usb: renesas-x=
hci: Add the renesas xhci driver
> > config: ia64-allmodconfig (attached as .config)
> > compiler: ia64-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cro=
ss ARCH=3Dia64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > In file included from drivers/usb/host/xhci-pci-renesas.c:9:
> > >> include/linux/unaligned/access_ok.h:8:28: error: redefinition of 'ge=
t_unaligned_le16'
> > 8 | static __always_inline u16 get_unaligned_le16(const void *p)
> > |                            ^~~~~~~~~~~~~~~~~~
> > In file included from arch/ia64/include/asm/unaligned.h:5,
>
>
> Vinod, you need to include another .h file for this file to properly
> define this function.
>
> Can you make up a patch for that?

Sure thing, I will get the compiler for ia64 and send the patch soon.

~Vinod
--===============8247518978668071426==--

