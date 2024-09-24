Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DDF38C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 01:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727142717; cv=none; b=VOvF1pEg4Xo9LrnqPdqcJNs9Irbp9s8XqfmPpGDL0i3ftzTHYvkzec+C/MmyCK6S2RvwImBRltfbp2BxAtVRT5ww3tgUgXNtB2eZR0LhnFjntsheiQD9mX2QXagyNvEe3LGONB8DULhJDqrBW/OXu1AA6O5MJ2BxTXcRBRUG6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727142717; c=relaxed/simple;
	bh=iqjW8Q+TKgOTYTDcTygZCWa8t4JD+yU9MqDVO1PM4FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2siGuPwvm0JYvn9IZEet5413ZWRFYmDZ3y1fzgHrA3O0z2h58Tg0Csg9UdfMvRaziJSuQ4n9bPK66wo9pJ7j0FGxK1fOA/W898GpDMly8u+iT/E+D5REzDhcN2niSQ/hWfuLINrL6bMgQIR9gLWIMisErcatcqozhNo/+/KF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGMTPQqF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGMTPQqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727142715; x=1758678715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iqjW8Q+TKgOTYTDcTygZCWa8t4JD+yU9MqDVO1PM4FM=;
  b=EGMTPQqFS7e0YlNH7Dh3QL6mr8FeYOS8FAn+wSDCYTXiND8A15y/AdZD
   UyaguoeYHgZRsJqR9qqxoOHaNcg0Skk6y5DDkh4gZ7CsvTYVI+irbFAXY
   VtyJ9uyO1fPIN4AMwcJhvqmp81iulzOKIVFCasyVZtiXq+vqKzIpkZCi/
   cHNYSbqqBQHmUG/rFClstlZA0Ktv4nw1KASpbmWeIPTwLLHfp7sirNSaM
   CEiaCnTCvi/XMIZv3GofbrvTwaJ/vbsQQdHoGUbsJeqbM+RVHJeJcZwT1
   /LGyxI6/5jthBIjXIW2A1iNkUChiNV92pRY/OlnNCtNShlvVJ+/GXZX08
   w==;
X-CSE-ConnectionGUID: 7uPW0Yg0TwWKPj/683K2bA==
X-CSE-MsgGUID: +Y5BT+VRSJm562lBrxZ+kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48647428"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="48647428"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 18:51:54 -0700
X-CSE-ConnectionGUID: tkQAD+u+Sde66SMk+YgkzQ==
X-CSE-MsgGUID: LjOV5GOaTU6v7jHdI0Y71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="94597737"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2024 18:51:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssuiU-000HnB-3B;
	Tue, 24 Sep 2024 01:51:50 +0000
Date: Tue, 24 Sep 2024 09:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/zen-sauce 5/32]
 drivers/pci/controller/intel-nvme-remap.c:47:33: error: field 'sysdata' has
 incomplete type
Message-ID: <202409240917.sxFNR4cR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.10/zen-sauce
head:   8544d2d50967e073bbb7f31d422ace7384ac239e
commit: ab9eefaf928d1345fa09babb311b526b8b6142aa [5/32] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240924/202409240917.sxFNR4cR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240917.sxFNR4cR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240917.sxFNR4cR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/intel-nvme-remap.c:47:33: error: field 'sysdata' has incomplete type
      47 |         struct pci_sysdata      sysdata;
         |                                 ^~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
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
   include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
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
