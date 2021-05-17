Content-Type: multipart/mixed; boundary="===============1568841466993309044=="
MIME-Version: 1.0
From: Bjorn Helgaas <helgaas@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: drivers/pci/controller/pci-xgene.c:511:33: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Mon, 17 May 2021 12:16:15 -0500
Message-ID: <20210517171615.GA23513@bjorn-Precision-5520>
In-Reply-To: <202105171809.Tay9fImZ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1568841466993309044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[+cc Toan, linux-pci]

The patch I think we need is attached below.  I'll post it to the list
separately.

I didn't see any similar issues in the rest of
drivers/pci/controller/.

On Mon, May 17, 2021 at 06:35:17PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d07f6ca923ea0927a1024dfccafc5b53b61cfecc
> commit: 6e5a1fff9096ecd259dedcbbdc812aa90986a40e PCI: Avoid building empt=
y drivers
> date:   10 weeks ago
> config: mips-randconfig-s032-20210517 (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D6e5a1fff9096ecd259dedcbbdc812aa90986a40e
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 6e5a1fff9096ecd259dedcbbdc812aa90986a40e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> sparse warnings: (new ones prefixed by >>)
>    command-line: note: in included file:
>    builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redef=
ined
>    builtin:0:0: sparse: this was the original definition
>    builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redef=
ined
>    builtin:0:0: sparse: this was the original definition
>    builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redef=
ined
>    builtin:0:0: sparse: this was the original definition
>    builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redef=
ined
>    builtin:0:0: sparse: this was the original definition
>    drivers/pci/controller/pci-xgene.c:510:26: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected void *bar_addr=
 @@     got void [noderef] __iomem * @@
>    drivers/pci/controller/pci-xgene.c:510:26: sparse:     expected void *=
bar_addr
>    drivers/pci/controller/pci-xgene.c:510:26: sparse:     got void [noder=
ef] __iomem *
> >> drivers/pci/controller/pci-xgene.c:511:33: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void volatile =
[noderef] __iomem *mem @@     got void *bar_addr @@
>    drivers/pci/controller/pci-xgene.c:511:33: sparse:     expected void v=
olatile [noderef] __iomem *mem
>    drivers/pci/controller/pci-xgene.c:511:33: sparse:     got void *bar_a=
ddr
> >> drivers/pci/controller/pci-xgene.c:512:58: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void volatile =
[noderef] __iomem *mem @@     got void * @@
>    drivers/pci/controller/pci-xgene.c:512:58: sparse:     expected void v=
olatile [noderef] __iomem *mem
>    drivers/pci/controller/pci-xgene.c:512:58: sparse:     got void *
> =

> vim +511 drivers/pci/controller/pci-xgene.c
> =

> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  480  =

> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  481  static void xgene_pcie_setup_ib_reg(struct xgene_pcie_port *port,
> 6dce5aa59e0bf2 drivers/pci/controller/pci-xgene.c Rob Herring    2019-10-=
28  482  				    struct resource_entry *entry,
> 6dce5aa59e0bf2 drivers/pci/controller/pci-xgene.c Rob Herring    2019-10-=
28  483  				    u8 *ib_reg_mask)
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  484  {
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  485  	void __iomem *cfg_base =3D port->cfg_base;
> d963ab22ad32da drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  486  	struct device *dev =3D port->dev;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  487  	void *bar_addr;
> 4ecf6b0f83523f drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  488  	u32 pim_reg;
> 6dce5aa59e0bf2 drivers/pci/controller/pci-xgene.c Rob Herring    2019-10-=
28  489  	u64 cpu_addr =3D entry->res->start;
> 6dce5aa59e0bf2 drivers/pci/controller/pci-xgene.c Rob Herring    2019-10-=
28  490  	u64 pci_addr =3D cpu_addr - entry->offset;
> 6dce5aa59e0bf2 drivers/pci/controller/pci-xgene.c Rob Herring    2019-10-=
28  491  	u64 size =3D resource_size(entry->res);
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  492  	u64 mask =3D ~(size - 1) | EN_REG;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  493  	u32 flags =3D PCI_BASE_ADDRESS_MEM_TYPE_64;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  494  	u32 bar_low;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  495  	int region;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  496  =

> 6dce5aa59e0bf2 drivers/pci/controller/pci-xgene.c Rob Herring    2019-10-=
28  497  	region =3D xgene_pcie_select_ib_reg(ib_reg_mask, size);
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  498  	if (region < 0) {
> d963ab22ad32da drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  499  		dev_warn(dev, "invalid pcie dma-range config\n");
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  500  		return;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  501  	}
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  502  =

> 6dce5aa59e0bf2 drivers/pci/controller/pci-xgene.c Rob Herring    2019-10-=
28  503  	if (entry->res->flags & IORESOURCE_PREFETCH)
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  504  		flags |=3D PCI_BASE_ADDRESS_MEM_PREFETCH;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  505  =

> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  506  	bar_low =3D pcie_bar_low_val((u32)cpu_addr, flags);
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  507  	switch (region) {
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  508  	case 0:
> 4ecf6b0f83523f drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  509  		xgene_pcie_set_ib_mask(port, BRIDGE_CFG_4, flags, size);
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  510  		bar_addr =3D cfg_base + PCI_BASE_ADDRESS_0;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01 @511  		writel(bar_low, bar_addr);
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01 @512  		writel(upper_32_bits(cpu_addr), bar_addr + 0x4);
> 4ecf6b0f83523f drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  513  		pim_reg =3D PIM1_1L;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  514  		break;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  515  	case 1:
> 8e93c5132ca2e5 drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  516  		xgene_pcie_writel(port, IBAR2, bar_low);
> 8e93c5132ca2e5 drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  517  		xgene_pcie_writel(port, IR2MSK, lower_32_bits(mask));
> 4ecf6b0f83523f drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  518  		pim_reg =3D PIM2_1L;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  519  		break;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  520  	case 2:
> 8e93c5132ca2e5 drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  521  		xgene_pcie_writel(port, IBAR3L, bar_low);
> 8e93c5132ca2e5 drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  522  		xgene_pcie_writel(port, IBAR3L + 0x4, upper_32_bits(cpu_addr));
> 8e93c5132ca2e5 drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  523  		xgene_pcie_writel(port, IR3MSKL, lower_32_bits(mask));
> 8e93c5132ca2e5 drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  524  		xgene_pcie_writel(port, IR3MSKL + 0x4, upper_32_bits(mask));
> 4ecf6b0f83523f drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  525  		pim_reg =3D PIM3_1L;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  526  		break;
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  527  	}
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  528  =

> 4ecf6b0f83523f drivers/pci/host/pci-xgene.c       Bjorn Helgaas  2016-10-=
06  529  	xgene_pcie_setup_pims(port, pim_reg, pci_addr, ~(size - 1));
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  530  }
> 5f6b6ccdbe1cdf drivers/pci/host/pci-xgene.c       Tanmay Inamdar 2014-10-=
01  531  =

> =

> :::::: The code at line 511 was first introduced by commit
> :::::: 5f6b6ccdbe1cdfa5aa4347ec5412509b8995db27 PCI: xgene: Add APM X-Gen=
e PCIe driver
> =

> :::::: TO: Tanmay Inamdar <tinamdar@apm.com>
> :::::: CC: Bjorn Helgaas <bhelgaas@google.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


commit c89e93028d61 ("PCI: xgene: Annotate __iomem pointer")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Mon May 17 12:07:00 2021 -0500

    PCI: xgene: Annotate __iomem pointer
    =

    "bar_addr" is passed as the argument to writel(), which expects a
    "void __iomem *".  Annotate "bar_addr" correctly.  Resolves an sparse
    "incorrect type in argument 2 (different address spaces)" warning.
    =

    Link: https://lore.kernel.org/r/202105171809.Tay9fImZ-lkp(a)intel.com
    Reported-by: kernel test robot <lkp@intel.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pc=
i-xgene.c
index 7f503dd4ff81..1a412f5377fb 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -485,7 +485,7 @@ static void xgene_pcie_setup_ib_reg(struct xgene_pcie_p=
ort *port,
 {
 	void __iomem *cfg_base =3D port->cfg_base;
 	struct device *dev =3D port->dev;
-	void *bar_addr;
+	void __iomem *bar_addr;
 	u32 pim_reg;
 	u64 cpu_addr =3D entry->res->start;
 	u64 pci_addr =3D cpu_addr - entry->offset;
--===============1568841466993309044==--

