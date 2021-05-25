Content-Type: multipart/mixed; boundary="===============7134983729557005025=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] OF: of_address: clean up OF stub & extern functions
Date: Mon, 24 May 2021 18:56:08 -0700
Message-ID: <e16ec6e1-9699-9146-8516-7b792d0b959d@infradead.org>
In-Reply-To: <202105250652.aSwyXJ3a-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7134983729557005025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/24/21 4:02 PM, kernel test robot wrote:
> Hi Randy,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linux/master linus/master v5.13-rc3 next-202105=
24]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Randy-Dunlap/OF-of_addre=
ss-clean-up-OF-stub-extern-functions/20210525-031115
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> config: s390-randconfig-r001-20210524 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/8a9c54f1437e3af04c6de3b=
9606b46437ea69a12
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Randy-Dunlap/OF-of_address-clean=
-up-OF-stub-extern-functions/20210525-031115
>         git checkout 8a9c54f1437e3af04c6de3b9606b46437ea69a12
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Ds390 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Yes, this patch wasn't expected to fix all of these arch/s390/ build errors.

Before this patch: (9 undefined symbols)

ERROR: modpost: "devm_ioremap_resource" [drivers/crypto/ccree/ccree.ko] und=
efined!
ERROR: modpost: "debugfs_create_regset32" [drivers/crypto/ccree/ccree.ko] u=
ndefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/media/rc/ir-hix5hd2.ko] un=
defined!
ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!
ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xil=
lybus_of.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefine=
d!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma_mgmt.ko] und=
efined!
ERROR: modpost: "of_address_to_resource" [drivers/dma/qcom/hdma_mgmt.ko] un=
defined!

This patch only affected the last symbol above. And it covers of_iomap()
in my build testing as well.

After this patch: (8 undefined symbols)

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

> ERROR: modpost: "devm_ioremap_resource" [drivers/crypto/ccree/ccree.ko] u=
ndefined!
> ERROR: modpost: "debugfs_create_regset32" [drivers/crypto/ccree/ccree.ko]=
 undefined!
> ERROR: modpost: "devm_ioremap_resource" [drivers/media/rc/ir-hix5hd2.ko] =
undefined!
> ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!
> ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
>>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus=
/xillybus_of.ko] undefined!
> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefi=
ned!
> ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma_mgmt.ko] u=
ndefined!


I think that all of these arch/s390/ builds undefined symbols when CONFIG_H=
AS_IOMEM
is not set are low priority (or no priority) for most people.

-- =

~Randy

--===============7134983729557005025==--

