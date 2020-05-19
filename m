Content-Type: multipart/mixed; boundary="===============0799689081890501965=="
MIME-Version: 1.0
From: Dan Murphy <dmurphy@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 2/4] net: phy: dp83869: Set opmode from straps
Date: Tue, 19 May 2020 12:40:37 -0500
Message-ID: <ac286fd2-b77f-9103-d9f2-aa95ad792476@ti.com>
In-Reply-To: <202005200117.iOd1QuA3%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0799689081890501965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kbuild

On 5/19/20 12:19 PM, kbuild test robot wrote:
> Hi Dan,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on net-next/master]
> [also build test WARNING on robh/for-next sparc-next/master net/master li=
nus/master v5.7-rc6 next-20200518]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/DP83869-Enhan=
cements/20200519-222047
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t 5cdfe8306631b2224e3f81fc5a1e2721c7a1948b
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Dsh
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> drivers/net/phy/dp83869.c: In function 'dp83869_set_strapped_mode':
>>> drivers/net/phy/dp83869.c:171:10: warning: comparison is always false d=
ue to limited range of data type [-Wtype-limits]
> 171 |  if (val < 0)

This looks to be a false positive.

phy_read_mmd will return an errno or a value from 0->15

So if errno is returned then this will be true.

Unless I have to do IS_ERR.

Dan

--===============0799689081890501965==--

