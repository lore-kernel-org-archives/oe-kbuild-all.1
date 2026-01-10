Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAA91E3DDE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768052220; cv=none; b=kTj1wagQaxzLrHIZJ/r8gIhGep33VEdZtCnjV8BLGaTBvgElnDedJj4kec7GQ24BsiWrEDnnT+KgHLQ1pEN3ZTgj4aqjYQYuwPvlCMUJ/lmci9V8jwXPH8pjrYHZI7BDyy7lRtBh3KuEe3zIIxsnSv/VHxfUlKi79wpyqwFV37c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768052220; c=relaxed/simple;
	bh=+51RD5mB1GVicTIMFha5pLI/hH4f88UhoKtOkx8a0TQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=reTRCnHwGVAgDrXwZwgBwARrVuoNGLsewGCB7qTc7jiU0SGz+P99k+C6A/61AAHacNIL6DtLHB08VRTByOnvSOD5y1XPL4TcaUGbgUSrEL4FFAAmwLCeesBj8RDVjFyAEEl03craZUCU9oApasoMJUzAOKaOXNravSZ/IJJn33k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LR03Jvlf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LR03Jvlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768052219; x=1799588219;
  h=date:from:to:cc:subject:message-id;
  bh=+51RD5mB1GVicTIMFha5pLI/hH4f88UhoKtOkx8a0TQ=;
  b=LR03JvlfHtuzr2SzCPLrSofMGhZ0KoNtJC97o8A3ZBffCjPqAeQotemd
   T1acf0OKBakWKADdXRukZ0symzO8UjYSEYOenX4OvTNO2XtqxNR0uPS6g
   azCrkKvAg4cZDHF6nCeRtbErFYMmJDsX9uAL2JrjclSKuDh5zbW2Hehg2
   RzdBlsFusWIqgluA4vElxyrFhZ2ZrQLdUqLBjpRCtWBWB3dywRnhd1WpR
   hJ8BYR++pxsoXOLZ+imBaQaf0DD+4H7gxKUSEzrU0AsJLTtckVFg3i8Bs
   zAJMpxuSDsCpfBEl3/6wg2A/D8l/4Ua7S0NehB/CCREpdMPTlbQyrqkCr
   w==;
X-CSE-ConnectionGUID: UaC/J006QcCp73Fs53wL/Q==
X-CSE-MsgGUID: 8NVqSuf9T7qmT3lxUtK/mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73038610"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="73038610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 05:36:58 -0800
X-CSE-ConnectionGUID: 6v2EYOF9Tq6wUdQjCw3eCA==
X-CSE-MsgGUID: CyU1bIdyReKfsHCAvtgcSQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2026 05:36:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veZ9B-000000008g8-2pTL;
	Sat, 10 Jan 2026 13:36:53 +0000
Date: Sat, 10 Jan 2026 21:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 22/22]
 drivers/video/fbdev/imsttfb.c:1542:20: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202601102148.XsvknqEp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   9d20897b90b3842f3d30f948173a80ae6bd0eea2
