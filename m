Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0791F5839
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731572230; cv=none; b=JBdIkmG4TJ/dI0QjmI/rGuHdvjLyz3XNsJW5w43s8Rh/KzYAy/qFUSNWVZSbiH0Si9bi8eXRsrYb22NYRLof1OS77cp2mWX5k7AekwD8dG3wZ2m1vr4wBS3jrCMlaEnfQgWKbeCPMmEQhGi8gdDA8d/SqfcRyTMUygw8M1bIGQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731572230; c=relaxed/simple;
	bh=h9B7E3bOXA6A1Ztr7HHZZJaRwF84jY8WlPj7TXXzmQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3vYuBLEs73cUpvOa0fXCD6h7+OoTRmOSDxVbpeL4fpdASfFJALTnmzOf5El4QZ02Q45J3nudXXAENR4qUt6wfhI+MlDRQZ177eMO1eGEq/kPBWnMHnNU/vSFQ0Styh1PPgHvQnsxap4DPhLyzpTFaBVonQZUqcaRkKnlYJN3ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHOMWfr6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHOMWfr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731572229; x=1763108229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h9B7E3bOXA6A1Ztr7HHZZJaRwF84jY8WlPj7TXXzmQU=;
  b=JHOMWfr6B4o05Fc24eVQk84zFJcJYijn4Vd0KzUedsbt5mr2BCeX9k2V
   wgDEjiJTmVVfCDd0Bq//qWC4ArKoKb5aIrh9eJCSxlqVhi32liQcIxO4h
   Mte8dGfgPNWcFpH/DNO5FCWr7X4SjBwkHJtOcfCKgznxjDgo7rdiMuacP
   8OWxtqyXrb1HStqtMYEga3H/hapP1O64EUuarAvCDIdvmAh+4kwwQ2gt+
   ttHCcObYVARAy38H/QjHH5KrPa/G3WRCn49BIgM3j/LOBx8KbQzZqqiIX
   vp658/JmPjxXmxCsxzXmiDwYPhcs4UqZ1aHChTib/tTqOKnZ4C+LZ5Hqm
   g==;
X-CSE-ConnectionGUID: LNuT1j5gSO6paVUDfosJWw==
X-CSE-MsgGUID: LuLthfvXRPaE59hHiyMGHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30905754"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30905754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:17:04 -0800
X-CSE-ConnectionGUID: Lagu2D1QT1yY1UB+I330dg==
X-CSE-MsgGUID: l5n/r7btRVqrgHEDOk3AVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="125628925"
Received: from lkp-server01.sh.intel.com (HELO 8eed2ac03994) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2024 00:17:03 -0800
Received: from kbuild by 8eed2ac03994 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBV2D-00006X-1g;
	Thu, 14 Nov 2024 08:17:01 +0000
Date: Thu, 14 Nov 2024 16:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/zen-sauce 6/38]
 drivers/pci/controller/intel-nvme-remap.c:47:33: error: field 'sysdata' has
 incomplete type
Message-ID: <202411141640.FO4Kg2TH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.11/zen-sauce
head:   2e6219d117c34440cdd35e79195a4f0ab074ef0c
commit: 567908cc05dc5e02b1b9c26620bce3791559f9d4 [6/38] ZEN: PCI: Add Intel remapped NVMe device support
config: um-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241114/202411141640.FO4Kg2TH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411141640.FO4Kg2TH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411141640.FO4Kg2TH-lkp@intel.com/

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
