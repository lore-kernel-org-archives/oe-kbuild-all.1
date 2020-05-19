Content-Type: multipart/mixed; boundary="===============2089672792737607403=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 2/4] net: phy: dp83869: Set opmode from straps
Date: Wed, 20 May 2020 07:54:33 +0800
Message-ID: <20200519235433.GA32726@intel.com>
In-Reply-To: <ac286fd2-b77f-9103-d9f2-aa95ad792476@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2089672792737607403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 12:40:37PM -0500, Dan Murphy wrote:
> kbuild
> =

> On 5/19/20 12:19 PM, kbuild test robot wrote:
> > Hi Dan,
> > =

> > I love your patch! Perhaps something to improve:
> > =

> > [auto build test WARNING on net-next/master]
> > [also build test WARNING on robh/for-next sparc-next/master net/master =
linus/master v5.7-rc6 next-20200518]
> > [if your patch is applied to the wrong git tree, please drop us a note =
to help
> > improve the system. BTW, we also suggest to use '--base' option to spec=
ify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/3=
7406982]
> > =

> > url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/DP83869-Enh=
ancements/20200519-222047
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.=
git 5cdfe8306631b2224e3f81fc5a1e2721c7a1948b
> > config: sh-allmodconfig (attached as .config)
> > compiler: sh4-linux-gcc (GCC) 9.3.0
> > reproduce:
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # save the attached .config to linux build tree
> >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.c=
ross ARCH=3Dsh
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > =

> > drivers/net/phy/dp83869.c: In function 'dp83869_set_strapped_mode':
> > > > drivers/net/phy/dp83869.c:171:10: warning: comparison is always fal=
se due to limited range of data type [-Wtype-limits]
> > 171 |  if (val < 0)
> =

> This looks to be a false positive.
> =

> phy_read_mmd will return an errno or a value from 0->15
thanks, here because val is defined as "u16 val", the comparison
to < 0 can not work as expected. Any err returned from phy_read_mmd,
which is int, will be converted to u16.

> =

> So if errno is returned then this will be true.
> =

> Unless I have to do IS_ERR.
> =

> Dan
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============2089672792737607403==--