commit: 9d20897b90b3842f3d30f948173a80ae6bd0eea2 [22/22] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: mips-randconfig-r131-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102148.XsvknqEp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102148.XsvknqEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601102148.XsvknqEp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/imsttfb.c:1521:30: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/imsttfb.c:1521:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got unsigned char [usertype] * @@
   drivers/video/fbdev/imsttfb.c:1521:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/imsttfb.c:1521:27: sparse:     got unsigned char [usertype] *
   drivers/video/fbdev/imsttfb.c:1530:27: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/video/fbdev/imsttfb.c:1542:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *cmap_regs @@
   drivers/video/fbdev/imsttfb.c:1542:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/imsttfb.c:1542:20: sparse:     got unsigned char [usertype] *cmap_regs
   drivers/video/fbdev/imsttfb.c:1561:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *cmap_regs @@
   drivers/video/fbdev/imsttfb.c:1561:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/video/fbdev/imsttfb.c:1561:20: sparse:     got unsigned char [usertype] *cmap_regs
   drivers/video/fbdev/imsttfb.c:1363:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/imsttfb.c:1364:16: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/net/ethernet/toshiba/tc35815.c:1306:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] BuffData @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1306:27: sparse:     expected unsigned int volatile [usertype] BuffData
   drivers/net/ethernet/toshiba/tc35815.c:1306:27: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/toshiba/tc35815.c:1307:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] BDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1307:24: sparse:     expected unsigned int volatile [usertype] BDCtl
   drivers/net/ethernet/toshiba/tc35815.c:1307:24: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/toshiba/tc35815.c:1308:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDSystem @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1308:27: sparse:     expected unsigned int volatile [usertype] FDSystem
   drivers/net/ethernet/toshiba/tc35815.c:1308:27: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/toshiba/tc35815.c:1309:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1309:24: sparse:     expected unsigned int volatile [usertype] FDCtl
   drivers/net/ethernet/toshiba/tc35815.c:1309:24: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/toshiba/tc35815.c:1315:33: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/toshiba/tc35815.c:1315:33: sparse:    left side has type unsigned int
   drivers/net/ethernet/toshiba/tc35815.c:1315:33: sparse:    right side has type restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1316:32: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/toshiba/tc35815.c:1316:32: sparse:    left side has type unsigned int
   drivers/net/ethernet/toshiba/tc35815.c:1316:32: sparse:    right side has type restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1323:33: sparse: sparse: invalid assignment: &=
   drivers/net/ethernet/toshiba/tc35815.c:1323:33: sparse:    left side has type unsigned int
   drivers/net/ethernet/toshiba/tc35815.c:1323:33: sparse:    right side has type restricted __le32
>> drivers/net/ethernet/toshiba/tc35815.c:1466:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1467:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1487:35: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1542:37: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1576:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] BuffData @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1576:54: sparse:     expected unsigned int volatile [usertype] BuffData
   drivers/net/ethernet/toshiba/tc35815.c:1576:54: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:1579:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] BDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1579:43: sparse:     expected unsigned int volatile [usertype] BDCtl
   drivers/net/ethernet/toshiba/tc35815.c:1579:43: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/toshiba/tc35815.c:1600:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDNext @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1600:48: sparse:     expected unsigned int volatile [usertype] FDNext
   drivers/net/ethernet/toshiba/tc35815.c:1600:48: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:1602:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1602:47: sparse:     expected unsigned int volatile [usertype] FDCtl
   drivers/net/ethernet/toshiba/tc35815.c:1602:47: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:1738:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1739:30: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1741:40: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1742:32: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1769:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDSystem @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1769:35: sparse:     expected unsigned int volatile [usertype] FDSystem
   drivers/net/ethernet/toshiba/tc35815.c:1769:35: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:1801:51: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/toshiba/tc35815.c:1801:51: sparse:    left side has type unsigned int
   drivers/net/ethernet/toshiba/tc35815.c:1801:51: sparse:    right side has type restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1802:50: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/toshiba/tc35815.c:1802:50: sparse:    left side has type unsigned int
   drivers/net/ethernet/toshiba/tc35815.c:1802:50: sparse:    right side has type restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:917:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:917:42: sparse:     expected unsigned int volatile [usertype] FDCtl
   drivers/net/ethernet/toshiba/tc35815.c:917:42: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:925:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDNext @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:925:43: sparse:     expected unsigned int volatile [usertype] FDNext
   drivers/net/ethernet/toshiba/tc35815.c:925:43: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:926:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDSystem @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:926:45: sparse:     expected unsigned int volatile [usertype] FDSystem
   drivers/net/ethernet/toshiba/tc35815.c:926:45: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:927:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:927:42: sparse:     expected unsigned int volatile [usertype] FDCtl
   drivers/net/ethernet/toshiba/tc35815.c:927:42: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:929:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDNext @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:929:45: sparse:     expected unsigned int volatile [usertype] FDNext
   drivers/net/ethernet/toshiba/tc35815.c:929:45: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:935:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDNext @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:935:32: sparse:     expected unsigned int volatile [usertype] FDNext
   drivers/net/ethernet/toshiba/tc35815.c:935:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:936:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:936:31: sparse:     expected unsigned int volatile [usertype] FDCtl
   drivers/net/ethernet/toshiba/tc35815.c:936:31: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:960:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] BuffData @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:960:45: sparse:     expected unsigned int volatile [usertype] BuffData
   drivers/net/ethernet/toshiba/tc35815.c:960:45: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:963:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] BDCtl @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:963:42: sparse:     expected unsigned int volatile [usertype] BDCtl
   drivers/net/ethernet/toshiba/tc35815.c:963:42: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:980:32: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1000:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDSystem @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1000:45: sparse:     expected unsigned int volatile [usertype] FDSystem
   drivers/net/ethernet/toshiba/tc35815.c:1000:45: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:1014:40: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1034:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile [usertype] FDSystem @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/toshiba/tc35815.c:1034:53: sparse:     expected unsigned int volatile [usertype] FDSystem
   drivers/net/ethernet/toshiba/tc35815.c:1034:53: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/toshiba/tc35815.c:1060:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1060:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1060:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1060:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1066:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1066:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1075:28: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1078:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1078:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1078:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1078:9: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1083:13: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1087:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/toshiba/tc35815.c:1087:17: sparse: sparse: cast to restricted __le32

