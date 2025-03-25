Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E160D269CFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 23:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742946956; cv=none; b=mtAB8MGeQMRM68g3clCZgmF2qcVllcSZYIvWSajbtZiBTRgiZ3QJkJD8A9nlHau272GPyPawCXMeQKGh1vTjO1ma1T2SUIW2VLQQ2WPZQ5Tyv8GzHhzEiK9O4swiuNbi38orSTk9hmM1J6qPbPct7NogMH/gt76E8kjJDEPXRZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742946956; c=relaxed/simple;
	bh=QYuec8zDBFOYYlVE7WqPk2TsfNZ9Oc5FaphroppRVDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiWt+R20JIzFHf7GtkDsRsehSLGnUUZ7m6mWDjm7civTAEGrN9SuGuA4RAoPxcM7bCmdrJnj6uo8Xt6IZ3IQHHCZrKKPE+uPAajQQGyQqlkcx1GEUMAxzXtHl1D4oKjBhTLuZDHcN9egFeAt/b9/id/PJfTbvR/O0kwfJhuaG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWdEzxfH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWdEzxfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742946954; x=1774482954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYuec8zDBFOYYlVE7WqPk2TsfNZ9Oc5FaphroppRVDM=;
  b=WWdEzxfHoJtxXI8wWOqSfwpnJgfXlmc7cSeLK1WURTTdCdtapCWoPfFt
   Qf5H+GuzG8U6CzUaWNzCE6BiwnliY3QS4WQykpHaQ9W7ndGRBRjnbdwXd
   yn1YdvmWbH0psMCZ4P1G4TZ0+TaXyJCfaxewpUrCi/NvwWmteZecxebOj
   r6SyzNTljU8fILLfMAm2RgX5Zosja0uc0+GkZBhN5NCZ6gi71sC0IWiQS
   XTcbrIAK6trUFoz2yrAwK0xbglq5vt+CIaVqhDDHRqnvCLGD8rOXTNPjo
   keudAINsDAOdUuGMVknwqNWmCj6lMsptf3kTHHsBG8pWhOh/PPHrNKkUQ
   A==;
X-CSE-ConnectionGUID: bKZ0ThhVTQqgQytl0tzLWQ==
X-CSE-MsgGUID: b85iKxmmS6KVcaK98Evmmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54420980"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="54420980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 16:55:52 -0700
X-CSE-ConnectionGUID: n3fcm5cET0GqxYzSLFlOwg==
X-CSE-MsgGUID: J8qFYTQsTcOCsXnzd1U4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="125064012"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2025 16:55:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txE7Y-0005Je-34;
	Tue, 25 Mar 2025 23:55:48 +0000
Date: Wed, 26 Mar 2025 07:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 drivers/platform/x86/p2sb.c:87:9: error: call to undeclared function
 'pci_scan_single_device'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202503260726.aWPDg1qZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   efded119e9b07f0476fc164f14336c7eb3401dba
