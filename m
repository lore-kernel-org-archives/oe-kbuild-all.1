Content-Type: multipart/mixed; boundary="===============8827214473108704887=="
MIME-Version: 1.0
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 3/3] Input: mtk-pmic-keys - add support for MT6358
Date: Thu, 20 May 2021 08:57:38 +0200
Message-ID: <87sg2h28pp.fsf@baylibre.com>
In-Reply-To: <202105200248.VC2Rdk6B-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8827214473108704887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

kernel test robot <lkp@intel.com> writes:

> Hi Mattijs,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on input/next]
> [also build test ERROR on v5.13-rc2 next-20210519]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Mattijs-Korpershoek/inpu=
t-MT6358-PMIC-button-support/20210513-001558
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ne=
xt
> config: s390-randconfig-r014-20210519 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/74aae2763d0c259046aa707=
9a46ba0dfe1995e37
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Mattijs-Korpershoek/input-MT6358=
-PMIC-button-support/20210513-001558
>         git checkout 74aae2763d0c259046aa7079a46ba0dfe1995e37
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Ds390 =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/input/keyboard/mtk-pmic-keys.c:80:22: error: 'MT6358_TOPSTATUS'=
 undeclared here (not in a function); did you mean 'MT6397_OCSTATUS0'?
>       80 |   MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>          |                      ^~~~~~~~~~~~~~~~
>    drivers/input/keyboard/mtk-pmic-keys.c:47:14: note: in definition of m=
acro 'MTK_PMIC_KEYS_REGS'
>       47 |  .deb_reg  =3D _deb_reg,  \
>          |              ^~~~~~~~
>>> drivers/input/keyboard/mtk-pmic-keys.c:85:18: error: 'MT6358_TOP_RST_MI=
SC' undeclared here (not in a function); did you mean 'MT6397_TOP_RST_MISC'?
>       85 |  .pmic_rst_reg =3D MT6358_TOP_RST_MISC,
>          |                  ^~~~~~~~~~~~~~~~~~~
>          |                  MT6397_TOP_RST_MISC
This build failure is expected.
As written in the cover letter, this depends on [1]

[1] has been applied to the mfd tree but it's not part of v5.13-rc2

[1] https://lore.kernel.org/r/20210506094116.638527-1-mkorpershoek(a)baylib=
re.com

>
>
> vim +80 drivers/input/keyboard/mtk-pmic-keys.c
>
>     77	=

>     78	static const struct mtk_pmic_regs mt6358_regs =3D {
>     79		.keys_regs[MTK_PMIC_PWRKEY_INDEX] =3D
>   > 80			MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>     81			0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
>     82		.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =3D
>     83			MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>     84			0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
>   > 85		.pmic_rst_reg =3D MT6358_TOP_RST_MISC,
>     86	};
>     87	=

>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8827214473108704887==--