vim +1542 drivers/video/fbdev/imsttfb.c

^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1468  
48c68c4f1b5424 drivers/video/imsttfb.c       Greg Kroah-Hartman        2012-12-21  1469  static int imsttfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1470  {
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1471  	unsigned long addr, size;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1472  	struct imstt_par *par;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1473  	struct fb_info *info;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1474  	struct device_node *dp;
145eed48de2780 drivers/video/fbdev/imsttfb.c Thomas Zimmermann         2022-07-18  1475  	int ret;
145eed48de2780 drivers/video/fbdev/imsttfb.c Thomas Zimmermann         2022-07-18  1476  
145eed48de2780 drivers/video/fbdev/imsttfb.c Thomas Zimmermann         2022-07-18  1477  	ret = aperture_remove_conflicting_pci_devices(pdev, "imsttfb");
145eed48de2780 drivers/video/fbdev/imsttfb.c Thomas Zimmermann         2022-07-18  1478  	if (ret)
145eed48de2780 drivers/video/fbdev/imsttfb.c Thomas Zimmermann         2022-07-18  1479  		return ret;
145eed48de2780 drivers/video/fbdev/imsttfb.c Thomas Zimmermann         2022-07-18  1480  	ret = -ENOMEM;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1481  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1482  	dp = pci_device_to_OF_node(pdev);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1483  	if(dp)
5c63e407aaabb0 drivers/video/fbdev/imsttfb.c Rob Herring               2018-10-08  1484  		printk(KERN_INFO "%s: OF name %pOFn\n",__func__, dp);
e9cfb2d62befcd drivers/video/fbdev/imsttfb.c Kevin Hao                 2015-03-12  1485  	else if (IS_ENABLED(CONFIG_OF))
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1486  		printk(KERN_ERR "imsttfb: no OF node for pci device\n");
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1487  
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1488  	info = framebuffer_alloc(sizeof(struct imstt_par), &pdev->dev);
0adcdbcb179624 drivers/video/fbdev/imsttfb.c Bartlomiej Zolnierkiewicz 2019-06-28  1489  	if (!info)
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1490  		return -ENOMEM;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1491  
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1492  	par = info->par;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1493  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1494  	addr = pci_resource_start (pdev, 0);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1495  	size = pci_resource_len (pdev, 0);
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1496  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1497  	if (!request_mem_region(addr, size, "imsttfb")) {
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1498  		printk(KERN_ERR "imsttfb: Can't reserve memory region\n");
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1499  		ret = -ENODEV;
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1500  		goto release_info;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1501  	}
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1502  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1503  	switch (pdev->device) {
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1504  		case PCI_DEVICE_ID_IMS_TT128: /* IMS,tt128mbA */
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1505  			par->ramdac = IBM;
a6f13af4d115a1 drivers/video/fbdev/imsttfb.c Rob Herring               2019-02-08  1506  			if (of_node_name_eq(dp, "IMS,tt128mb8") ||
a6f13af4d115a1 drivers/video/fbdev/imsttfb.c Rob Herring               2019-02-08  1507  			    of_node_name_eq(dp, "IMS,tt128mb8A"))
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1508  				par->ramdac = TVP;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1509  			break;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1510  		case PCI_DEVICE_ID_IMS_TT3D:  /* IMS,tt3d */
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1511  			par->ramdac = TVP;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1512  			break;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1513  		default:
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1514  			printk(KERN_INFO "imsttfb: Device 0x%x unknown, "
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1515  					 "contact maintainer.\n", pdev->device);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1516  			ret = -ENODEV;
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1517  			goto release_mem_region;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1518  	}
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1519  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1520  	info->fix.smem_start = addr;
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1521  	info->screen_base = (__u8 *)ioremap(addr, par->ramdac == IBM ?
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1522  					    0x400000 : 0x800000);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1523  	if (!info->screen_base)
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1524  		goto release_mem_region;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1525  	info->fix.mmio_start = addr + 0x800000;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1526  	par->dc_regs = ioremap(addr + 0x800000, 0x1000);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1527  	if (!par->dc_regs)
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1528  		goto unmap_screen_base;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1529  	par->cmap_regs_phys = addr + 0x840000;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1530  	par->cmap_regs = (__u8 *)ioremap(addr + 0x840000, 0x1000);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1531  	if (!par->cmap_regs)
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1532  		goto unmap_dc_regs;
94f9e09ce531d4 drivers/video/imsttfb.c       Antonino A. Daplas        2006-01-09  1533  	info->pseudo_palette = par->palette;
c75f5a55061091 drivers/video/fbdev/imsttfb.c Zheng Wang                2023-04-27  1534  	ret = init_imstt(info);
518ecb6a209f6f drivers/video/fbdev/imsttfb.c Helge Deller              2023-05-27  1535  	if (ret)
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1536  		goto unmap_cmap_regs;
518ecb6a209f6f drivers/video/fbdev/imsttfb.c Helge Deller              2023-05-27  1537  
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1538  	pci_set_drvdata(pdev, info);
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1539  	return 0;
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1540  
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1541  unmap_cmap_regs:
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27 @1542  	iounmap(par->cmap_regs);
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1543  unmap_dc_regs:
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1544  	iounmap(par->dc_regs);
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1545  unmap_screen_base:
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1546  	iounmap(info->screen_base);
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1547  release_mem_region:
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1548  	release_mem_region(addr, size);
aba6ab57a910ad drivers/video/fbdev/imsttfb.c Dan Carpenter             2023-10-27  1549  release_info:
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1550  	framebuffer_release(info);
13b7c0390a5d38 drivers/video/fbdev/imsttfb.c Greg Kroah-Hartman        2021-05-03  1551  	return ret;
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1552  }
^1da177e4c3f41 drivers/video/imsttfb.c       Linus Torvalds            2005-04-16  1553  

:::::: The code at line 1542 was first introduced by commit
:::::: aba6ab57a910ad4b940c2024d15f2cdbf5b7f76b fbdev: imsttfb: fix a resource leak in probe

:::::: TO: Dan Carpenter <dan.carpenter@linaro.org>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
