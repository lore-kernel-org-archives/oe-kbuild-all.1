Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7311B977
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727146499; cv=none; b=A1hbGqFdSl1lm9hqOvqLaTDEtNd2YFYPQhyrheaMh2mu3IXZx1WkfH6ctB/ZgiKXXvaOXjNWqstff5c4IL6EOQ8yc7jRFPUTHdsNpgbQ5UV+YnDo/6zmxAgGlrGkGczuu/X5CMG1Ff8dm/kHQp2y8z4fncYD6qh1Fk0fTFTo+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727146499; c=relaxed/simple;
	bh=vrVPAw2NxO7mEzTUgzvxdeHw+1HH2C0JSWz8AW6sTEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDEurZdF9/LiEuPCJ4uNXk4vQmlgfffUPjcgZ+ZY2tNBalxYY0OfKX1nh4Wfr1HSz5Roq0WD9pua9a8Pv1I7eiun4xS4IaPBUzDK4+ulK+cb4JvS4ZheBaKN6nV1Iq2FZxRW043Z1vOOgaEpFfUgpfH5ytXb9+RdiCYPa/RJIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+DUTR61; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+DUTR61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727146497; x=1758682497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrVPAw2NxO7mEzTUgzvxdeHw+1HH2C0JSWz8AW6sTEw=;
  b=M+DUTR61Cz8RL2AlqcZvPSYFXmNrRLkmCGsRkYqUpMshC+3Bypf2dDWb
   I2PFoG1EEhVeZ4xozCQJSuRnxU1zNPY9EM9v3X+2yZ1zWdeTFAx7Dp6ft
   s0Vpu8nBurHEd8XXCTPt6XmVHPPNzdFpQuP/eS3cAL1yHdgTKq3XPKwQT
   edEJtW8X4P67i8aLGt+iSeHeiTDpxcpwXMmEp1BSLZ8ONVtUQ/JCr5vC0
   Bz2x+S+cIEO5pA6ODXIw+aKCv6inTayTnCYTP8+7vZtjnc4eAm4fR22zA
   XUR+2S4DY7I0XbizXMjC+oLudj9/oW9Ik7O1JXw8iTbyc9mXfsPT0RgzG
   w==;
X-CSE-ConnectionGUID: tKWRKzXmT/Gu/WXZ+VVezA==
X-CSE-MsgGUID: 6Ww0N5ZQSLOnREPM9LDW5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43639112"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="43639112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 19:54:56 -0700
X-CSE-ConnectionGUID: 0jMFqPjUQU2wqZh618MMGg==
X-CSE-MsgGUID: c3+EerkHQy271NTq6/eAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71317221"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Sep 2024 19:54:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvhU-000Hq9-2K;
	Tue, 24 Sep 2024 02:54:52 +0000
Date: Tue, 24 Sep 2024 10:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.10/zen-sauce 5/32]
 drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete
 type 'struct pci_sysdata'
Message-ID: <202409241057.EFmNXUAt-lkp@intel.com>
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
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409241057.EFmNXUAt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241057.EFmNXUAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241057.EFmNXUAt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/pci/controller/intel-nvme-remap.c:40:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   include/linux/pci.h:1048:52: note: expanded from macro 'PCI_VDEVICE'
    1048 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                           ^
   drivers/pci/controller/intel-nvme-remap.c:448:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 |                 .class_mask = 0xffffff00,
         |                               ^~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:446:3: note: previous initialization is here
     446 |                 PCI_VDEVICE(INTEL, PCI_ANY_ID),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1048:55: note: expanded from macro 'PCI_VDEVICE'
    1048 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                              ^
   15 warnings and 1 error generated.


vim +47 drivers/pci/controller/intel-nvme-remap.c

    35	
    36	#include <linux/ahci-remap.h>
    37	#include <linux/irq.h>
    38	#include <linux/kernel.h>
    39	#include <linux/module.h>
  > 40	#include <linux/pci.h>
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
