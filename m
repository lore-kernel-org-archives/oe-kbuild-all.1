Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154319DFA2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 23:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759534576; cv=none; b=sV0G19xTFLcuytg8xObrh5oTxbmFTJM3iE1yefDvday0pploB0R6jq0aTMZB391xoDTZCxgLgPE9euECAo8SCD3mQLkgnKT5pr8rcO7G5u9E+TpnHEYPXIN39gRV8HqmiDJLxWmIZfNtQPKI0MTHiOSqKvdn7HQ1uMIckcZ+Mhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759534576; c=relaxed/simple;
	bh=Hsnue/tqfpty/qIduDst0jOJhTlA/ziL6uor4XIVov4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqteCS0S8XrheW7fv5KITZLW8nEwycSPPVMT0yZ1yQvWlXhi76V58NHD1Q/IDAf5cKUdbbq/Mxl+J6DAiOpliTO7wxbx0JV2nHasnRwnV+kAvhhjwPmsV2Bp+C7t8xaQD+KujldGIqxsIxdV4Crp328OSk03PhGKHvUrQpHMi9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1ZCnHIy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1ZCnHIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759534574; x=1791070574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hsnue/tqfpty/qIduDst0jOJhTlA/ziL6uor4XIVov4=;
  b=k1ZCnHIye73eAhOGUVdOEI43019xvPIqsMGHyG9Holtdva7gIQwSSHYg
   y5yhAjAW65PAO1ZK2OYHTW9DyV/roCD+gkMcIDUNci8RGij/HJPAdp2T9
   rVqbCFKusKA6DBYx9rVMmu+XpMJJghKq+PoIP2Y5mHJ2twXwLMMpMgVPB
   udHytuPaOmRGX7LSLW9yN1LcUsJ6rUTJ6/0EcSiC9tzsuxXq5RKcyZ045
   mb90JN3iB9BNthPzzhGy4yaPvfM204dGI21hl1VzzV7r8C0V4N4ZN6zN7
   lR2Ka53poU7GqkqRHv6lqn3kEn7uLhrOWVlOq1peipl398SLaLuAzgw9B
   g==;
X-CSE-ConnectionGUID: W4TXzlbhTsO74a+EiCxVhQ==
X-CSE-MsgGUID: omf/9hapRfuQxLHkFFXFcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73246258"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="73246258"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 16:36:12 -0700
X-CSE-ConnectionGUID: nhc7lK1nTZC8UabqplHtGA==
X-CSE-MsgGUID: YnXdkBbXQE6pXHIB8RnaiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="179322555"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2025 16:36:11 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4pJp-0004yR-0p;
	Fri, 03 Oct 2025 23:36:09 +0000
Date: Sat, 4 Oct 2025 07:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.17/zen-sauce 4/29]
 drivers/pci/controller/intel-nvme-remap.c:47:33: error: field 'sysdata' has
 incomplete type
Message-ID: <202510040717.SZyux6K5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.17/zen-sauce
head:   c962d79d9e0133c53f1b88081abc3e3ad54265a0
commit: 0b7ff9ce1af3206c716ea6eb2b7ffe4144ffd290 [4/29] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251004/202510040717.SZyux6K5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040717.SZyux6K5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040717.SZyux6K5-lkp@intel.com/

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
   include/linux/compiler_types.h:507:27: error: expression in static assertion is not an integer
     507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
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
