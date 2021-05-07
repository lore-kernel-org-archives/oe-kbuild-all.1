Content-Type: multipart/mixed; boundary="===============5920199774232440369=="
MIME-Version: 1.0
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 4/5] phy: ralink: Kconfig: enable COMPILE_TEST on mt7621-pci-phy driver
Date: Fri, 07 May 2021 08:13:21 +0200
Message-ID: <CAMhs-H9Y=Q7PVT0sS02LzwHSj2PbePF2_qgLM+U569PyFBmAEA@mail.gmail.com>
In-Reply-To: <202105062302.YjXZOAuy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5920199774232440369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 6, 2021 at 5:59 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Sergio,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on staging/staging-testing]
> [also build test WARNING on linus/master next-20210506]
> [cannot apply to robh/for-next v5.12]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Sergio-Paracuellos/phy-r=
alink-mt7621-pci-phy-some-improvements/20210506-191714
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.gi=
t e120332923e13d8d9386594a83dc7cbf327e3edf
> config: sparc-allyesconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/44e8bb824a0a4af6fc41d67=
b70ec3a678bd8125f
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sergio-Paracuellos/phy-ralink-mt=
7621-pci-phy-some-improvements/20210506-191714
>         git checkout 44e8bb824a0a4af6fc41d67b70ec3a678bd8125f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dsparc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/device.h:15,
>                     from include/linux/node.h:18,
>                     from include/linux/cpu.h:17,
>                     from include/linux/of_device.h:5,
>                     from drivers/phy/ralink/phy-mt7621-pci.c:13:
>    drivers/phy/ralink/phy-mt7621-pci.c: In function 'mt7621_pcie_phy_of_x=
late':
> >> drivers/phy/ralink/phy-mt7621-pci.c:277:4: warning: cast from pointer =
to integer of different size [-Wpointer-to-int-cast]
>      277 |    (unsigned int)mt7621_phy->port_base, mt7621_phy->has_dual_p=
ort);
>          |    ^
>    include/linux/dev_printk.h:118:33: note: in definition of macro 'dev_i=
nfo'
>      118 |  _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
>          |                                 ^~~~~~~~~~~
>

Thanks!, COMPILE_TEST is doing a good job there :). Ok, so I have just
sent a patch for this:
See: https://lkml.org/lkml/2021/5/7/28

Best regards,
    Sergio Paracuellos

>
> vim +277 drivers/phy/ralink/phy-mt7621-pci.c
>
> d87da32372a03c Sergio Paracuellos 2020-11-21  265
> d87da32372a03c Sergio Paracuellos 2020-11-21  266  static struct phy *mt7=
621_pcie_phy_of_xlate(struct device *dev,
> d87da32372a03c Sergio Paracuellos 2020-11-21  267                        =
                   struct of_phandle_args *args)
> d87da32372a03c Sergio Paracuellos 2020-11-21  268  {
> d87da32372a03c Sergio Paracuellos 2020-11-21  269       struct mt7621_pci=
_phy *mt7621_phy =3D dev_get_drvdata(dev);
> d87da32372a03c Sergio Paracuellos 2020-11-21  270
> d87da32372a03c Sergio Paracuellos 2020-11-21  271       if (WARN_ON(args-=
>args[0] >=3D MAX_PHYS))
> d87da32372a03c Sergio Paracuellos 2020-11-21  272               return ER=
R_PTR(-ENODEV);
> d87da32372a03c Sergio Paracuellos 2020-11-21  273
> d87da32372a03c Sergio Paracuellos 2020-11-21  274       mt7621_phy->has_d=
ual_port =3D args->args[0];
> d87da32372a03c Sergio Paracuellos 2020-11-21  275
> d87da32372a03c Sergio Paracuellos 2020-11-21  276       dev_info(dev, "PH=
Y for 0x%08x (dual port =3D %d)\n",
> d87da32372a03c Sergio Paracuellos 2020-11-21 @277                (unsigne=
d int)mt7621_phy->port_base, mt7621_phy->has_dual_port);
> d87da32372a03c Sergio Paracuellos 2020-11-21  278
> d87da32372a03c Sergio Paracuellos 2020-11-21  279       return mt7621_phy=
->phy;
> d87da32372a03c Sergio Paracuellos 2020-11-21  280  }
> d87da32372a03c Sergio Paracuellos 2020-11-21  281
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5920199774232440369==--

