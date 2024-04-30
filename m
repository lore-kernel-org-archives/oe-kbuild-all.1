Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB71870
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714438726; cv=none; b=a5J2LEzyqs8o0cKvSBIDDkaVXTjwObO/HmwYfvogYvv0GOrmNYcWfOpjWGKGnoNWS6djepfJQL0yCNUqfIrykzJ/BfT2l6WJ8oAw6vK5kpmcH8KuwIOnaHVHaUq64/sniR5DZ0IhqVl/LS8oDvffl+lIDYzmTbl8vOsLXNbdUM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714438726; c=relaxed/simple;
	bh=QmmFzLH4pLsnrBDzNbnT4xv4KawIxAwefbcb+NvdNiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5HI1gBP7Pu0FfdfqfCBQR4wlR0Bn3aFHgSpzPqapAVPx41c8CjRnR3NXC8X2kRkixUWSs3Prk1k+7yACcCx8YQLZYi/5wmzElygTHYrwNIG8fbfkln3SAiN0Dz/4/ppr1YbShFLjke4Ek/lSOAviEtTkREflE2ZbPVHuhTLrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHEVjOU8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHEVjOU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714438724; x=1745974724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QmmFzLH4pLsnrBDzNbnT4xv4KawIxAwefbcb+NvdNiE=;
  b=cHEVjOU8WPnMlX4KAE96W3t2iX5vuFifzgZM4ActjveL8h6YsL7wJMhO
   cBLrafOqBzBZLdtkP3eixKLOonR0Iz3IzBlzdwIyp+Ho4I7C/pZsRe2Z7
   YFxR0qimgFzCSIKQARkxg1ys5AyTIMkMUmsRP2xpLOcB6QGiU59RArrkn
   iaZsaZihRIVkSSwmjnd+iXPxwsv1M0w/qM9sm6Ndgo5fxYZEiHKXpu3Dr
   XrtdxX4B67JP9BOfVjefpmZafSd/ReQIyaMkLlUFiS65ERX4lzLAo1mtJ
   C5cmy0WiucKqXUuptaMDGz4ykTkFsFel3b/3/o2Me8KTYSdCKU8QdEk3k
   Q==;
X-CSE-ConnectionGUID: R4suUlioRZazwZGTPr6T/g==
X-CSE-MsgGUID: U9JTWEJRTx+kx2qxwmxpGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="35513173"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="35513173"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 17:58:43 -0700
X-CSE-ConnectionGUID: 7GpncuyMRQiNVqoCtKkfSA==
X-CSE-MsgGUID: MQCmJT6fTFW3a9MMJ1f3Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="30921807"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2024 17:58:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1bpP-0007Zw-2y;
	Tue, 30 Apr 2024 00:58:39 +0000
Date: Tue, 30 Apr 2024 08:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 5/7] include/linux/page_counter.h:20:27:
 error: expected parameter declarator
Message-ID: <202404300843.HqCvlqMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   74f3bba65f60c295d6ea14d848aaefed4a70c397
commit: 527af2b8159ca031e267813637bebe68bc14875a [5/7] mm: memcg: merge multiple page_counters into a single structure
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240430/202404300843.HqCvlqMj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300843.HqCvlqMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300843.HqCvlqMj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/mem.c:12:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/char/mem.c:19:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/char/mem.c:19:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/char/mem.c:19:
   In file included from include/linux/tty.h:11:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
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
   In file included from drivers/char/mem.c:25:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   include/linux/page_counter.h:20:1: error: unknown type name 'define'
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         | ^
>> include/linux/page_counter.h:20:27: error: expected parameter declarator
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                           ^
   arch/s390/include/asm/page.h:31:26: note: expanded from macro 'HUGE_MAX_HSTATE'
      31 | #define HUGE_MAX_HSTATE         2
         |                                 ^
   In file included from drivers/char/mem.c:25:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   include/linux/page_counter.h:20:27: error: expected ')'
   arch/s390/include/asm/page.h:31:26: note: expanded from macro 'HUGE_MAX_HSTATE'
      31 | #define HUGE_MAX_HSTATE         2
         |                                 ^
   include/linux/page_counter.h:20:26: note: to match this '('
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                          ^
>> include/linux/page_counter.h:20:26: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                          ^                       
         |                                                  void
   include/linux/page_counter.h:20:51: error: expected ';' after top level declarator
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                                                   ^
         |                                                   ;
   17 warnings and 5 errors generated.
