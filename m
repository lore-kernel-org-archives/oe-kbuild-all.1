Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C9A288DB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 04:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754369769; cv=none; b=CqFPhUGOk+RzqWkqt5s2pU+1gg+SxggQApW9WVy4/0c/8P33ToziOBqbqJAohgQ3Dply8JnP/Cgjr1MEntfHLK3YZjMJUHeE23H47Rt6Ul6M72mwcwOoO63U2Hu/by1D4vsy1wMVOq9r8PnfPOOGEveIe2ATrnVpGMf9MUo3EEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754369769; c=relaxed/simple;
	bh=Rb2owdhFivOWSVzvXnSaV5H2seqBcGrDrn7slH+FdRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZqeSOcIx8/J2EY1m+Hp6LDiwDRhpoAsPS7BRUoL9ZI+XlVKtq+H1JbjYRREpKTK+n5xcCdyH/ncKxq3AYYa44JqVcaetS8o6gEVTM28XyiKxSV3XHzesmzrK8oLI7wmcrc0PpF2H43MGKneAZNd1bjOpyC3+yTTRh6pkLZZZnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6ArzGxD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6ArzGxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754369767; x=1785905767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rb2owdhFivOWSVzvXnSaV5H2seqBcGrDrn7slH+FdRI=;
  b=M6ArzGxDGPxn2T/C0jAmWoaWAq4o2skRyNWwxD8vP9OrqgtmauheTNy5
   0vCMa+Wg5/Iled9FCL9JFFwRqi2AEnYdLFIR24oBRI/4AGQc2cIT+5Uip
   nLJ7B6wm18bpFC2QOEF6BWC1cn9/hWLouUCRZAz6WOMWeeuA5DNvlx8qm
   3skjLeI/Sl+sx6r1dpKGMujSoTLrG3Urtq5EOoC4P4KP4/mYSpz5G2HDb
   WAyNGZQ0GcVVqTl4FsJcYrA8R0ll0KHwibkyS5gRMFJK7hsRk+W0sPQo8
   iNL0hUQLe4ns3YMrkYydwdewTZJq9m9sNKxPny66n4kIOkmlOHJ3rUYiA
   Q==;
X-CSE-ConnectionGUID: bHhTqs8NRu6rdqo8ldVG7Q==
X-CSE-MsgGUID: gYPXCVmXSzSMQs5dWiccqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56726409"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56726409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 21:56:07 -0700
X-CSE-ConnectionGUID: BiFJTdkNS7WF2T+eTC5fNQ==
X-CSE-MsgGUID: O/hxZhSRQBeC1AK8Xyox4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="195309345"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2025 21:56:06 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj9iV-0001wB-1a;
	Tue, 05 Aug 2025 04:56:03 +0000
Date: Tue, 5 Aug 2025 06:55:53 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.16/zen-sauce 4/31]
 drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete
 type 'struct pci_sysdata'
Message-ID: <202508050638.bndB4tpu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.16/zen-sauce
head:   08d11019f3924f192e1a68d7d2007f8ec7bdf889
commit: 8f7dbc1fba107ae9369d57f037f876f3ca69e910 [4/31] ZEN: PCI: Add Intel remapped NVMe device support
config: um-randconfig-2005-20250805 (https://download.01.org/0day-ci/archive/20250805/202508050638.bndB4tpu-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050638.bndB4tpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050638.bndB4tpu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
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
   include/linux/pci.h:1052:52: note: expanded from macro 'PCI_VDEVICE'
    1052 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                           ^
   drivers/pci/controller/intel-nvme-remap.c:448:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 |                 .class_mask = 0xffffff00,
         |                               ^~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:446:3: note: previous initialization is here
     446 |                 PCI_VDEVICE(INTEL, PCI_ANY_ID),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1052:55: note: expanded from macro 'PCI_VDEVICE'
    1052 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
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
