Content-Type: multipart/mixed; boundary="===============6790135309356363636=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 4/5] clk: qcom: Add SDM660 GPU Clock Controller (GPUCC) driver
Date: Fri, 02 Oct 2020 13:39:44 +0800
Message-ID: <20201002053944.GD30771@intel.com>
In-Reply-To: <CAK7fi1Yvaj+Emad8GboLHSu6v-E81pX=GmCtmwm=utzQEtu2Cg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6790135309356363636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 11:58:50PM +0200, AngeloGioacchino Del Regno wrote:
> The kernel test robot is wrong: this commit builds fine by
Thanks for the info and sorry for the wrong report. Currently it is
hard to detect the base in this case automatically, if possible, we
recommend to use --base option when git format patch, this provides
extra hint to us when looking for the base.

> merging in the required patch series (464958) named
> "Qualcomm clock fixes and preparation for SDM660"
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D464958
> =

> In that series there is a commit that generalizes the MSM8996-only
> gfx3d clock ops and introduces the definition of clk_rcg2_gfx3d.
> =

> Il giorno mer 30 set 2020 alle ore 22:46 kernel test robot
> <lkp@intel.com> ha scritto:
> >
> > Hi,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on clk/clk-next]
> > [also build test ERROR on robh/for-next linux/master linus/master v5.9-=
rc7 next-20200930]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/kholk11-gmail-com/SDM6=
30-660-Multimedia-and-GPU-clock-controllers/20200926-210437
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git c=
lk-next
> > config: m68k-allmodconfig (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/0551514b1ab723837163a=
8c4cd84d22831e38019
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review kholk11-gmail-com/SDM630-660-M=
ultimedia-and-GPU-clock-controllers/20200926-210437
> >         git checkout 0551514b1ab723837163a8c4cd84d22831e38019
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Dm68k
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/clk/qcom/gpucc-sdm660.c:106:15: error: variable 'gfx3d_clk_s=
rc' has initializer but incomplete type
> >      106 | static struct clk_rcg2_gfx3d gfx3d_clk_src =3D {
> >          |               ^~~~~~~~~~~~~~
> > >> drivers/clk/qcom/gpucc-sdm660.c:107:3: error: 'struct clk_rcg2_gfx3d=
' has no member named 'div'
> >      107 |  .div =3D 2,
> >          |   ^~~
> >    drivers/clk/qcom/gpucc-sdm660.c:107:9: warning: excess elements in s=
truct initializer
> >      107 |  .div =3D 2,
> >          |         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:107:9: note: (near initialization fo=
r 'gfx3d_clk_src')
> > >> drivers/clk/qcom/gpucc-sdm660.c:108:3: error: 'struct clk_rcg2_gfx3d=
' has no member named 'rcg'
> >      108 |  .rcg =3D {
> >          |   ^~~
> > >> drivers/clk/qcom/gpucc-sdm660.c:108:9: error: extra brace group at e=
nd of initializer
> >      108 |  .rcg =3D {
> >          |         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:108:9: note: (near initialization fo=
r 'gfx3d_clk_src')
> >    drivers/clk/qcom/gpucc-sdm660.c:108:9: warning: excess elements in s=
truct initializer
> >    drivers/clk/qcom/gpucc-sdm660.c:108:9: note: (near initialization fo=
r 'gfx3d_clk_src')
> > >> drivers/clk/qcom/gpucc-sdm660.c:121:3: error: 'struct clk_rcg2_gfx3d=
' has no member named 'hws'
> >      121 |  .hws =3D (struct clk_hw*[]){
> >          |   ^~~
> >    drivers/clk/qcom/gpucc-sdm660.c:121:9: warning: excess elements in s=
truct initializer
> >      121 |  .hws =3D (struct clk_hw*[]){
> >          |         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:121:9: note: (near initialization fo=
r 'gfx3d_clk_src')
> > >> drivers/clk/qcom/gpucc-sdm660.c:139:25: error: invalid use of undefi=
ned type 'struct clk_rcg2_gfx3d'
> >      139 |     .hw =3D &gfx3d_clk_src.rcg.clkr.hw,
> >          |                         ^
> >    drivers/clk/qcom/gpucc-sdm660.c:257:45: error: 'NO_RET_PERIPH' undec=
lared here (not in a function)
> >      257 |  .flags =3D CLAMP_IO | SW_RESET | AON_RESET | NO_RET_PERIPH,
> >          |                                             ^~~~~~~~~~~~~
> >    drivers/clk/qcom/gpucc-sdm660.c:277:34: error: invalid use of undefi=
ned type 'struct clk_rcg2_gfx3d'
> >      277 |  [GFX3D_CLK_SRC] =3D &gfx3d_clk_src.rcg.clkr,
> >          |                                  ^
> > >> drivers/clk/qcom/gpucc-sdm660.c:106:30: error: storage size of 'gfx3=
d_clk_src' isn't known
> >      106 | static struct clk_rcg2_gfx3d gfx3d_clk_src =3D {
> >          |                              ^~~~~~~~~~~~~
> >
> > vim +/gfx3d_clk_src +106 drivers/clk/qcom/gpucc-sdm660.c
> >
> >    105
> >  > 106  static struct clk_rcg2_gfx3d gfx3d_clk_src =3D {
> >  > 107          .div =3D 2,
> >  > 108          .rcg =3D {
> >    109                  .cmd_rcgr =3D 0x1070,
> >    110                  .mnd_width =3D 0,
> >    111                  .hid_width =3D 5,
> >    112                  .parent_map =3D gpucc_parent_map_1,
> >    113                  .clkr.hw.init =3D &(struct clk_init_data){
> >    114                          .name =3D "gfx3d_clk_src",
> >    115                          .parent_data =3D gpucc_parent_data_1,
> >    116                          .num_parents =3D 4,
> >    117                          .ops =3D &clk_gfx3d_ops,
> >    118                          .flags =3D CLK_SET_RATE_PARENT | CLK_OP=
S_PARENT_ENABLE,
> >    119                  },
> >    120          },
> >  > 121          .hws =3D (struct clk_hw*[]){
> >    122                  &gpucc_cxo_clk.clkr.hw,
> >    123                  &gpu_pll0_pll_out_main.clkr.hw,
> >    124                  &gpu_pll1_pll_out_main.clkr.hw,
> >    125          }
> >    126  };
> >    127
> >    128  static struct clk_branch gpucc_gfx3d_clk =3D {
> >    129          .halt_reg =3D 0x1098,
> >    130          .halt_check =3D BRANCH_HALT,
> >    131          .hwcg_reg =3D 0x1098,
> >    132          .hwcg_bit =3D 1,
> >    133          .clkr =3D {
> >    134                  .enable_reg =3D 0x1098,
> >    135                  .enable_mask =3D BIT(0),
> >    136                  .hw.init =3D &(struct clk_init_data){
> >    137                          .name =3D "gpucc_gfx3d_clk",
> >    138                          .parent_data =3D &(const struct clk_par=
ent_data){
> >  > 139                                  .hw =3D &gfx3d_clk_src.rcg.clkr=
.hw,
> >    140                          },
> >    141                          .num_parents =3D 1,
> >    142                          .ops =3D &clk_branch2_ops,
> >    143                          .flags =3D CLK_SET_RATE_PARENT,
> >    144                  },
> >    145          },
> >    146  };
> >    147
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============6790135309356363636==--

