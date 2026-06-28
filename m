Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0E25B0A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782637369; cv=none; b=D3G0HDDwgsrfwvUgUxhIAuE3v+pEKKZGQF6Kpz4myuLzlYMzNR9Xw+SPL7ThosxM0xz/alWsmk5t33+0vyZrYL+EbKGDEZqOg5zrlXoJI3LRiZo3cm7Q2W/rJdq/ATO/e8195QBzqr7L3vjdmcRRVanRD6aTbYYxo8S7xRWKWVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782637369; c=relaxed/simple;
	bh=QmhlrB3R0PqaEA2d1CYjXTzKO2GGjM/b+zk5ZhCCqto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qkMXgoEnke/SwI5Tmz76HkZEII+bSiG7X1iEdIZd9uRxvUVZQK3TDUpGbCeBEJFZoDj/A0IYMjpSd81Ij+K5OVLd2tc7dVpOqSeW1GuEhiid2Un09V7qXwUk8QE/LhcoCxGeD8geRn0fpvczQ9UzbppSsOL1QUnDyf/E24uSYZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/5tUOnd; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/5tUOnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782637368; x=1814173368;
  h=date:from:to:cc:subject:message-id;
  bh=QmhlrB3R0PqaEA2d1CYjXTzKO2GGjM/b+zk5ZhCCqto=;
  b=U/5tUOndO/h4OJHYzUH/Dxcwk7SOU8gXYvazXif/OoC64DuQJ29Tj74I
   Y812VWNX0oiIqcJnOSgSRfH5W60vofpxrd1txbCxboH6w+LMsiOLT2T/r
   sHdKG7fGy4y8Q5wMvv5kKWuKQZkXKZhsbFq6MAJO/OGFCud1Bs298IiDB
   3HSt4lbYeOFz5/bB9Rt2tgeK+77lbapPz9MOMWkQz2WMGzYUHtr8CgRby
   xLTPqQtXddUxNYmxVlDk5ECCKyL291zllDXgXK/f4LpkFk8vg4dK8uQbw
   8vnpgeTkmrYFutz22HMYk99C2V38QoskNty9X59X6ZRXCuVlr9hSwofBa
   A==;
X-CSE-ConnectionGUID: 47Y0/bxDR8C2OnKfin3smA==
X-CSE-MsgGUID: 5ZeHryZ3R22g8K+ZkEqhxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="83389296"
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="83389296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 02:02:45 -0700
X-CSE-ConnectionGUID: f4ecZxTCRzmyb0FnJ76RCA==
X-CSE-MsgGUID: HE1CGV/mRFykovdEqXz8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,229,1774335600"; 
   d="scan'208";a="252334857"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2026 02:02:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdlPU-000000006Gj-46k6;
	Sun, 28 Jun 2026 09:02:40 +0000
Date: Sun, 28 Jun 2026 17:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/zen-sauce 4/31]
 drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete
 type 'struct pci_sysdata'
Message-ID: <202606281658.Y9ypJTul-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/zen-sauce
head:   420dbda6d6b42784ca35e6b0596fd8e68c23b219
commit: 6601cc3e542564dcbdb6f106745954c866459d9c [4/31] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260628/202606281658.Y9ypJTul-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281658.Y9ypJTul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281658.Y9ypJTul-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete type 'struct pci_sysdata'
      47 |         struct pci_sysdata      sysdata;
         |                                 ^
   drivers/pci/controller/intel-nvme-remap.c:47:9: note: forward declaration of 'struct pci_sysdata'
      47 |         struct pci_sysdata      sysdata;
         |                ^
   drivers/pci/controller/intel-nvme-remap.c:447:12: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     447 |                 .class = PCI_CLASS_STORAGE_RAID << 8,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci_ids.h:23:33: note: expanded from macro 'PCI_CLASS_STORAGE_RAID'
      23 | #define PCI_CLASS_STORAGE_RAID          0x0104
         |                                         ^
   drivers/pci/controller/intel-nvme-remap.c:446:3: note: previous initialization is here
     446 |                 PCI_VDEVICE(INTEL, PCI_ANY_ID),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1125:52: note: expanded from macro 'PCI_VDEVICE'
    1125 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                           ^
   drivers/pci/controller/intel-nvme-remap.c:448:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 |                 .class_mask = 0xffffff00,
         |                               ^~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:446:3: note: previous initialization is here
     446 |                 PCI_VDEVICE(INTEL, PCI_ANY_ID),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1125:55: note: expanded from macro 'PCI_VDEVICE'
    1125 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                              ^
   3 warnings and 1 error generated.


vim +47 drivers/pci/controller/intel-nvme-remap.c

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
