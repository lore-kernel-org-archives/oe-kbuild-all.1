Content-Type: multipart/mixed; boundary="===============9183213254435402127=="
MIME-Version: 1.0
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v19 3/4] PCI: microchip: Add host driver for Microchip PCIe controller
Date: Mon, 18 Jan 2021 16:45:17 +0000
Message-ID: <20210118164517.GB16417@e121166-lin.cambridge.arm.com>
In-Reply-To: <202012291014.UP1fULPL-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9183213254435402127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 10:21:23AM +0800, kernel test robot wrote:
> Hi,
> =

> Thank you for the patch! Perhaps something to improve:

Can you fix it up promptly and resend please ?

Thanks,
Lorenzo

> [auto build test WARNING on 3650b228f83adda7e5ee532e2b90429c03f7b9ec]
> =

> url:    https://github.com/0day-ci/linux/commits/daire-mcnamara-microchip=
-com/PCI-microchip-Add-host-driver-for-Microchip-PCIe-controller/20201224-1=
74858
> base:    3650b228f83adda7e5ee532e2b90429c03f7b9ec
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/05ba26bb79a9904585ed680=
19beec93a5258b0f3
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review daire-mcnamara-microchip-com/PCI=
-microchip-Add-host-driver-for-Microchip-PCIe-controller/20201224-174858
>         git checkout 05ba26bb79a9904585ed68019beec93a5258b0f3
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    drivers/pci/controller/pcie-microchip-host.c: In function 'mc_msi_bott=
om_irq_ack':
> >> drivers/pci/controller/pcie-microchip-host.c:436:17: warning: variable=
 'msi' set but not used [-Wunused-but-set-variable]
>      436 |  struct mc_msi *msi;
>          |                 ^~~
> =

> =

> vim +/msi +436 drivers/pci/controller/pcie-microchip-host.c
> =

>    431	=

>    432	static void mc_msi_bottom_irq_ack(struct irq_data *data)
>    433	{
>    434		struct mc_port *port =3D irq_data_get_irq_chip_data(data);
>    435		void __iomem *bridge_base_addr;
>  > 436		struct mc_msi *msi;
>    437		u32 bitpos =3D data->hwirq;
>    438		unsigned long status;
>    439	=

>    440		bridge_base_addr =3D port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
>    441		msi =3D &port->msi;
>    442	=

>    443		writel_relaxed(BIT(bitpos), bridge_base_addr + ISTATUS_MSI);
>    444		status =3D readl_relaxed(bridge_base_addr + ISTATUS_MSI);
>    445		if (!status)
>    446			writel_relaxed(BIT(PM_MSI_INT_MSI_SHIFT), bridge_base_addr + IST=
ATUS_LOCAL);
>    447	}
>    448	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============9183213254435402127==--

