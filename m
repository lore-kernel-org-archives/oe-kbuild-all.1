Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E9B6F2E5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720381938; cv=none; b=G2PJfS7tHfmR7+m3GZtPlto4zWOQFu7QylqUDpRIpFDkhJjmpRDTjn49Uva0Xir2luF0H97xEmEtrKZ32FCfsSpV/6wpwYLQmu5LnJHimkLfub3ad1oUInwY0ytuo4AdUOdREaT1dOIpEMutMio3EgOE85k62C2UPDQZd3qcy/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720381938; c=relaxed/simple;
	bh=ntgbd+tM5ungZYCAhYkYMZsVc3TqzXaTzRC4tCKLzyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mqi4gfeK6CPqay1JWNy/lhOEl7N89DP3XFYq9/PWVOZpqMxLST5ORUGO022T0l3OVyJ+YF2f4syLKEN0ANMH5jGJTQyp2oqX6wsSdjp6UUcziQXazd3VBepXlWf8D63BRrfuZ+09Vh8zthYYi9edE66sH8/e0HQo2Hgwyo7aIok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwS1UqGF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwS1UqGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720381937; x=1751917937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntgbd+tM5ungZYCAhYkYMZsVc3TqzXaTzRC4tCKLzyY=;
  b=UwS1UqGFFJmRUzSjl59DiPnLpalqOb3NGa84hAWLw3Z4IxOKhu4BlOis
   xObgwlEYbQwV0tbQVazkPXPQS6yyQ18vRmzDhBNgqruHtNrHMSUM2kng1
   MZQxHI8X8R/JWwtX8O8iJyV4PK0jZ+ltl4CDq7I+tlN6C1KtZvvwEn4yF
   mK4/VwwbM9CBemze9YXprwbUS3CeqeKsG2UXH/KZcIj0bQIoVlQ7jqH8E
   3HBDByyGA+J8/nxiU4WtEE0dU+9wnJZunZj8GMCTkZxbFJcZtbJ2dYblh
   8lh5q+R8EvFTeSEyF7jf+B95RqaWRjLbMayj0aMWMr1dAg+cZWUI0VrKK
   w==;
X-CSE-ConnectionGUID: 3dvBf/fsTKKED15b8ql1Vw==
X-CSE-MsgGUID: 4v/5KgESREe8a9ftEIBR6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17686017"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17686017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 12:52:17 -0700
X-CSE-ConnectionGUID: ZyhR/lMxSxKatess1WJcXA==
X-CSE-MsgGUID: 8xkT+FIsSuCpVysojfYgKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47272770"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jul 2024 12:52:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQXvh-000VEc-28;
	Sun, 07 Jul 2024 19:52:13 +0000
Date: Mon, 8 Jul 2024 03:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/zen-sauce 5/32]
 drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete
 type 'struct pci_sysdata'
Message-ID: <202407080312.hqKqdJvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/zen-sauce
head:   21122ebc1a7da277bbf25545da58b29f0d785c60
commit: e93bbd136fd055f85e95a1477531a8c9ef4e8bc9 [5/32] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240708/202407080312.hqKqdJvm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080312.hqKqdJvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080312.hqKqdJvm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/pci/controller/intel-nvme-remap.c:37:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/pci/controller/intel-nvme-remap.c:40:
   In file included from include/linux/pci.h:1654:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
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
