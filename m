Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B6CF9CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 00:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730766416; cv=none; b=fhGlS3B9mTnGALnPPABMENMRMoHFjKcFEwrKfpwcpmd5qYVY6JcYYDHyHIMan+QEQwdDOTL3zyxqVTkhKbFn/xJ9vRNuTDwJC57rwdJxgAAlJKR1eqgrTely9xIj+3eAFPvKWlfSL+Jy823btea2r1liifiKusvcR5lJ1J4RF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730766416; c=relaxed/simple;
	bh=IO3Vsaba/Hz2sw6tZepjeLxEfU4MSNpfmeroDkjW47g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BQjv0qzEbECl1TF4CL/Za0GlPhgcRTA04nh+TUDMoMaGX/m98zKy81PnzrWzDuVH006WG4vSzdTEXGecEbFYQ/3B/l140JzWjg/krBK6Tw4T8xEJqAxqjhDqiMUVE4Dmw/lUVyFk5qgXEzBS3R4zHjmzxAAJjRmeoKoedz/P7ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROtE+HYK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROtE+HYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730766415; x=1762302415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IO3Vsaba/Hz2sw6tZepjeLxEfU4MSNpfmeroDkjW47g=;
  b=ROtE+HYKeecGNkvckbPatzq+ANfZHMrT3gF9KaA1ZQ3kpqKGhkb/rYel
   T25QaRz6tIaHSpFs3uorz6KSSAyLTge1329pCnxdh9i1bpUYN9oKv3dVk
   dg99FLKOpIERAaHjyDs6ASfxHKAfnSxOY0vI7hWxUILMOVZ4ef2skXKkU
   /ZGVWkUVObWSLrYN9foGCKhHn3A10j4s+NzvC8mW7prPMAQ4EGMpUWmMj
   U9ohClFWl6hiOePIjVSvk5j8uf9bP8YeXGqQPmrttithAuFjoS/ceYF8D
   7yw8FUKmQiSvbaq+g0JSnUhv2OFCMw/mnNGP46lhUB19yfkZKawxYYd9N
   A==;
X-CSE-ConnectionGUID: iZvcdshOS/KLoXD0CJC2LQ==
X-CSE-MsgGUID: YHyV0+UgTpuljUXCoJGY8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41038725"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41038725"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 16:26:54 -0800
X-CSE-ConnectionGUID: SasQh1fUQjO7AG+fnrt0kw==
X-CSE-MsgGUID: i7ltzTlwSWCIjXpGqphjPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="83700196"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 16:26:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t87PG-000lQn-1B;
	Tue, 05 Nov 2024 00:26:50 +0000
Date: Tue, 5 Nov 2024 08:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 8/16]
 drivers/platform/x86/p2sb.c:88:16: error: implicit declaration of function
 'pci_scan_single_device'; did you mean 'pci_disable_device'?
