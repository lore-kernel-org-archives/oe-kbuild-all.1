Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EDB192D9F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 01:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726969458; cv=none; b=EUpN2O7FJWeJkxzRaODHXPPWaotV/pVGVRHy0v4sIKsTvDtFHpsSA3mP9wZpf85h8M914v0p88GmWIRA4/E712mVBHWzA9LCO7VQ57YoglUgw7yyTcU3WeUw6Y+FpUHHdDY7SN0DwMqZh2ZUlIS+Dm8AQpGDv/O02a7BGuR3J+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726969458; c=relaxed/simple;
	bh=YjNBZ1q0uiwvuUuEezo/RvUkqFlo5Ussa4AqUPOJowk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOIR8FVEqTkOLyfuub9xB89pPfAtEjJ7b7JXAtQjQKIc9KnFqTYXbq/PoWMeRaKPFBghYs602Exu7/XVdG45ed7zTFxZg1EAIRBFIv2EoVLOc+bLPCLpEXAi8WeVrUpHx8Bsb82a9Z3f9CsWNBCA8I2qjebZMZIv1vfcjJLW41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egpzp2/s; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egpzp2/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726969457; x=1758505457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjNBZ1q0uiwvuUuEezo/RvUkqFlo5Ussa4AqUPOJowk=;
  b=egpzp2/si/AaIaSNTjArD0HS41aekuORkGKRIX3++4t2p3jsRcFXPi5L
   DaakP9WBHyufdirVOv8LXMlTLbLxGXEoCQvVdPxhu7HkfOshnGhdp4Vi5
   LioplKLTXO2PZ3auOly3nXRMJIsxLOa+zoXuu96hFlOjtQ++Lx4t/+Abj
   mkXmtj2T0TFLpkagYKc8SuEo3U8Sjrtfq0xqa1kDVSwbuEdLI3NuU16iK
   wPxdCCtJ+jfaUM+VKwzBHHu25TrPuCbiL155QXZuRWBSf64icrNCap4e4
   4vTPj8JBJirDefdmLdk5su87iVP7AYM+ELrsQjZKdY8thcf+IA5HDM8mD
   g==;
X-CSE-ConnectionGUID: JjvLrp87TyOgj9JDTeeukw==
X-CSE-MsgGUID: OhCf/ldUQNqdWFh9sQIpEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="51361656"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="51361656"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:44:14 -0700
X-CSE-ConnectionGUID: rIziQ7VqSreKHXu9+JXYFw==
X-CSE-MsgGUID: xZZDdVW5Thu1ZTrQE8UMqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75466870"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2024 18:44:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssBdx-000Fx6-2W;
	Sun, 22 Sep 2024 01:44:09 +0000
Date: Sun, 22 Sep 2024 09:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 340/448] arch/powerpc/kernel/eeh.c:1837:1:
 error: expected expression
Message-ID: <202409220949.6EFcLVxz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   4eb81ae46886ce90863b6f10c4fe8cd45c6719cf
commit: bf1829f8d5007f42a872c311913cd97fce830f7b [340/448] powerpc/kernel: convert to read/write iterators
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240922/202409220949.6EFcLVxz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220949.6EFcLVxz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220949.6EFcLVxz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/eeh.c:15:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2239:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/eeh.c:1837:1: error: expected expression
    1837 | int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
         | ^
