Content-Type: multipart/mixed; boundary="===============7971191285249116442=="
MIME-Version: 1.0
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2519/4500] ucsi.c:undefined reference to `fwnode_usb_role_switch_get'
Date: Tue, 19 Jan 2021 10:30:08 +0200
Message-ID: <20210119083008.GA3170560@kuha.fi.intel.com>
In-Reply-To: <20210118204040.GA19773@jackp-linux.qualcomm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7971191285249116442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 12:40:40PM -0800, Jack Pham wrote:
> On Mon, Jan 18, 2021 at 06:52:23PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   93bf8b946e5f9a0b0c68155597b53fd8ccce2827
> > commit: 89795852c9c46b9b0701f7376d30a1c5ab4d146c [2519/4500] usb: typec=
: ucsi: Add support for USB role switch
> > config: nios2-randconfig-m031-20210118 (attached as .config)
> > compiler: nios2-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3D89795852c9c46b9b0701f7376d30a1c5ab4d146c
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 89795852c9c46b9b0701f7376d30a1c5ab4d146c
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Dnios2 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>):
> > =

> >    nios2-linux-ld: drivers/usb/typec/ucsi/ucsi.o: in function `ucsi_reg=
ister_port':
> > >> ucsi.c:(.text+0x15a8): undefined reference to `fwnode_usb_role_switc=
h_get'
> >    ucsi.c:(.text+0x15a8): relocation truncated to fit: R_NIOS2_CALL26 a=
gainst `fwnode_usb_role_switch_get'
> > >> nios2-linux-ld: ucsi.c:(.text+0x15e8): undefined reference to `usb_r=
ole_switch_set_role'
> >    ucsi.c:(.text+0x15e8): relocation truncated to fit: R_NIOS2_CALL26 a=
gainst `usb_role_switch_set_role'
> >    nios2-linux-ld: drivers/usb/typec/ucsi/ucsi.o: in function `ucsi_han=
dle_connector_change':
> > >> ucsi.c:(.text+0x1b50): undefined reference to `usb_role_switch_set_r=
ole'
> >    ucsi.c:(.text+0x1b50): relocation truncated to fit: R_NIOS2_CALL26 a=
gainst `usb_role_switch_set_role'
> >    nios2-linux-ld: ucsi.c:(.text+0x1c28): undefined reference to `usb_r=
ole_switch_set_role'
> >    ucsi.c:(.text+0x1c28): relocation truncated to fit: R_NIOS2_CALL26 a=
gainst `usb_role_switch_set_role'
> > =

> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for SERIAL_CORE_CONSOLE
> >    Depends on TTY && HAS_IOMEM
> >    Selected by
> >    - EARLY_PRINTK
> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

> I have no clue about the nios2, so not sure if this is an arch-specific
> linker error or not.
> =

> Hmm but the .config has the following:
> =

> CONFIG_TYPEC_UCSI=3Dy
> CONFIG_USB_ROLE_SWITCH=3Dm
> =

> So I'm guessing this patch also requires a Kconfig change to disallow
> the above combination? If so, should UCSI have a "depends" or a "select"
> on USB_ROLE_SWITCH?

Kconfig needs to prevent the UCSI driver from being built-in when the
USB Role Switch Class is being build as module. That can be achieved
with this trick (it's not ideal, but it works):

        depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH

I'll send the fix.

thanks,

-- =

heikki
--===============7971191285249116442==--