--
   In file included from drivers/char/tpm/tpm-interface.c:26:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   include/linux/page_counter.h:20:1: error: unknown type name 'define'
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         | ^
>> include/linux/page_counter.h:20:27: error: expected parameter declarator
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                           ^
   arch/s390/include/asm/page.h:31:26: note: expanded from macro 'HUGE_MAX_HSTATE'
      31 | #define HUGE_MAX_HSTATE         2
         |                                 ^
   In file included from drivers/char/tpm/tpm-interface.c:26:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:18:
   include/linux/page_counter.h:20:27: error: expected ')'
   arch/s390/include/asm/page.h:31:26: note: expanded from macro 'HUGE_MAX_HSTATE'
      31 | #define HUGE_MAX_HSTATE         2
         |                                 ^
   include/linux/page_counter.h:20:26: note: to match this '('
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                          ^
>> include/linux/page_counter.h:20:26: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                          ^                       
         |                                                  void
   include/linux/page_counter.h:20:51: error: expected ';' after top level declarator
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                                                   ^
         |                                                   ;
   In file included from drivers/char/tpm/tpm-interface.c:26:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/char/tpm/tpm-interface.c:26:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/char/tpm/tpm-interface.c:26:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                                                            ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/char/tpm/tpm-interface.c:26:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/char/tpm/tpm-interface.c:26:
   In file included from include/linux/suspend.h:5:
--
   In file included from drivers/char/tpm/eventlog/common.c:18:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/char/tpm/eventlog/common.c:18:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   include/linux/page_counter.h:20:1: error: unknown type name 'define'
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         | ^
>> include/linux/page_counter.h:20:27: error: expected parameter declarator
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                           ^
   arch/s390/include/asm/page.h:31:26: note: expanded from macro 'HUGE_MAX_HSTATE'
      31 | #define HUGE_MAX_HSTATE         2
         |                                 ^
   In file included from drivers/char/tpm/eventlog/common.c:18:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
   include/linux/page_counter.h:20:27: error: expected ')'
   arch/s390/include/asm/page.h:31:26: note: expanded from macro 'HUGE_MAX_HSTATE'
      31 | #define HUGE_MAX_HSTATE         2
         |                                 ^
   include/linux/page_counter.h:20:26: note: to match this '('
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                          ^
>> include/linux/page_counter.h:20:26: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                          ^                       
         |                                                  void
   include/linux/page_counter.h:20:51: error: expected ';' after top level declarator
      20 | define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                                                   ^
         |                                                   ;
   In file included from drivers/char/tpm/eventlog/common.c:20:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
   In file included from drivers/char/tpm/eventlog/common.c:22:
   In file included from drivers/char/tpm/eventlog/../tpm.h:26:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/char/tpm/eventlog/common.c:22:
   In file included from drivers/char/tpm/eventlog/../tpm.h:26:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/char/tpm/eventlog/common.c:22:
   In file included from drivers/char/tpm/eventlog/../tpm.h:26:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:78:
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
   18 warnings and 5 errors generated.


vim +20 include/linux/page_counter.h

     9	
    10	/*
    11	 * Page counters are used by memory and hugetlb cgroups.
    12	 * Memory cgroups are using up to 4 separate counters:
    13	 * memory, swap (memory + swap on cgroup v1), kmem and tcpmem.
    14	 * Hugetlb cgroups are using 2 * HUGE_MAX_HSTATE separate
    15	 * counters: for tracking the usage and reservations of each
    16	 * supported hugepage size.
    17	 */
    18	
    19	#ifdef CONFIG_CGROUP_HUGETLB
  > 20	define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
    21	#endif /* CONFIG_CGROUP_HUGETLB */
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