>> arch/powerpc/kernel/eeh.c:1920:27: error: expected '}'
    1920 | __initcall(eeh_init_proc);
         |                           ^
   arch/powerpc/kernel/eeh.c:1832:58: note: to match this '{'
    1832 | static const struct file_operations eeh_dev_break_fops = {
         |                                                          ^
>> arch/powerpc/kernel/eeh.c:1920:27: error: expected ';' after top level declarator
    1920 | __initcall(eeh_init_proc);
         |                           ^
         |                           ;
   4 warnings and 3 errors generated.


vim +1837 arch/powerpc/kernel/eeh.c

bd6461cc7b3c4f arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1831  
bd6461cc7b3c4f arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1832  static const struct file_operations eeh_dev_break_fops = {
bd6461cc7b3c4f arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1833  	.open	= simple_open,
bf1829f8d5007f arch/powerpc/kernel/eeh.c Jens Axboe        2024-04-11  1834  	.write_iter = eeh_dev_break_write,
bf1829f8d5007f arch/powerpc/kernel/eeh.c Jens Axboe        2024-04-11  1835  	.read_iter = eeh_debugfs_dev_usage,
bd6461cc7b3c4f arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1836  
b0e2b828dfca64 arch/powerpc/kernel/eeh.c Narayana Murty N  2024-09-09 @1837  int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
b0e2b828dfca64 arch/powerpc/kernel/eeh.c Narayana Murty N  2024-09-09  1838  {
b0e2b828dfca64 arch/powerpc/kernel/eeh.c Narayana Murty N  2024-09-09  1839  	return eeh_debugfs_break_device(pdev);
b0e2b828dfca64 arch/powerpc/kernel/eeh.c Narayana Murty N  2024-09-09  1840  }
b0e2b828dfca64 arch/powerpc/kernel/eeh.c Narayana Murty N  2024-09-09  1841  
bf1829f8d5007f arch/powerpc/kernel/eeh.c Jens Axboe        2024-04-11  1842  static ssize_t eeh_dev_can_recover(struct kiocb *iocb, struct iov_iter *from)
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1843  {
bf1829f8d5007f arch/powerpc/kernel/eeh.c Jens Axboe        2024-04-11  1844  	size_t count = iov_iter_count(from);
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1845  	struct pci_driver *drv;
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1846  	struct pci_dev *pdev;
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1847  	size_t ret;
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1848  
bf1829f8d5007f arch/powerpc/kernel/eeh.c Jens Axboe        2024-04-11  1849  	pdev = eeh_debug_lookup_pdev(iocb, from);
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1850  	if (IS_ERR(pdev))
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1851  		return PTR_ERR(pdev);
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1852  
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1853  	/*
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1854  	 * In order for error recovery to work the driver needs to implement
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1855  	 * .error_detected(), so it can quiesce IO to the device, and
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1856  	 * .slot_reset() so it can re-initialise the device after a reset.
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1857  	 *
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1858  	 * Ideally they'd implement .resume() too, but some drivers which
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1859  	 * we need to support (notably IPR) don't so I guess we can tolerate
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1860  	 * that.
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1861  	 *
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1862  	 * .mmio_enabled() is mostly there as a work-around for devices which
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1863  	 * take forever to re-init after a hot reset. Implementing that is
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1864  	 * strictly optional.
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1865  	 */
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1866  	drv = pci_dev_driver(pdev);
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1867  	if (drv &&
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1868  	    drv->err_handler &&
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1869  	    drv->err_handler->error_detected &&
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1870  	    drv->err_handler->slot_reset) {
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1871  		ret = count;
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1872  	} else {
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1873  		ret = -EOPNOTSUPP;
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1874  	}
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1875  
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1876  	pci_dev_put(pdev);
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1877  
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1878  	return ret;
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1879  }
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1880  
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1881  static const struct file_operations eeh_dev_can_recover_fops = {
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1882  	.open	= simple_open,
bf1829f8d5007f arch/powerpc/kernel/eeh.c Jens Axboe        2024-04-11  1883  	.write_iter = eeh_dev_can_recover,
bf1829f8d5007f arch/powerpc/kernel/eeh.c Jens Axboe        2024-04-11  1884  	.read_iter = eeh_debugfs_dev_usage,
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1885  };
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1886  
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1887  #endif
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1888  
^1da177e4c3f41 arch/ppc64/kernel/eeh.c   Linus Torvalds    2005-04-16  1889  static int __init eeh_init_proc(void)
^1da177e4c3f41 arch/ppc64/kernel/eeh.c   Linus Torvalds    2005-04-16  1890  {
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1891  	if (machine_is(pseries) || machine_is(powernv)) {
3f3942aca6da35 arch/powerpc/kernel/eeh.c Christoph Hellwig 2018-05-15  1892  		proc_create_single("powerpc/eeh", 0, NULL, proc_eeh_show);
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1893  #ifdef CONFIG_DEBUG_FS
8c6c942d33f2a7 arch/powerpc/kernel/eeh.c YueHaibing        2018-12-20  1894  		debugfs_create_file_unsafe("eeh_enable", 0600,
dbf77fed8b302e arch/powerpc/kernel/eeh.c Aneesh Kumar K.V  2021-08-12  1895  					   arch_debugfs_dir, NULL,
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1896  					   &eeh_enable_dbgfs_ops);
46ee7c3c5212b0 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-02-15  1897  		debugfs_create_u32("eeh_max_freezes", 0600,
dbf77fed8b302e arch/powerpc/kernel/eeh.c Aneesh Kumar K.V  2021-08-12  1898  				arch_debugfs_dir, &eeh_max_freezes);
6b493f6079a430 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-02-15  1899  		debugfs_create_bool("eeh_disable_recovery", 0600,
dbf77fed8b302e arch/powerpc/kernel/eeh.c Aneesh Kumar K.V  2021-08-12  1900  				arch_debugfs_dir,
6b493f6079a430 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-02-15  1901  				&eeh_debugfs_no_recover);
22cda7c1680c1d arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1902  		debugfs_create_file_unsafe("eeh_dev_check", 0600,
dbf77fed8b302e arch/powerpc/kernel/eeh.c Aneesh Kumar K.V  2021-08-12  1903  				arch_debugfs_dir, NULL,
22cda7c1680c1d arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1904  				&eeh_dev_check_fops);
bd6461cc7b3c4f arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1905  		debugfs_create_file_unsafe("eeh_dev_break", 0600,
dbf77fed8b302e arch/powerpc/kernel/eeh.c Aneesh Kumar K.V  2021-08-12  1906  				arch_debugfs_dir, NULL,
bd6461cc7b3c4f arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-09-03  1907  				&eeh_dev_break_fops);
954bd99435b8ba arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-02-15  1908  		debugfs_create_file_unsafe("eeh_force_recover", 0600,
dbf77fed8b302e arch/powerpc/kernel/eeh.c Aneesh Kumar K.V  2021-08-12  1909  				arch_debugfs_dir, NULL,
954bd99435b8ba arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-02-15  1910  				&eeh_force_recover_fops);
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1911  		debugfs_create_file_unsafe("eeh_dev_can_recover", 0600,
dbf77fed8b302e arch/powerpc/kernel/eeh.c Aneesh Kumar K.V  2021-08-12  1912  				arch_debugfs_dir, NULL,
9e857416833d97 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2020-11-03  1913  				&eeh_dev_can_recover_fops);
5ca85ae6318df3 arch/powerpc/kernel/eeh.c Oliver O'Halloran 2019-02-15  1914  		eeh_cache_debugfs_init();
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1915  #endif
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1916  	}
7f52a526f64c69 arch/powerpc/kernel/eeh.c Gavin Shan        2014-04-24  1917  
^1da177e4c3f41 arch/ppc64/kernel/eeh.c   Linus Torvalds    2005-04-16  1918  	return 0;
^1da177e4c3f41 arch/ppc64/kernel/eeh.c   Linus Torvalds    2005-04-16  1919  }
^1da177e4c3f41 arch/ppc64/kernel/eeh.c   Linus Torvalds    2005-04-16 @1920  __initcall(eeh_init_proc);

:::::: The code at line 1837 was first introduced by commit
:::::: b0e2b828dfca645a228f8c89d12fbc2baecfb7ea powerpc/pseries/eeh: Fix pseries_eeh_err_inject

:::::: TO: Narayana Murty N <nnmlinux@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
