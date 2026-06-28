Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91C145A1F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782652318; cv=none; b=W2nHTKp68kc1DtTT4fUubmpGaDGsU/igulHPNky1q7tiV3heaVubCJhr+5Hs6SFQVTJvQLiM1LiFQR23ROfh/640i4O0e+1IodkhSNIvkYKDJWOCUyvT6NDFz2b6TZcDvL1xY9xUGKDEva2OSeF7Sh9AeyWGQLJciXdW5OFauec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782652318; c=relaxed/simple;
	bh=sdyuJXjveRb9hf1XHAeAN1/OkCZCWOzYU7us0LWRQew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=blBhnsqKL78eKkGCb1Uq+CS0CFezq2PmcxrSuZsOELjv4caScc5I0k6YLyxVzP+PI/R3KzDr6H+lKlHD8K3oiLoxcbkApCH3P0e9Yk+bv2vXhTUjwpEBMHVMkKMHyaREAET94k9PlP1AmE3lBgeXMr7wYSr4kWZAR0XZ5qlI1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXQ4E77T; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXQ4E77T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782652315; x=1814188315;
  h=date:from:to:cc:subject:message-id;
  bh=sdyuJXjveRb9hf1XHAeAN1/OkCZCWOzYU7us0LWRQew=;
  b=nXQ4E77T9mEz/C9Xnz4tdL8998LPqIN2wS/AqT0zLwbRVRXqPYapV3NA
   KlZrCPEdzfYAwp/XTKyhcfTalP/vHBAZSEt743gGuTH2EPdwZhtOGLrsJ
   4AtuM2h4SzlibdT9Ot9lbOcznH2kUo1L2K5q0uj13tx/pXk6M/o+6u2L4
   prBL95KtywnJEe3f0jB/hNz9LFn66AmPg5uyniL49jZ8q5x5r+aIXJtRc
   9NxvSYSL3HvCFiw+GpRilrIG+wxvSSWwBrYuTyiPkG1TEe6du+J1fKJ42
   6a6JC5j7YxLR5iYF7uB/YHauiZEQG8Gd13/V+GPMK6fG1OuNqa8RPK1jd
   w==;
X-CSE-ConnectionGUID: NNARJxV7R2apj8F4y1pvBw==
X-CSE-MsgGUID: hO5MkGofQFq9lgSQKZEmAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="106157257"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="106157257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 06:11:54 -0700
X-CSE-ConnectionGUID: MOon3UjMTa6hrkkcUe7PMw==
X-CSE-MsgGUID: Z2MBkQqmTY+A8cErFRLm3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="281813458"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Jun 2026 06:11:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdpIc-000000006KP-10mK;
	Sun, 28 Jun 2026 13:11:50 +0000
Date: Sun, 28 Jun 2026 21:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/zen-sauce 4/31]
 drivers/pci/controller/intel-nvme-remap.c:47:33: error: field 'sysdata' has
 incomplete type
Message-ID: <202606282123.8wlbMKVf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/zen-sauce
head:   420dbda6d6b42784ca35e6b0596fd8e68c23b219
commit: 6601cc3e542564dcbdb6f106745954c866459d9c [4/31] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260628/202606282123.8wlbMKVf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606282123.8wlbMKVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606282123.8wlbMKVf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/intel-nvme-remap.c:47:33: error: field 'sysdata' has incomplete type
      47 |         struct pci_sysdata      sysdata;
         |                                 ^~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/um/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/irq.h:14,
                    from drivers/pci/controller/intel-nvme-remap.c:37:
   drivers/pci/controller/intel-nvme-remap.c: In function 'nrdev_from_bus':
>> include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:74:16: note: in expansion of macro 'container_of'
      74 |         return container_of(bus->sysdata, struct nvme_remap_dev, sysdata);
         |                ^~~~~~~~~~~~
   In file included from include/linux/pci.h:44,
                    from drivers/pci/controller/intel-nvme-remap.c:40:
   drivers/pci/controller/intel-nvme-remap.c: At top level:
   include/linux/pci_ids.h:23:41: warning: initialized field overwritten [-Woverride-init]
      23 | #define PCI_CLASS_STORAGE_RAID          0x0104
         |                                         ^~~~~~
   drivers/pci/controller/intel-nvme-remap.c:447:26: note: in expansion of macro 'PCI_CLASS_STORAGE_RAID'
     447 |                 .class = PCI_CLASS_STORAGE_RAID << 8,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci_ids.h:23:41: note: (near initialization for 'nvme_remap_ids[0].class')
      23 | #define PCI_CLASS_STORAGE_RAID          0x0104
         |                                         ^~~~~~
   drivers/pci/controller/intel-nvme-remap.c:447:26: note: in expansion of macro 'PCI_CLASS_STORAGE_RAID'
     447 |                 .class = PCI_CLASS_STORAGE_RAID << 8,
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:448:31: warning: initialized field overwritten [-Woverride-init]
     448 |                 .class_mask = 0xffffff00,
         |                               ^~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:448:31: note: (near initialization for 'nvme_remap_ids[0].class_mask')


vim +/sysdata +47 drivers/pci/controller/intel-nvme-remap.c

    43	
    44	struct nvme_remap_dev {
    45		struct pci_dev		*dev;		/* AHCI device */
    46		struct pci_bus		*bus;		/* our fake PCI bus */
  > 47		struct pci_sysdata	sysdata;
    48		int			irq_base;	/* our fake interrupts */
    49	
    50		/*
    51		 * When we detect an all-ones write to a BAR register, this flag
    52		 * is set, so that we return the BAR size on the next read (a
    53		 * standard PCI behaviour).
    54		 * This includes the assumption that an all-ones BAR write is
    55		 * immediately followed by a read of the same register.
    56		 */
    57		bool			bar_sizing;
    58	
    59		/*
    60		 * Resources copied from the AHCI device, to be regarded as
    61		 * resources on our fake bus.
    62		 */
    63		struct resource		ahci_resources[PCI_NUM_RESOURCES];
    64	
    65		/* Resources corresponding to the NVMe devices. */
    66		struct resource		remapped_dev_mem[AHCI_MAX_REMAP];
    67	
    68		/* Number of remapped NVMe devices found. */
    69		int			num_remapped_devices;
    70	};
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
