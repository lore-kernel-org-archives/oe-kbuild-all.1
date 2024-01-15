Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB801FAB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxkSb/5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705292920; x=1736828920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V1oAIpF8t3An5yyswddKvv5oN6BWV9X7Lf42d++cuL8=;
  b=kxkSb/5ews1KbdSLbctxaygfD00XmmlBWUVmbUtS0/r++JQKgLEz8wg0
   WyqKc+gdIjhrUT7Z+SEM4dksYfLlTwqkUBnqpHhThcCv9OL8D85SbagTO
   2Fakyy0rql7e3ghy27wTLMG1IoMAzemJeYqE21dlMxhU8K4J5YSXDDRrm
   HNxsXE8juQDXlAmw2pJrhT9Z6gzVwFYL19eZ/zc8ctdBgMhgrIYsxTF1d
   tUIOULp9lnTo89PNR6AAz7qez41W9nsdTkrrRs+Ct+TP4qWHSsiiAB9ut
   sbyzjjlGzJJvodenfcFzLagCsaQZsyktbOC+Ann/IXxJrrIjX5ev27czX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="399209733"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="399209733"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 20:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030539599"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="1030539599"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Jan 2024 20:28:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPEaT-000C8t-0W;
	Mon, 15 Jan 2024 04:28:37 +0000
Date: Mon, 15 Jan 2024 12:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 5/31]
 drivers/pci/controller/intel-nvme-remap.c:129:9: sparse: sparse: cast
 truncates bits from constant value (10601 becomes 1)
Message-ID: <202401151207.qiItGNfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   4deded679db72f26a78e8134688c20f9289367df
commit: 86da31dc0b4f191e8c2a75592b853799458113ea [5/31] ZEN: PCI: Add Intel remapped NVMe device support
config: x86_64-randconfig-122-20240115 (https://download.01.org/0day-ci/archive/20240115/202401151207.qiItGNfl-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151207.qiItGNfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151207.qiItGNfl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/intel-nvme-remap.c:129:9: sparse: sparse: cast truncates bits from constant value (10601 becomes 1)
   drivers/pci/controller/intel-nvme-remap.c:129:9: sparse: sparse: cast truncates bits from constant value (106 becomes 6)
>> drivers/pci/controller/intel-nvme-remap.c:143:17: sparse: sparse: cast truncates bits from constant value (c000 becomes 0)
   drivers/pci/controller/intel-nvme-remap.c:168:9: sparse: sparse: cast truncates bits from constant value (8086 becomes 86)
   drivers/pci/controller/intel-nvme-remap.c:174:9: sparse: sparse: cast truncates bits from constant value (10802 becomes 2)
   drivers/pci/controller/intel-nvme-remap.c:174:9: sparse: sparse: cast truncates bits from constant value (108 becomes 8)
>> drivers/pci/controller/intel-nvme-remap.c:446:17: sparse: sparse: Initializer entry defined twice
   drivers/pci/controller/intel-nvme-remap.c:447:18: sparse:   also defined here

vim +129 drivers/pci/controller/intel-nvme-remap.c

    79	
    80	/*
    81	 * Helper macros for tweaking returned contents of PCI configuration space.
    82	 *
    83	 * value contains len bytes of data read from reg.
    84	 * If fixup_reg is included in that range, fix up the contents of that
    85	 * register to fixed_value.
    86	 */
    87	#define NR_FIX8(fixup_reg, fixed_value) do { \
    88			if (reg <= fixup_reg && fixup_reg < reg + len) \
    89				((u8 *) value)[fixup_reg - reg] = (u8) (fixed_value); \
    90		} while (0)
    91	
    92	#define NR_FIX16(fixup_reg, fixed_value) do { \
    93			NR_FIX8(fixup_reg, fixed_value); \
    94			NR_FIX8(fixup_reg + 1, fixed_value >> 8); \
    95		} while (0)
    96	
    97	#define NR_FIX24(fixup_reg, fixed_value) do { \
    98			NR_FIX8(fixup_reg, fixed_value); \
    99			NR_FIX8(fixup_reg + 1, fixed_value >> 8); \
   100			NR_FIX8(fixup_reg + 2, fixed_value >> 16); \
   101		} while (0)
   102	
   103	#define NR_FIX32(fixup_reg, fixed_value) do { \
   104			NR_FIX16(fixup_reg, (u16) fixed_value); \
   105			NR_FIX16(fixup_reg + 2, fixed_value >> 16); \
   106		} while (0)
   107	
   108	/*
   109	 * Read PCI config space of the slot 0 (AHCI) device.
   110	 * We pass through the read request to the underlying device, but
   111	 * tweak the results in some cases.
   112	 */
   113	static int nvme_remap_pci_read_slot0(struct pci_bus *bus, int reg,
   114					     int len, u32 *value)
   115	{
   116		struct nvme_remap_dev *nrdev = nrdev_from_bus(bus);
   117		struct pci_bus *ahci_dev_bus = nrdev->dev->bus;
   118		int ret;
   119	
   120		ret = ahci_dev_bus->ops->read(ahci_dev_bus, nrdev->dev->devfn,
   121					      reg, len, value);
   122		if (ret)
   123			return ret;
   124	
   125		/*
   126		 * Adjust the device class, to prevent this driver from attempting to
   127		 * additionally probe the device we're simulating here.
   128		 */
 > 129		NR_FIX24(PCI_CLASS_PROG, PCI_CLASS_STORAGE_SATA_AHCI);
   130	
   131		/*
   132		 * Unset interrupt pin, otherwise ACPI tries to find routing
   133		 * info for our virtual IRQ, fails, and complains.
   134		 */
   135		NR_FIX8(PCI_INTERRUPT_PIN, 0);
   136	
   137		/*
   138		 * Truncate the AHCI BAR to not include the region that covers the
   139		 * hidden devices. This will cause the ahci driver to successfully
   140		 * probe th new device (instead of handing it over to this driver).
   141		 */
   142		if (nrdev->bar_sizing) {
 > 143			NR_FIX32(PCI_BASE_ADDRESS_5, ~(SZ_16K - 1));
   144			nrdev->bar_sizing = false;
   145		}
   146	
   147		return PCIBIOS_SUCCESSFUL;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