Message-ID: <202411050840.X21KHSd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Slawomir,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   cefa8bf9f032171eb1be08266aec68726ab8e8e5
commit: 0a9642cdae626bb6996cea1727dff4abfc599936 [8/16] ANDROID: GKI: x86: Add hidden i2c configs
config: x86_64-buildonly-randconfig-001-20241105 (https://download.01.org/0day-ci/archive/20241105/202411050840.X21KHSd7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050840.X21KHSd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050840.X21KHSd7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/p2sb.c: In function 'p2sb_scan_and_cache_devfn':
>> drivers/platform/x86/p2sb.c:88:16: error: implicit declaration of function 'pci_scan_single_device'; did you mean 'pci_disable_device'? [-Werror=implicit-function-declaration]
      88 |         pdev = pci_scan_single_device(bus, devfn);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                pci_disable_device
   drivers/platform/x86/p2sb.c:88:14: warning: assignment to 'struct pci_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      88 |         pdev = pci_scan_single_device(bus, devfn);
         |              ^
>> drivers/platform/x86/p2sb.c:95:9: error: implicit declaration of function 'pci_stop_and_remove_bus_device' [-Werror=implicit-function-declaration]
      95 |         pci_stop_and_remove_bus_device(pdev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/p2sb.c: In function 'p2sb_get_bus':
>> drivers/platform/x86/p2sb.c:122:20: error: implicit declaration of function 'pci_find_bus'; did you mean 'pci_find_next_bus'? [-Werror=implicit-function-declaration]
     122 |         p2sb_bus = pci_find_bus(0, 0);
         |                    ^~~~~~~~~~~~
         |                    pci_find_next_bus
   drivers/platform/x86/p2sb.c:122:18: warning: assignment to 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     122 |         p2sb_bus = pci_find_bus(0, 0);
         |                  ^
   drivers/platform/x86/p2sb.c: In function 'p2sb_cache_resources':
>> drivers/platform/x86/p2sb.c:147:9: error: implicit declaration of function 'pci_bus_read_config_word'; did you mean 'pci_read_config_word'? [-Werror=implicit-function-declaration]
     147 |         pci_bus_read_config_word(bus, devfn_p2sb, PCI_CLASS_DEVICE, &class);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_read_config_word
>> drivers/platform/x86/p2sb.c:155:9: error: implicit declaration of function 'pci_lock_rescan_remove' [-Werror=implicit-function-declaration]
     155 |         pci_lock_rescan_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/p2sb.c:162:9: error: implicit declaration of function 'pci_bus_read_config_dword'; did you mean 'pci_read_config_dword'? [-Werror=implicit-function-declaration]
     162 |         pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_read_config_dword
>> drivers/platform/x86/p2sb.c:164:17: error: implicit declaration of function 'pci_bus_write_config_dword'; did you mean 'pci_write_config_dword'? [-Werror=implicit-function-declaration]
     164 |                 pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 pci_write_config_dword
>> drivers/platform/x86/p2sb.c:172:9: error: implicit declaration of function 'pci_unlock_rescan_remove' [-Werror=implicit-function-declaration]
     172 |         pci_unlock_rescan_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for P2SB
   Depends on [n]: PCI [=n] && X86 [=y]
   Selected by [y]:
   - GKI_HIDDEN_I2C_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +88 drivers/platform/x86/p2sb.c

9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   82  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   83  static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   84  {
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   85  	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   86  	struct pci_dev *pdev;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   87  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  @88  	pdev = pci_scan_single_device(bus, devfn);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   89  	if (!pdev)
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   90  		return;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   91  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   92  	p2sb_read_bar0(pdev, &cache->res);
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   93  	cache->bus_dev_id = bus->dev.id;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   94  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  @95  	pci_stop_and_remove_bus_device(pdev);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   96  }
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06   97  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   98  static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08   99  {
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  100  	/* Scan the P2SB device and cache its BAR0 */
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  101  	p2sb_scan_and_cache_devfn(bus, devfn);
049f043fe8cd75 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  102  
049f043fe8cd75 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  103  	/* On Goldmont p2sb_bar() also gets called for the SPI controller */
049f043fe8cd75 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  104  	if (devfn == P2SB_DEVFN_GOLDMONT)
049f043fe8cd75 drivers/platform/x86/p2sb.c       Hans de Goede        2024-03-04  105  		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  106  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  107  	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  108  		return -ENOENT;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  109  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  110  	return 0;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  111  }
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  112  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  113  static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  114  {
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  115  	static struct pci_bus *p2sb_bus;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  116  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  117  	bus = bus ?: p2sb_bus;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  118  	if (bus)
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  119  		return bus;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  120  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  121  	/* Assume P2SB is on the bus 0 in domain 0 */
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08 @122  	p2sb_bus = pci_find_bus(0, 0);
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  123  	return p2sb_bus;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  124  }
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  125  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  126  static int p2sb_cache_resources(void)
11d41d01c088ff drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2023-12-29  127  {
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  128  	unsigned int devfn_p2sb;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  129  	u32 value = P2SBC_HIDE;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  130  	struct pci_bus *bus;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  131  	u16 class;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  132  	int ret;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  133  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  134  	/* Get devfn for P2SB device itself */
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  135  	ret = p2sb_get_devfn(&devfn_p2sb);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  136  	if (ret)
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  137  		return ret;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  138  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  139  	bus = p2sb_get_bus(NULL);
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  140  	if (!bus)
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  141  		return -ENODEV;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  142  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  143  	/*
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  144  	 * When a device with same devfn exists and its device class is not
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  145  	 * PCI_CLASS_MEMORY_OTHER for P2SB, do not touch it.
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  146  	 */
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08 @147  	pci_bus_read_config_word(bus, devfn_p2sb, PCI_CLASS_DEVICE, &class);
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  148  	if (!PCI_POSSIBLE_ERROR(class) && class != PCI_CLASS_MEMORY_OTHER)
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  149  		return -ENODEV;
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  150  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  151  	/*
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  152  	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  153  	 * removing via sysfs while it is temporarily exposed.
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  154  	 */
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @155  	pci_lock_rescan_remove();
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  156  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  157  	/*
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  158  	 * The BIOS prevents the P2SB device from being enumerated by the PCI
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  159  	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  160  	 * Unhide the P2SB device here, if needed.
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  161  	 */
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @162  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  163  	if (value & P2SBC_HIDE)
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @164  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  165  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  166  	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  167  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  168  	/* Hide the P2SB device, if it was hidden */
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  169  	if (value & P2SBC_HIDE)
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  170  		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  171  
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06 @172  	pci_unlock_rescan_remove();
9745fb07474f45 drivers/platform/x86/intel/p2sb.c Jonathan Yong        2022-06-06  173  
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  174  	return ret;
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  175  }
847e1eb30e269a drivers/platform/x86/p2sb.c       Shin'ichiro Kawasaki 2024-01-08  176  

:::::: The code at line 88 was first introduced by commit
:::::: 9745fb07474f4501eff62130a78a42a8b8c18b05 platform/x86/intel: Add Primary to Sideband (P2SB) bridge support

:::::: TO: Jonathan Yong <jonathan.yong@intel.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
