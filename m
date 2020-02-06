Content-Type: multipart/mixed; boundary="===============6789927495275700081=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-arm:cex7 38/107] drivers/pci/controller/mobiveil/pcie-mobiveil.c:44:49: sparse: sparse: incorrect type in return expression (different address spaces)
Date: Thu, 06 Feb 2020 20:13:45 +0800
Message-ID: <202002062040.DAzWjcLa%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6789927495275700081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.armlinux.org.uk/~rmk/linux-arm cex7
head:   2f8726526ed0fd189f8a945c06f8b9850777a5ca
commit: a02c94f02000bfb8ad5b43405162d4906a2534f6 [38/107] PCI: mobiveil: Re=
factor Mobiveil PCIe Host Bridge IP driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout a02c94f02000bfb8ad5b43405162d4906a2534f6
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:44:49: sparse: sparse: i=
ncorrect type in return expression (different address spaces)
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:44:49: sparse:    expect=
ed void *
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:44:49: sparse:    got vo=
id [noderef] <asn:2> *
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:48:41: sparse: sparse: i=
ncorrect type in return expression (different address spaces)
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:48:41: sparse:    expect=
ed void *
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:48:41: sparse:    got vo=
id [noderef] <asn:2> *
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:106:34: sparse: sparse: =
incorrect type in argument 1 (different address spaces)
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:106:34: sparse:    expec=
ted void [noderef] <asn:2> *addr
>> drivers/pci/controller/mobiveil/pcie-mobiveil.c:106:34: sparse:    got v=
oid *[assigned] addr
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:121:35: sparse: sparse: =
incorrect type in argument 1 (different address spaces)
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:121:35: sparse:    expec=
ted void [noderef] <asn:2> *addr
   drivers/pci/controller/mobiveil/pcie-mobiveil.c:121:35: sparse:    got v=
oid *[assigned] addr

vim +44 drivers/pci/controller/mobiveil/pcie-mobiveil.c

    38	=

    39	static void *mobiveil_pcie_comp_addr(struct mobiveil_pcie *pcie, u32=
 off)
    40	{
    41		if (off < PAGED_ADDR_BNDRY) {
    42			/* For directly accessed registers, clear the pg_sel field */
    43			mobiveil_pcie_sel_page(pcie, 0);
  > 44			return pcie->csr_axi_slave_base + off;
    45		}
    46	=

    47		mobiveil_pcie_sel_page(pcie, OFFSET_TO_PAGE_IDX(off));
    48		return pcie->csr_axi_slave_base + OFFSET_TO_PAGE_ADDR(off);
    49	}
    50	=

    51	static int mobiveil_pcie_read(void __iomem *addr, int size, u32 *val)
    52	{
    53		if ((uintptr_t)addr & (size - 1)) {
    54			*val =3D 0;
    55			return PCIBIOS_BAD_REGISTER_NUMBER;
    56		}
    57	=

    58		switch (size) {
    59		case 4:
    60			*val =3D readl(addr);
    61			break;
    62		case 2:
    63			*val =3D readw(addr);
    64			break;
    65		case 1:
    66			*val =3D readb(addr);
    67			break;
    68		default:
    69			*val =3D 0;
    70			return PCIBIOS_BAD_REGISTER_NUMBER;
    71		}
    72	=

    73		return PCIBIOS_SUCCESSFUL;
    74	}
    75	=

    76	static int mobiveil_pcie_write(void __iomem *addr, int size, u32 val)
    77	{
    78		if ((uintptr_t)addr & (size - 1))
    79			return PCIBIOS_BAD_REGISTER_NUMBER;
    80	=

    81		switch (size) {
    82		case 4:
    83			writel(val, addr);
    84			break;
    85		case 2:
    86			writew(val, addr);
    87			break;
    88		case 1:
    89			writeb(val, addr);
    90			break;
    91		default:
    92			return PCIBIOS_BAD_REGISTER_NUMBER;
    93		}
    94	=

    95		return PCIBIOS_SUCCESSFUL;
    96	}
    97	=

    98	u32 mobiveil_csr_read(struct mobiveil_pcie *pcie, u32 off, size_t si=
ze)
    99	{
   100		void *addr;
   101		u32 val;
   102		int ret;
   103	=

   104		addr =3D mobiveil_pcie_comp_addr(pcie, off);
   105	=

 > 106		ret =3D mobiveil_pcie_read(addr, size, &val);
   107		if (ret)
   108			dev_err(&pcie->pdev->dev, "read CSR address failed\n");
   109	=

   110		return val;
   111	}
   112	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============6789927495275700081==--

