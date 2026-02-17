Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA231E5718
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771305258; cv=none; b=LZiG45Cp8t+mO9Va1G6K/gyfUjGzK7Aw6Vrkd4t8Kw5dwA4w475jrk5ZrYJ+53+yqqV31+huxODMvGW0p5KvBh2rEaPH/njdD2JWQvmnL12tWvXyKLbj0Bm8RaSAjkC5llrUW8hKfpFniuc25W1KIuY+IBu/8mmW1EtVsGIR/68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771305258; c=relaxed/simple;
	bh=5o9M+e+ueKIZQlpVFvujoz74dvoBJg2q/U41zgy0Auc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RE4HMDjDy1v6Z+21w+5ydIMBm02SuOfZ7D/bMsJ7JrkRGCOA88V0c8UEVDPn+pK9XikxSsQ7EDw7vmKho+ieOXOiizwQMrpK4A3vssmNdPKpIAjRuAsAET7iC7F5YXp4+aW+TR3p6qkCVf3Hi66QGP0uqeYIk42Cq9vy7dPJY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k90vf/JL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k90vf/JL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771305256; x=1802841256;
  h=date:from:to:cc:subject:message-id;
  bh=5o9M+e+ueKIZQlpVFvujoz74dvoBJg2q/U41zgy0Auc=;
  b=k90vf/JLoRqBsMcwbvy+B12a9SEmRSIpTYxQvrCtTQ8R7rkgN64oRQiT
   42xGfbBV2afC1UQ3DY2Q66kEciS5I8rzmAVJkeM6+8aJ0GPytoqCjWn2p
   1xA8WZTReArExl996rZ8GhBE+4J2kM+x6tG9ApC5S/POPMR8wTsDPj1eO
   YUUccmBazYvQHjIxjI6dmfXWDB0xr76Rj0cEyY04kIiyU6bpPFeWVwl1P
   v1lvWJCohaMBVwe3g8NfV626XnNS/JMBuGE2RskoD+6ekQ62RE2DtTCCq
   82arZ+emscNwC8v8MPjoi9IWnO/xdx/fNF9uICWRDWeGAxwXPi+HyYMbr
   w==;
X-CSE-ConnectionGUID: 2OqclxpQTCii5riq4I2tlA==
X-CSE-MsgGUID: aUs2/+MQREWkXJtFV3fFBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76212522"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="76212522"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:14:16 -0800
X-CSE-ConnectionGUID: P89lKbxLRNKRhewAq+Pjag==
X-CSE-MsgGUID: Xvua7SvMSXe7WeXgqJSxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213879693"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Feb 2026 21:14:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsDPY-000000010dI-0xOn;
	Tue, 17 Feb 2026 05:14:12 +0000
Date: Tue, 17 Feb 2026 13:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/zen-sauce 4/29]
 drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete
 type 'struct pci_sysdata'
Message-ID: <202602171354.rtOz3X15-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.18/zen-sauce
head:   0c87fdcd1f9f7f1a09e8928422160159b8966784
commit: dbc40c577cbb482c1d5c92d97724a026113e4526 [4/29] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171354.rtOz3X15-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171354.rtOz3X15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171354.rtOz3X15-lkp@intel.com/

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
   include/linux/pci.h:1076:52: note: expanded from macro 'PCI_VDEVICE'
    1076 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                           ^
   drivers/pci/controller/intel-nvme-remap.c:448:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 |                 .class_mask = 0xffffff00,
         |                               ^~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:446:3: note: previous initialization is here
     446 |                 PCI_VDEVICE(INTEL, PCI_ANY_ID),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1076:55: note: expanded from macro 'PCI_VDEVICE'
    1076 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
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