commit: 7662d999c05b7ca019aa86cea9acfdf698a2f611 [2/2] ANDROID: GKI: x86: Add hidden i2c configs
config: x86_64-buildonly-randconfig-003-20250326 (https://download.01.org/0day-ci/archive/20250326/202503260726.aWPDg1qZ-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260726.aWPDg1qZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260726.aWPDg1qZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/p2sb.c:87:9: error: call to undeclared function 'pci_scan_single_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |         pdev = pci_scan_single_device(bus, devfn);
         |                ^
>> drivers/platform/x86/p2sb.c:87:7: error: incompatible integer to pointer conversion assigning to 'struct pci_dev *' from 'int' [-Wint-conversion]
      87 |         pdev = pci_scan_single_device(bus, devfn);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/p2sb.c:94:2: error: call to undeclared function 'pci_stop_and_remove_bus_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         pci_stop_and_remove_bus_device(pdev);
         |         ^
>> drivers/platform/x86/p2sb.c:121:13: error: call to undeclared function 'pci_find_bus'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     121 |         p2sb_bus = pci_find_bus(0, 0);
         |                    ^
>> drivers/platform/x86/p2sb.c:121:11: error: incompatible integer to pointer conversion assigning to 'struct pci_bus *' from 'int' [-Wint-conversion]
     121 |         p2sb_bus = pci_find_bus(0, 0);
         |                  ^ ~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/p2sb.c:144:2: error: call to undeclared function 'pci_bus_read_config_word'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     144 |         pci_bus_read_config_word(bus, devfn_p2sb, PCI_CLASS_DEVICE, &class);
         |         ^
   drivers/platform/x86/p2sb.c:144:2: note: did you mean 'pci_read_config_word'?
   include/linux/pci.h:1946:1: note: 'pci_read_config_word' declared here
    1946 | _PCI_NOP_ALL(read, *)
         | ^
   include/linux/pci.h:1944:5: note: expanded from macro '_PCI_NOP_ALL'
    1944 |                                 _PCI_NOP(o, word, u16 x) \
         |                                 ^
   include/linux/pci.h:1939:20: note: expanded from macro '_PCI_NOP'
    1939 |         static inline int pci_##o##_config_##s(struct pci_dev *dev, \
         |                           ^
   <scratch space>:8:1: note: expanded from here
       8 | pci_read_config_word
         | ^
>> drivers/platform/x86/p2sb.c:152:2: error: call to undeclared function 'pci_lock_rescan_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     152 |         pci_lock_rescan_remove();
         |         ^
>> drivers/platform/x86/p2sb.c:159:2: error: call to undeclared function 'pci_bus_read_config_dword'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     159 |         pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
         |         ^
>> drivers/platform/x86/p2sb.c:161:3: error: call to undeclared function 'pci_bus_write_config_dword'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     161 |                 pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
         |                 ^
>> drivers/platform/x86/p2sb.c:169:2: error: call to undeclared function 'pci_unlock_rescan_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     169 |         pci_unlock_rescan_remove();
         |         ^
   10 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for P2SB
   Depends on [n]: PCI [=n] && X86 [=y]
   Selected by [y]:
   - GKI_HIDDEN_I2C_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/pci_scan_single_device +87 drivers/platform/x86/p2sb.c

9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   81  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   82  static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   83  {
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   84  	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   85  	struct pci_dev *pdev;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   86  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  @87  	pdev = pci_scan_single_device(bus, devfn);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   88  	if (!pdev)
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   89  		return;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   90  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   91  	p2sb_read_bar0(pdev, &cache->res);
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   92  	cache->bus_dev_id = bus->dev.id;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   93  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  @94  	pci_stop_and_remove_bus_device(pdev);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   95  }
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   96  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   97  static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   98  {
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   99  	/* Scan the P2SB device and cache its BAR0 */
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  100  	p2sb_scan_and_cache_devfn(bus, devfn);
aec7d25b497ce4 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  101  
aec7d25b497ce4 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  102  	/* On Goldmont p2sb_bar() also gets called for the SPI controller */
aec7d25b497ce4 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  103  	if (devfn == P2SB_DEVFN_GOLDMONT)
aec7d25b497ce4 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  104  		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  105  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  106  	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  107  		return -ENOENT;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  108  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  109  	return 0;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  110  }
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  111  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  112  static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  113  {
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  114  	static struct pci_bus *p2sb_bus;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  115  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  116  	bus = bus ?: p2sb_bus;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  117  	if (bus)
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  118  		return bus;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  119  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  120  	/* Assume P2SB is on the bus 0 in domain 0 */
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08 @121  	p2sb_bus = pci_find_bus(0, 0);
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  122  	return p2sb_bus;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  123  }
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  124  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  125  static int p2sb_cache_resources(void)
b28ff7a7c3245d drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2023-12-29  126  {
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  127  	unsigned int devfn_p2sb;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  128  	u32 value = P2SBC_HIDE;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  129  	struct pci_bus *bus;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  130  	u16 class;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  131  	int ret;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  132  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  133  	/* Get devfn for P2SB device itself */
3ff5873602a874 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-05  134  	p2sb_get_devfn(&devfn_p2sb);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  135  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  136  	bus = p2sb_get_bus(NULL);
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  137  	if (!bus)
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  138  		return -ENODEV;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  139  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  140  	/*
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  141  	 * When a device with same devfn exists and its device class is not
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  142  	 * PCI_CLASS_MEMORY_OTHER for P2SB, do not touch it.
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  143  	 */
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08 @144  	pci_bus_read_config_word(bus, devfn_p2sb, PCI_CLASS_DEVICE, &class);
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  145  	if (!PCI_POSSIBLE_ERROR(class) && class != PCI_CLASS_MEMORY_OTHER)
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  146  		return -ENODEV;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  147  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  148  	/*
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  149  	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  150  	 * removing via sysfs while it is temporarily exposed.
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  151  	 */
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @152  	pci_lock_rescan_remove();
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  153  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  154  	/*
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  155  	 * The BIOS prevents the P2SB device from being enumerated by the PCI
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  156  	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  157  	 * Unhide the P2SB device here, if needed.
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  158  	 */
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @159  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  160  	if (value & P2SBC_HIDE)
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @161  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  162  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  163  	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  164  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  165  	/* Hide the P2SB device, if it was hidden */
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  166  	if (value & P2SBC_HIDE)
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  167  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  168  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @169  	pci_unlock_rescan_remove();
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  170  
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  171  	return ret;
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  172  }
5913320eb0b3ec drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  173  

:::::: The code at line 87 was first introduced by commit
:::::: 9745fb07474f4501eff62130a78a42a8b8c18b05 platform/x86/intel: Add Primary to Sideband (P2SB) bridge support

:::::: TO: Jonathan Yong <jonathan.yong@intel.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
