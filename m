Content-Type: multipart/mixed; boundary="===============1606178552944731081=="
MIME-Version: 1.0
From: Sean Anderson <sean.anderson@seco.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] pwm: Add support for Xilinx AXI Timer
Date: Tue, 04 May 2021 13:16:59 -0400
Message-ID: <3082e917-be20-8269-5542-6c750cf97c04@seco.com>
In-Reply-To: <202105041013.VkdTa8rG-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1606178552944731081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/3/21 10:24 PM, kernel test robot wrote:
 > Hi Sean,
 >
 > Thank you for the patch! Yet something to improve:
 >
 > [auto build test ERROR on arm64/for-next/core]
 > [also build test ERROR on linux/master linus/master v5.12 next-20210503]
 > [cannot apply to pwm/for-next xlnx/master]
 > [If your patch is applied to the wrong git tree, kindly drop us a note.
 > And when submitting patch, we suggest to use '--base' as documented in
 > https://git-scm.com/docs/git-format-patch]
 >
 > url:    https://github.com/0day-ci/linux/commits/Sean-Anderson/dt-bindin=
gs-pwm-Add-Xilinx-AXI-Timer/20210504-054451
 > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git =
for-next/core
 > config: sh-allmodconfig (attached as .config)
 > compiler: sh4-linux-gcc (GCC) 9.3.0
 > reproduce (this is a W=3D1 build):
 >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
 >          chmod +x ~/bin/make.cross
 >          # https://github.com/0day-ci/linux/commit/164c8df701eef0c9509d5=
44501a1de5c406e93cb
 >          git remote add linux-review https://github.com/0day-ci/linux
 >          git fetch --no-tags linux-review Sean-Anderson/dt-bindings-pwm-=
Add-Xilinx-AXI-Timer/20210504-054451
 >          git checkout 164c8df701eef0c9509d544501a1de5c406e93cb
 >          # save the attached .config to linux build tree
 >          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss W=3D1 ARCH=3Dsh
 >
 > If you fix the issue, kindly add following tag as appropriate
 > Reported-by: kernel test robot <lkp@intel.com>
 >
 > All errors (new ones prefixed by >>, old ones prefixed by <<):
 >
 > ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
 >>> ERROR: modpost: "clk_rate_exclusive_get" [drivers/pwm/pwm-xilinx.ko] u=
ndefined!
 >>> ERROR: modpost: "clk_rate_exclusive_put" [drivers/pwm/pwm-xilinx.ko] u=
ndefined!

These should be defined in drivers/sh/clk/core.c, because
CONFIG_HAVE_CLK is selected (see the definition in include/linux/clk.h)
but they are not.

+CC SH maintainers

--Sean

 > ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
 > ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!
 >
 > Kconfig warnings: (for reference only)
 >     WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
 >     Depends on SOUND && !UML && SND && SND_SOC && SND_ATMEL_SOC && HAS_D=
MA
 >     Selected by
 >     - SND_ATMEL_SOC_SSC && SOUND && !UML && SND && SND_SOC && SND_ATMEL_=
SOC
 >     - SND_ATMEL_SOC_SSC_PDC && SOUND && !UML && SND && SND_SOC && SND_AT=
MEL_SOC && ATMEL_SSC
 >
 > ---
 > 0-DAY CI Kernel Test Service, Intel Corporation
 > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
 >
--===============1606178552944731081==--

