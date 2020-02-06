Content-Type: multipart/mixed; boundary="===============5317118617141519415=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-arm:clearfog 12/13] drivers/pci/pci-bridge-emul.c:278:33: sparse: sparse: incorrect type in assignment (different base types)
Date: Thu, 06 Feb 2020 17:14:57 +0800
Message-ID: <202002061755.4TqSNDvU%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5317118617141519415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   3450ae5b57e5f917cafd07c2ed4e5d3c57ffe313
commit: c7d78c5524e871aeb0179f48a120bfb8fe88897a [12/13] mvebu/clearfog pci=
e updates
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        git checkout c7d78c5524e871aeb0179f48a120bfb8fe88897a
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/pci/pci-bridge-emul.c:278:33: sparse: sparse: incorrect type in =
assignment (different base types)
>> drivers/pci/pci-bridge-emul.c:278:33: sparse:    expected restricted __l=
e16 [usertype] bridgectrl
>> drivers/pci/pci-bridge-emul.c:278:33: sparse:    got int

vim +278 drivers/pci/pci-bridge-emul.c

   263	=

   264	/*
   265	 * Initialize a pci_bridge_emul structure to represent a fake PCI
   266	 * bridge configuration space. The caller needs to have initialized
   267	 * the PCI configuration space with whatever values make sense
   268	 * (typically at least vendor, device, revision), the ->ops pointer,
   269	 * and optionally ->data and ->has_pcie.
   270	 */
   271	int pci_bridge_emul_init(struct pci_bridge_emul *bridge,
   272				 unsigned int flags)
   273	{
   274		bridge->conf.class_revision |=3D cpu_to_le32(PCI_CLASS_BRIDGE_PCI <=
< 16);
   275		bridge->conf.header_type =3D PCI_HEADER_TYPE_BRIDGE;
   276		bridge->conf.cache_line_size =3D 0x10;
   277		bridge->conf.status =3D cpu_to_le16(PCI_STATUS_CAP_LIST);
 > 278		bridge->conf.bridgectrl =3D PCI_BRIDGE_CTL_SERR;
   279		bridge->pci_regs_behavior =3D kmemdup(pci_regs_behavior,
   280						    sizeof(pci_regs_behavior),
   281						    GFP_KERNEL);
   282		if (!bridge->pci_regs_behavior)
   283			return -ENOMEM;
   284	=

   285		if (bridge->has_pcie) {
   286			bridge->conf.capabilities_pointer =3D PCI_CAP_PCIE_START;
   287			bridge->pcie_conf.cap_id =3D PCI_CAP_ID_EXP;
   288			/* Set PCIe v2, root port, slot support */
   289			bridge->pcie_conf.cap =3D
   290				cpu_to_le16(PCI_EXP_TYPE_ROOT_PORT << 4 | 2 |
   291					    PCI_EXP_FLAGS_SLOT);
   292			bridge->pcie_cap_regs_behavior =3D
   293				kmemdup(pcie_cap_regs_behavior,
   294					sizeof(pcie_cap_regs_behavior),
   295					GFP_KERNEL);
   296			if (!bridge->pcie_cap_regs_behavior) {
   297				kfree(bridge->pci_regs_behavior);
   298				return -ENOMEM;
   299			}
   300		}
   301	=

   302		if (flags & PCI_BRIDGE_EMUL_NO_PREFETCHABLE_BAR) {
   303			bridge->pci_regs_behavior[PCI_PREF_MEMORY_BASE / 4].ro =3D ~0;
   304			bridge->pci_regs_behavior[PCI_PREF_MEMORY_BASE / 4].rw =3D 0;
   305		}
   306	=

   307		return 0;
   308	}
   309	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5317118617141519415==--

