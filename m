Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991901DB120
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 08:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737708560; cv=none; b=alxLHT/zQij7o05eDmYKObfu+9CZnONcNKg+YrXtOPMg4JMIyCzTliASuURwWaoUbDTut4jGAwyDM3ou8Qc+3KrM7M1Bieqyz/SnHh1tWiNjMRwvuzyYUaY9WYVaZ+Jv1XWTkRx4/3xDf4vv7YBvgzuGx/UPJTKWEg55sBsblcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737708560; c=relaxed/simple;
	bh=8umo5R5a4gh5yqcF5U22Shgpo2ULpGHiYlAFMmqzXaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bth+qI5JU4DcpuA0flNX4uuCTDKkvl5UBTGpp42sNwxkDZP7OwILP28j1/I4xFzFd0tDUya8eHO9+oSnEvQ3cYeF0mTm9tkwBkLCBxXxTv7IhYVaNYc0EDtNfivKbC5d5OEtcT90+Xgdp9/luselzAvmUSewVto50QhQASh+ddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEnnfSqu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEnnfSqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737708558; x=1769244558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8umo5R5a4gh5yqcF5U22Shgpo2ULpGHiYlAFMmqzXaQ=;
  b=YEnnfSqu5aHDANldnJgpMu7Q0lzm29IkgZwLNE4J4Q3BoXxx3CxPBD+r
   dozoKGQOzBL1mYIdQydKIKrXDX7b/c81VhshJ2CMJLJEmnI85fDCxpDWR
   2QEqkdSBWvDzTej5g20p082kYZuwdRCHM6ObrsM1OD3myLlTo6agaod3p
   ShEF6httVeFhBKIkq0XNM9SlkQudlg5Lm+rqXFqKIka8WDrC60oQ9FHDF
   X5df+mV3dBUA/8ESZelXMeKW8bOhxxgBnSie3stmA41Qxsv66aDtr63pa
   ZUWaRSMB1OGmN8q9u/okOKnkZutNI2mSsXN8L5n3AsoBnJySLu6ATMviq
   g==;
X-CSE-ConnectionGUID: mLQCZR2mTrCkNTm4C/JLgA==
X-CSE-MsgGUID: AUs479Y1SJWEcJ+LLKeIzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55650474"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="55650474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:49:17 -0800
X-CSE-ConnectionGUID: nHlhF4LjS7GRuSCBtchWMg==
X-CSE-MsgGUID: aNbmjr2DTvGS+jEbZOI6eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107531892"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jan 2025 00:49:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbFNJ-000cSL-2l;
	Fri, 24 Jan 2025 08:49:13 +0000
Date: Fri, 24 Jan 2025 16:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/zen-sauce 6/31]
 drivers/pci/controller/intel-nvme-remap.c:129:9: sparse: sparse: cast
 truncates bits from constant value (10601 becomes 1)
Message-ID: <202501241616.0JmUyzfG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/zen-sauce
head:   ae96db84281e1b10aee61ef832aabd0941743e99
commit: 5d011d56a251d34b662ab84ce3ce22a317f396e6 [6/31] ZEN: PCI: Add Intel remapped NVMe device support
config: x86_64-randconfig-122-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241616.0JmUyzfG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241616.0JmUyzfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241616.0JmUyzfG-lkp@intel.com/

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
