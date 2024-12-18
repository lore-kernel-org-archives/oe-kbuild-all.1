Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF6313F42A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 05:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734501074; cv=none; b=hOaTSJ5IghIjJPR93rm17XYfxfFTAsLkobmwJFMc3QuBG7a+DFkMq8aJTVDXwCH+ueHfNzZjD++SeCrHoOogfCq0en3pFEKCU6JSQg8DT9kpC8LhTgyKtzUOzOLyRoMXzTfAu6+W/G4o7jmrnf41hQN2iKY+/qCWu93bkLjZZJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734501074; c=relaxed/simple;
	bh=IuGbBfhcWK1TO/o1oD6CnG8vE1BV/xQn5nQgNFMxQSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Co7UT4sLxvOWhWJvEcLWvWMNEGLjV7UUsbc5yjYhEXZV83xzBEHYScEYjCPEoRZ4ZoVOOka0Xl+4Ila+FC3wsFxP4NbZ5BfB81JGv55wrLmYwRDi2t7lu3eGLTkRni1vrRoILt7M79WvuVo6tCZ797xrFw0SbPYAY+Fa2Au0UY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0wbJfD9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0wbJfD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734501073; x=1766037073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IuGbBfhcWK1TO/o1oD6CnG8vE1BV/xQn5nQgNFMxQSc=;
  b=M0wbJfD9Mjas1jagDVJsHVaq3SQT//YtPlU/Jqp/1quueQDA+yxVYNHE
   d045Bnfsl7P4kcQEEw5/dnbO5iulFiM9NpsfNEYAnl1z5e8cZPdVm30xZ
   OlRbofoXepm9F/wDzNCVtMpKAInfKQf0Ih+qiAfiukXS5LZuYkgmfKv3E
   n43OCk6mMZ/g/I02tHVPCpjAQHuLPl+y6HJLl69g4DSAZLvH2aVI0A003
   4H+es0D/mrKEBuMclq99fG2F388gwp6Po4Y0ydCkaXnFjfyRWjgRVlBf2
   8XSHZnnn0a+N2etObfE9iZpUslH/ZRby4EtKG1EXLn6qLCPxwO6g/mc91
   A==;
X-CSE-ConnectionGUID: 8EjKV1OgSKmy3wt5BHExCQ==
X-CSE-MsgGUID: jfy3sNzfQ8WgjDGYe2fhJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45965364"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="45965364"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 21:51:12 -0800
X-CSE-ConnectionGUID: xjSTqfhzSa+8ueWxUXZWxw==
X-CSE-MsgGUID: fCVfFmnVTVeda0T5l47fjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="128564517"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2024 21:51:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNmxg-000G8k-0b;
	Wed, 18 Dec 2024 05:51:08 +0000
Date: Wed, 18 Dec 2024 13:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 8/16]
 drivers/platform/x86/p2sb.c:87:16: error: implicit declaration of function
 'pci_scan_single_device'; did you mean 'pci_disable_device'?
Message-ID: <202412181351.XnfVwqNP-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   c6a7ddd41afc42183777a16c67395d2b78e285d0
commit: 7662d999c05b7ca019aa86cea9acfdf698a2f611 [8/16] ANDROID: GKI: x86: Add hidden i2c configs
config: x86_64-buildonly-randconfig-005-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181351.XnfVwqNP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181351.XnfVwqNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181351.XnfVwqNP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/p2sb.c: In function 'p2sb_scan_and_cache_devfn':
>> drivers/platform/x86/p2sb.c:87:16: error: implicit declaration of function 'pci_scan_single_device'; did you mean 'pci_disable_device'? [-Werror=implicit-function-declaration]
      87 |         pdev = pci_scan_single_device(bus, devfn);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                pci_disable_device
   drivers/platform/x86/p2sb.c:87:14: warning: assignment to 'struct pci_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      87 |         pdev = pci_scan_single_device(bus, devfn);
         |              ^
>> drivers/platform/x86/p2sb.c:94:9: error: implicit declaration of function 'pci_stop_and_remove_bus_device' [-Werror=implicit-function-declaration]
      94 |         pci_stop_and_remove_bus_device(pdev);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/p2sb.c: In function 'p2sb_get_bus':
>> drivers/platform/x86/p2sb.c:121:20: error: implicit declaration of function 'pci_find_bus'; did you mean 'pci_find_next_bus'? [-Werror=implicit-function-declaration]
     121 |         p2sb_bus = pci_find_bus(0, 0);
         |                    ^~~~~~~~~~~~
         |                    pci_find_next_bus
   drivers/platform/x86/p2sb.c:121:18: warning: assignment to 'struct pci_bus *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     121 |         p2sb_bus = pci_find_bus(0, 0);
         |                  ^
   drivers/platform/x86/p2sb.c: In function 'p2sb_cache_resources':
>> drivers/platform/x86/p2sb.c:144:9: error: implicit declaration of function 'pci_bus_read_config_word'; did you mean 'pci_read_config_word'? [-Werror=implicit-function-declaration]
     144 |         pci_bus_read_config_word(bus, devfn_p2sb, PCI_CLASS_DEVICE, &class);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_read_config_word
>> drivers/platform/x86/p2sb.c:152:9: error: implicit declaration of function 'pci_lock_rescan_remove' [-Werror=implicit-function-declaration]
     152 |         pci_lock_rescan_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/p2sb.c:159:9: error: implicit declaration of function 'pci_bus_read_config_dword'; did you mean 'pci_read_config_dword'? [-Werror=implicit-function-declaration]
     159 |         pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_read_config_dword
>> drivers/platform/x86/p2sb.c:161:17: error: implicit declaration of function 'pci_bus_write_config_dword'; did you mean 'pci_write_config_dword'? [-Werror=implicit-function-declaration]
     161 |                 pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 pci_write_config_dword
>> drivers/platform/x86/p2sb.c:169:9: error: implicit declaration of function 'pci_unlock_rescan_remove' [-Werror=implicit-function-declaration]
     169 |         pci_unlock_rescan_remove();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for P2SB
   Depends on [n]: PCI [=n] && X86 [=y]
   Selected by [y]:
   - GKI_HIDDEN_I2C_CONFIGS [=y] && X86 [=y]


vim +87 drivers/platform/x86/p2sb.c

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
