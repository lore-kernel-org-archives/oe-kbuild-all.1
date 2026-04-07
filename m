Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB923783A8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534622; cv=none; b=muHtyi7zvNl7H5xHxuW6h5gRMeMERNjxgG82nbo8Ppo066lVnuMnx2ho33v2n+SoumZG8rtU33Sx97s9QQ7e3JSKxbrhMJKRGIU14VT95Y/+MleaPB94ECPr91O95BRnhWjYrkrqCHr0IMIySLPk8XMzBh23UQ4MhUHgD+h0VDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534622; c=relaxed/simple;
	bh=XO/4gbpIG+wS5oDyZFZlVQfphoJWSN4P2xRBb85FcGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nMaAGL2jS9YT8jt1VHYAbD9CAvWI3o5UdtbSME+CCczvuq7UrtDvjJ67kkfHIcWPU8f8NEsIcQpH2mUR4VowoOco0xbS/Q7TKDcaTMLR5lBwUACuf0jwZGxJ2R4V7TwVeKPF0agI7iTe/3rdLlSnHSpux3YHH96nRY/x5Nk0hJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRh6TpU5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRh6TpU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534621; x=1807070621;
  h=date:from:to:cc:subject:message-id;
  bh=XO/4gbpIG+wS5oDyZFZlVQfphoJWSN4P2xRBb85FcGE=;
  b=jRh6TpU5m9oUyQvrsna09X6x60lInod+3Y+NyCIRrpyAYLaCdtYAZEQN
   0NRCulXFn/xuWpuaZLAFiXzMpsi4hmL2qLaLnSaEYqY66Fo5q44UyqAHN
   HEoj6XnMq0X87d8rDRZ2qK3uFD9ibLM0Put0ETZ67Tb1YEhGMJeDCemyC
   QkM6JYl/vfYwJYVr34vHUwkHn3AgqSEcuObUokHBXiXAtt7Mk587oTHI8
   0uLC3FatLsWiYfzAAJqgLSSbn4/8nHx/BCZZ+DHuz84p11h8lSl20df30
   1HkEgxrWuTb4RB9fj2q44EVrnB58R2WKr/i6yZyuuRMDGmFjdPHvdQmH6
   g==;
X-CSE-ConnectionGUID: 4pAwccBISi62pqupXsOcYg==
X-CSE-MsgGUID: zwQx317/QwOJTwGYz7QXgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87114716"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87114716"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:38 -0700
X-CSE-ConnectionGUID: dKfl67DITjm4k8KEGUBb4w==
X-CSE-MsgGUID: cqP0evFcT424QnoM1ubeng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223261240"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 21:03:37 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008v-0ccQ;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.19/zen-sauce 4/34]
 drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete
 type 'struct pci_sysdata'
Message-ID: <202604070132.aP3AbdnW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 6.19/zen-sauce
head:   d17b2b02b5cf029f5248299f56e4a0a041548604
commit: e79f96b70c040b0948a21e1421365406601215d8 [4/34] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604070132.aP3AbdnW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604070132.aP3AbdnW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604070132.aP3AbdnW-lkp@intel.com/

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
   include/linux/pci.h:1105:52: note: expanded from macro 'PCI_VDEVICE'
    1105 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                           ^
   drivers/pci/controller/intel-nvme-remap.c:448:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 |                 .class_mask = 0xffffff00,
         |                               ^~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:446:3: note: previous initialization is here
     446 |                 PCI_VDEVICE(INTEL, PCI_ANY_ID),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1105:55: note: expanded from macro 'PCI_VDEVICE'
    1105 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                              ^
   3 warnings and 1 error generated.


vim +47 drivers/pci/controller/intel-nvme-remap.c

    35	
    36	#include <linux/ahci-remap.h>
  > 37	#include <linux/irq.h>
    38	#include <linux/kernel.h>
    39	#include <linux/module.h>
    40	#include <linux/pci.h>
    41	
    42	#define AHCI_PCI_BAR_STANDARD 5
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
