Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8F375F8E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534681; cv=none; b=OfuOqer0Lkgm5s5DfVzLx9vfZfNUvH5o8YzwJd9xoitcmKnnVBp4Lh/J2UGXr157G2ZtCY9dPJiKCu5bzGPHBLd6JNWFjqwDNnSxhZaEMCeQa0i5J8WT7DXZ14AlxYvibvLB/N65XcX/Y+AwoMSdWwlY8pwGtMtrhWAGPEggikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534681; c=relaxed/simple;
	bh=V2A64kMok9A2t18YpJbyF9g2vQyOhhFUOTKOWbxg/sY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FX1To+5XU3vsHKLNyi8/hlgBtkjfVxPYY+bskZ3qmaEwxQLbsb38hwEZye43xS/Paqt0mlUUTIo04aKHYQxAI1JdidiFbArrihd6gRe4nw20arh4mAHM2UP/dNjSZ8vLnOe2x6izUl1zfOo8TJUPxDUhDyAu6CkqmRX6T5lIneU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IVlupWsZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVlupWsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534680; x=1807070680;
  h=date:from:to:cc:subject:message-id;
  bh=V2A64kMok9A2t18YpJbyF9g2vQyOhhFUOTKOWbxg/sY=;
  b=IVlupWsZe07I8T9W89BcibQ4lpqhpivY7P/l3T/Ren064v+CgxiYVFQ+
   K8HWzWakLymlvrKzAjUgigiYB2xq7rL3QTEhn+cArf+8z0tBbP0gJ0oDn
   sH6yZ1qRGvRW0uw6k0GH8TquAcnXH8trkPbCbrDqybUJvLTjEIEpy+0U9
   /vE7SQF79Hqmt1DpmT4kY+nmYlEcwhzURcJhpLzY81Sc5hMbF/lhiHAiJ
   XlHLb93Gw0f+81x7gPghAluteHaKmkDXstIBujX4SIuFp1h8o+Ip6mRGq
   OaRxE3rofHt1gfYWzr2/olmXN4AGN+qXvJPyPMNjx1j+3HorSmxpj+o4K
   g==;
X-CSE-ConnectionGUID: C/O3f8STSySn4cKWAD78pw==
X-CSE-MsgGUID: x7eL84MqQquAdyducwV9/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87193699"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87193699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:04:38 -0700
X-CSE-ConnectionGUID: 5r633Ea2RyaaBSxwv/qU8w==
X-CSE-MsgGUID: 3+aueFWZTtOU6zVm7sTaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="228319729"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Apr 2026 21:04:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xg2-0000000009V-1Fid;
	Tue, 07 Apr 2026 04:04:34 +0000
Date: Tue, 07 Apr 2026 12:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/zen-sauce 4/34]
 drivers/pci/controller/intel-nvme-remap.c:47:33: error: field 'sysdata' has
 incomplete type
Message-ID: <202604071123.IJmS4H46-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/zen-sauce
head:   d17b2b02b5cf029f5248299f56e4a0a041548604
commit: e79f96b70c040b0948a21e1421365406601215d8 [4/34] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260407/202604071123.IJmS4H46-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071123.IJmS4H46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071123.IJmS4H46-lkp@intel.com/

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
   include/linux/compiler_types.h:566:27: error: expression in static assertion is not an integer
     566 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
