Content-Type: multipart/mixed; boundary="===============1427092649609281170=="
MIME-Version: 1.0
From: Tony Lindgren <tony@atomide.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2881/4780] drivers/bus/ti-sysc.c:1398:13: warning: variable 'error' is used uninitialized whenever 'if' condition is false
Date: Tue, 25 May 2021 08:51:29 +0300
Message-ID: <YKyQYWsKsO/28uy5@atomide.com>
In-Reply-To: <YKyPi2aXpnQZDnw/@atomide.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1427092649609281170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* Tony Lindgren <tony@atomide.com> [210525 08:47]:
> * Tony Lindgren <tony@atomide.com> [210525 08:39]:
> > * kernel test robot <lkp@intel.com> [210524 10:00]:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> > > head:   674dc447b09fb668976c6ab1356b11e02ff209ed
> > > commit: ec527f23e06a0521cd5b043aa31a4ccdf6cea549 [2881/4780] bus: ti-=
sysc: Fix am335x resume hang for usb otg module
> > > config: arm-randconfig-r035-20210524 (attached as .config)
> > > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project =
93d1e5822ed64abd777eb94ea9899e96c4c39fbe)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install arm cross compiling tool for clang build
> > >         # apt-get install binutils-arm-linux-gnueabi
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git/commit/?id=3Dec527f23e06a0521cd5b043aa31a4ccdf6cea549
> > >         git remote add linux-next https://git.kernel.org/pub/scm/linu=
x/kernel/git/next/linux-next.git
> > >         git fetch --no-tags linux-next master
> > >         git checkout ec527f23e06a0521cd5b043aa31a4ccdf6cea549
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s ARCH=3Darm =

> > > =

> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > =

> > > All warnings (new ones prefixed by >>):
> > > =

> > > >> drivers/bus/ti-sysc.c:1398:13: warning: variable 'error' is used u=
ninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
> > >            } else if (ddata->needs_resume) {
> > >                       ^~~~~~~~~~~~~~~~~~~
> > >    drivers/bus/ti-sysc.c:1406:9: note: uninitialized use occurs here
> > >            return error;
> > >                   ^~~~~
> > >    drivers/bus/ti-sysc.c:1398:9: note: remove the 'if' if its conditi=
on is always true
> > >            } else if (ddata->needs_resume) {
> > >                   ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >    drivers/bus/ti-sysc.c:1386:11: note: initialize the variable 'erro=
r' to silence this warning
> > >            int error;
> > >                     ^
> > >                      =3D 0
> > >    1 warning generated.
> > > =

> > > =

> > > vim +1398 drivers/bus/ti-sysc.c
> > > =

> > >   1382	=

> > >   1383	static int __maybe_unused sysc_noirq_resume(struct device *dev)
> > >   1384	{
> > >   1385		struct sysc *ddata;
> > >   1386		int error;
> > >   1387	=

> > >   1388		ddata =3D dev_get_drvdata(dev);
> > >   1389	=

> > >   1390		if (ddata->cfg.quirks &
> > >   1391		    (SYSC_QUIRK_LEGACY_IDLE | SYSC_QUIRK_NO_IDLE))
> > >   1392			return 0;
> > >   1393	=

> > >   1394		if (ddata->cfg.quirks & SYSC_QUIRK_REINIT_ON_RESUME) {
> > >   1395			error =3D sysc_reinit_module(ddata, ddata->needs_resume);
> > >   1396			if (error)
> > >   1397				dev_warn(dev, "noirq_resume failed: %i\n", error);
> > > > 1398		} else if (ddata->needs_resume) {
> > >   1399			error =3D sysc_runtime_resume(dev);
> > >   1400			if (error)
> > >   1401				dev_warn(dev, "noirq_resume failed: %i\n", error);
> > >   1402		}
> > >   1403	=

> > >   1404		ddata->needs_resume =3D 0;
> > >   1405	=

> > >   1406		return error;
> > >   1407	}
> > >   1408	=

> > =

> > Thanks for the report, I'll update the patch to init error =3D 0 here.
> =

> Oh this was already fixed in v2 version of this patch:
> =

> [PATCHv2] bus: ti-sysc: Fix am335x resume hang for usb otg module

Sorry nope, error still needs to be initialized to 0. Only noirq_suspend()
changed in v2, while noirq_resume() did not change. Will send out v3.

Regards,

Tony
--===============1427092649609281170==--

