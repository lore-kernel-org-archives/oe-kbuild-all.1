Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C87F4E7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 03:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714793839; cv=none; b=GETQxPt0IKz9WJMeKGFMMAGucHm2vWK3SH+UoHY8dmGzXUnzTYyHgY6yW5wk99jZdtnJt6+EpPWTFC27YIVB3dZEOZYlSP+a8i3E+Q9KY+OrWQvzX+WD95/SFQGl1OyrO4JYvubJ6Svx5ty6NuvFy6v6kKUC5t8pKCnpBrrYJTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714793839; c=relaxed/simple;
	bh=/lTCFoypT1j1UKBiAwaH/rJ8f1Q9aJvL45zZkVM/uwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txxDV42ayEamO/wMnL3OPC+iwg7/lCNcVLmNOGB0HfecmtvFjeZ61nXiAnskTeKDVzZKFRCyg7oN76Ivoft481huKGSMZYFR/DChbnBRo0lBPbF9Ze9UYaHUIUyh6Lt2I9zsz7pyC8VoL4Uu9sXhpKevxsJrXadm0wy+v05sMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmt6flhe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmt6flhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714793837; x=1746329837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lTCFoypT1j1UKBiAwaH/rJ8f1Q9aJvL45zZkVM/uwg=;
  b=nmt6flheJi3J7pOE6PBNQmzmjPRT3QAGzFwChp+KAjhkRX6I/yGrGahr
   894bvLXhtecZBqff7KEgSs/boAg44pjR7jJBZj4x/oZTJo6deQxUR7h52
   +cbgkiStfi/U75KzVrKzit7si8F+mVOprQSAIKU6JtSbYBu+7cC641fNd
   aF2ObFRnwC6DvIU9xFr9Y7LujtvgUTiYbnj5drj1K42S2pEwKRaoyFUyV
   uDXg/t8f2DJyw9J7siGorcFGY6DiKEwQHk6N1InR/VapwKc17C4Ah4v60
   SvHr6UHMKNxVGqdzDDeWWgl72iQ9yW8IqPe05qHmqz9/JaP5svMgVlCIQ
   w==;
X-CSE-ConnectionGUID: 3RaNIQ6sRHG8tPbEbj9kRg==
X-CSE-MsgGUID: 7EIgYen0RWSisf0qXpYGgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21295194"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="21295194"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 20:37:17 -0700
X-CSE-ConnectionGUID: EYN2J57ORy+UalXhKpU2BQ==
X-CSE-MsgGUID: tQA6Az2xTUi0pdkDQNMhqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="28212775"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 May 2024 20:37:15 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s36D2-000CPg-1O;
	Sat, 04 May 2024 03:37:12 +0000
Date: Sat, 4 May 2024 11:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 3/3] mm/internal.h:1542:38: warning:
 declaration of 'struct cgroup_taskset' will not be visible outside of this
 function
Message-ID: <202405041139.oTTInnYO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   c5d0efd9ad4acbcf666aed6e47e15d1feefa4ff0
commit: c5d0efd9ad4acbcf666aed6e47e15d1feefa4ff0 [3/3] mm: memcg: move charge migration code to memcontrol-v1.c
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240504/202405041139.oTTInnYO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041139.oTTInnYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041139.oTTInnYO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/filemap.c:51:
>> mm/internal.h:1542:38: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^
   mm/internal.h:1543:34: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^
>> mm/internal.h:1545:12: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1545 |                                 struct cftype *cft);
         |                                        ^
   mm/internal.h:1547:13: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^
   5 warnings generated.
--
   In file included from mm/page-writeback.c:20:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:40:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/page-writeback.c:43:
>> mm/internal.h:1542:38: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^
   mm/internal.h:1543:34: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^
>> mm/internal.h:1545:12: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1545 |                                 struct cftype *cft);
         |                                        ^
   mm/internal.h:1547:13: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^
   7 warnings generated.
--
   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:67:
>> mm/internal.h:1542:38: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^
   mm/internal.h:1543:34: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^
>> mm/internal.h:1545:12: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1545 |                                 struct cftype *cft);
         |                                        ^
   mm/internal.h:1547:13: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^
   mm/vmscan.c:398:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     398 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1729:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1729 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2234:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2234 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2235:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2235 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:6240:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6240 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:135:34: note: expanded from macro '__count_zid_vm_events'
     135 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   12 warnings generated.
--
   In file included from mm/shmem.c:28:
   In file included from include/linux/ramfs.h:5:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/shmem.c:86:
>> mm/internal.h:1542:38: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^
   mm/internal.h:1543:34: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^
>> mm/internal.h:1545:12: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1545 |                                 struct cftype *cft);
         |                                        ^
   mm/internal.h:1547:13: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^
   mm/shmem.c:1556:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1556 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from mm/vmstat.c:14:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmstat.c:28:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmstat.c:30:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from mm/vmstat.c:30:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from mm/vmstat.c:30:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
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
   In file included from mm/vmstat.c:32:
>> mm/internal.h:1542:38: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^
   mm/internal.h:1543:34: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^
>> mm/internal.h:1545:12: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1545 |                                 struct cftype *cft);
         |                                        ^
   mm/internal.h:1547:13: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^
   19 warnings generated.
--
   In file included from mm/mm_init.c:13:
   In file included from include/linux/memory.h:19:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/mm_init.c:17:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
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
   In file included from mm/mm_init.c:17:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
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
   In file included from mm/mm_init.c:17:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
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
   In file included from mm/mm_init.c:31:
>> mm/internal.h:1542:38: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1542 | void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
         |                                      ^
   mm/internal.h:1543:34: warning: declaration of 'struct cgroup_taskset' will not be visible outside of this function [-Wvisibility]
    1543 | int mem_cgroup_can_attach(struct cgroup_taskset *tset);
         |                                  ^
>> mm/internal.h:1545:12: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1545 |                                 struct cftype *cft);
         |                                        ^
   mm/internal.h:1547:13: warning: declaration of 'struct cftype' will not be visible outside of this function [-Wvisibility]
    1547 |                                  struct cftype *cft, u64 val);
         |                                         ^
   17 warnings generated.
..


vim +1542 mm/internal.h

  1540	
  1541	void mem_cgroup_move_task(void);
> 1542	void mem_cgroup_cancel_attach(struct cgroup_taskset *tset);
  1543	int mem_cgroup_can_attach(struct cgroup_taskset *tset);
  1544	u64 mem_cgroup_move_charge_read(struct cgroup_subsys_state *css,
> 1545					struct cftype *cft);
  1546	int mem_cgroup_move_charge_write(struct cgroup_subsys_state *css,
  1547					 struct cftype *cft, u64 val);
  1548	void __folio_memcg_unlock(struct mem_cgroup *memcg);
  1549	bool mem_cgroup_wait_acct_move(struct mem_cgroup *memcg);
  1550	void mem_cgroup_charge_statistics(struct mem_cgroup *memcg, int nr_pages);
  1551	void memcg_check_events(struct mem_cgroup *memcg, int nid);
  1552	void __maybe_unused mem_cgroup_id_get_many(struct mem_cgroup *memcg,
  1553						   unsigned int n);
  1554	void mem_cgroup_id_put_many(struct mem_cgroup *memcg, unsigned int n);
  1555	void memcg_oom_recover(struct mem_cgroup *memcg);
  1556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
