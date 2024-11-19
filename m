Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4BD14B94B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732000299; cv=none; b=kptNJ90pIoDCfO1+3RzjSCtRrK5u+c3s50rY1SzMmx+HCokP4xnA8oZoPjzUzBLikQWanBHnPR+h8fbMqoCYbsf/EX5Pw6sqpJzhGhTnsg+3IT1vEJk7tU7R3AFn/7W53MealUo/l9wPhTT9ORCyHeJQhAAxhlvTN+Ylhb4+svE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732000299; c=relaxed/simple;
	bh=1s2y7PBjjGwwhdRbAg687OKqk3WaLXlWMX+yCtALHKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ks1TxQn5ZO+7xDjhw3B7cLLSQCj1MyoHooQ0kmb5t3ze+sYM3aFJyOFbFAelxD4dsHAoPJ0tmniY1LNxJVeCQzIdpdNWpsmG0kZLhvB6aJgTREPGSaRj+w3ufzt2m+TunwGa4RTviEjxfz8UwCxPBS5hieUZwf6v701prWlBh8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8f5Kc5A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8f5Kc5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732000298; x=1763536298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1s2y7PBjjGwwhdRbAg687OKqk3WaLXlWMX+yCtALHKs=;
  b=a8f5Kc5A88PChDeuDBInBS6x4VEvyfdVz11PS8rt+wIw/miNt3oycbu6
   IXuL6gv2Kx40Rai2U7XexxDg53oGAKa/bLoaUSUhGsdfDEoqePWiXODRh
   xoni/XirGpluGttH0rigB6BKg0i43wlV+mwLcGurTVkmcuAcTm7AXmqGB
   CYd3/mZczTPs9LX4+xdpMhJS6EsKT2eNbYmxjcRWpDrEN5KijoA4jahLg
   EvyI3BpRbjsCxYU4sU5u4ZsoxNv5jmmbiD50+V/Cj1pi3grj0mqDp2dHB
   3wICD0CmsnOUjoSDVo+I78HAWDA2x8VctMQrH7vis8nvY9ycq3Gu3RasM
   g==;
X-CSE-ConnectionGUID: s+A1jNezTWGrcvnelbkaaQ==
X-CSE-MsgGUID: 1oj5hs12QUWonQghd7YlJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42500362"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="42500362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 23:11:38 -0800
X-CSE-ConnectionGUID: Nbw3IDKxSoiepgk6ZHIYRw==
X-CSE-MsgGUID: yGQ//KD9R8iKN17U6a18Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="94538010"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2024 23:11:37 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDIOc-00009z-0i;
	Tue, 19 Nov 2024 07:11:34 +0000
Date: Tue, 19 Nov 2024 15:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/zen-sauce 6/31]
 drivers/pci/controller/intel-nvme-remap.c:47:21: error: field has incomplete
 type 'struct pci_sysdata'
Message-ID: <202411191515.y9mVC8dz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/zen-sauce
head:   40de9c08129e2d8e182a166df2f1e823f70fa31d
commit: 1cdff301de6db901bc2bfd7ce78016d9b824d667 [6/31] ZEN: PCI: Add Intel remapped NVMe device support
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411191515.y9mVC8dz-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191515.y9mVC8dz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191515.y9mVC8dz-lkp@intel.com/

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
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
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
   include/linux/pci.h:1051:52: note: expanded from macro 'PCI_VDEVICE'
    1051 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                           ^
   drivers/pci/controller/intel-nvme-remap.c:448:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     448 |                 .class_mask = 0xffffff00,
         |                               ^~~~~~~~~~
   drivers/pci/controller/intel-nvme-remap.c:446:3: note: previous initialization is here
     446 |                 PCI_VDEVICE(INTEL, PCI_ANY_ID),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1051:55: note: expanded from macro 'PCI_VDEVICE'
    1051 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                              ^
   15 warnings and 1 error generated.


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
