Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4071E515
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 04:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721278276; cv=none; b=DTVGi6e65fuIh3MBTaR7OIle+syITA0NEM+mNvxIM7J3Dcgr2TOYkG9fRQ5ITXCNbs+LhZZHj0xpgD8Pj9JmPbXfQpgIF38nOl9THYQqR4K06wWgcqIyPzAPoe24JGJzQe6T9PRI7NnxKmzrb5BTzxRnEVsGATiXh4roHwNO3Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721278276; c=relaxed/simple;
	bh=VtkK72H8UVKVM0iOKYZsAoGSZUCFsL2i0bZsnDP+QIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlLhERsv89xjlYjMxvGVJM7eWSu9BrEHWtQItJrLnbH/wrXrdzJXL/askhy2iR6kvWQOGoZ+79UUBnAVvyxqpFKs24iRzfynKfRUAU2CQnfXFBIyiSxO6zPGi/R5DT1Ut5FY/mrlUK5wqWRZHmBgVxVpfggLrvUACS8vSBZUD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhpZEmdF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhpZEmdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721278275; x=1752814275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VtkK72H8UVKVM0iOKYZsAoGSZUCFsL2i0bZsnDP+QIU=;
  b=VhpZEmdFjt1d5cb5q0KY/DIvzdCM6OTJzO1rxb8T737AQLqRhtmEFhze
   iQiXCBJroHCERRD6xWnRrYnD8Ff27cei9vN2/YakIgzkMIUBs0ukXkmbO
   E+vPxupvkaXzMFyO/rJz8XVde9D3WLJZFOHPcTrpDRCdv5ZI2lCdlr0K4
   TLCvchIMpHn/wFpP7AK8M8cDj1PqOtKhYHbuGBdvidrluxSMaBBl8lZKz
   x+4M4aw19/Xv2adnE5xEVkpQrc7gBJmhYTnHhqloiToEter5gHMBPTJKk
   KPPk/pUw724tJi9lqtGATW3h+vfz+5zr07gIHUyenWEMK5rAZ5mzYV0Ez
   A==;
X-CSE-ConnectionGUID: e1kAIlC/R8yeWh3ul/tIgA==
X-CSE-MsgGUID: QKpUIBpQRE6xxl01H9EKRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18516186"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="18516186"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 21:51:14 -0700
X-CSE-ConnectionGUID: v95qOT2qQsqJ63a33j2/QA==
X-CSE-MsgGUID: Fl9BSns9SzSzD4y2/W9zRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="54812189"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2024 21:51:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUJ6k-000gxy-2h;
	Thu, 18 Jul 2024 04:51:10 +0000
Date: Thu, 18 Jul 2024 12:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6] mm/page_counter.c:95:11: error:
 invalid operands to binary expression ('long' and 'void')
Message-ID: <202407181213.54XpNZsu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   c857fcebb4972e5493e7614c9fbcceceb016d5c6
commit: a8f2d92c5560e579201e8043df06af4b22e28e9b [4/6] mm: memcg: merge multiple page_counters into a single structure
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407181213.54XpNZsu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181213.54XpNZsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181213.54XpNZsu-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:82:24: error: use of undeclared identifier 'MMU_PAGE_COUNT'
      82 |         unsigned long failcnt[MCT_NR_ITEMS];
         |                               ^
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:82:24: error: use of undeclared identifier 'MMU_PAGE_COUNT'
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:90:21: error: use of undeclared identifier 'MMU_PAGE_COUNT'
      90 |         unsigned long high[MCT_NR_ITEMS];
         |                            ^
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:90:21: error: use of undeclared identifier 'MMU_PAGE_COUNT'
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:91:20: error: use of undeclared identifier 'MMU_PAGE_COUNT'
      91 |         unsigned long max[MCT_NR_ITEMS];
         |                           ^
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:91:20: error: use of undeclared identifier 'MMU_PAGE_COUNT'
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:111:18: error: use of undeclared identifier 'MMU_PAGE_COUNT'
     111 |         for (i = 0; i < MCT_NR_ITEMS; i++) {
         |                         ^
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
   In file included from mm/page_counter.c:8:
   include/linux/page_counter.h:111:18: error: use of undeclared identifier 'MMU_PAGE_COUNT'
   include/linux/page_counter.h:58:46: note: expanded from macro 'MCT_NR_ITEMS'
      58 | #define MCT_NR_ITEMS MAX(MCT_NR_MEMCG_ITEMS, MCT_NR_HUGETLB_ITEMS)
         |                                              ^
   include/linux/page_counter.h:25:30: note: expanded from macro 'MCT_NR_HUGETLB_ITEMS'
      25 | #define MCT_NR_HUGETLB_ITEMS HUGE_MAX_HSTATE
         |                              ^
   arch/powerpc/include/asm/page.h:41:27: note: expanded from macro 'HUGE_MAX_HSTATE'
      41 | #define HUGE_MAX_HSTATE         (MMU_PAGE_COUNT-1)
         |                                  ^
>> mm/page_counter.c:95:11: error: invalid operands to binary expression ('long' and 'void')
      95 |                 if (new > READ_ONCE(c->watermark[idx]))
         |                     ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_counter.c:152:11: error: invalid operands to binary expression ('long' and 'void')
     152 |                 if (new > READ_ONCE(c->watermark[idx]))
         |                     ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_counter.c:213:9: error: variable has incomplete type 'typeof (({
       typeof (*(<recovery-expr>())) _x_ = <recovery-expr>((nr_pages));
   }))' (aka 'void')
     213 |                 old = xchg(&counter->max[idx], nr_pages);
         |                       ^
   include/linux/atomic/atomic-instrumented.h:4758:2: note: expanded from macro 'xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:15:2: note: expanded from macro 'raw_xchg'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^
   include/linux/atomic.h:73:29: note: expanded from macro '__atomic_op_fence'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                                    ^
   15 errors generated.
--
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:177:10: note: expanded from macro '_SIG_SET_OP'
     177 |         case 2: set->sig[1] = op(set->sig[1]);                          \
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     198 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     211 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     242 |         case 2: set->sig[1] = 0;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     255 |         case 2: set->sig[1] = -1;
         |                 ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2221:
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
   In file included from mm/memcontrol.c:29:
>> include/linux/memcontrol.h:600:7: error: assigning to 'unsigned long' from incompatible type 'void'
     600 |         *min = READ_ONCE(memcg->memory.emin);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/memcontrol.h:601:7: error: assigning to 'unsigned long' from incompatible type 'void'
     601 |         *low = READ_ONCE(memcg->memory.elow);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memcontrol.c:54:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   In file included from mm/memcontrol.c:65:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:65:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
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
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:65:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                             ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:65:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
         |                                                            ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:65:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:458:22: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                             ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:65:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:45:
   In file included from include/uapi/linux/neighbour.h:6:
   In file included from include/linux/netlink.h:9:
   In file included from include/net/scm.h:13:
   In file included from include/net/compat.h:8:
   include/linux/compat.h:458:10: warning: array index 3 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:42: warning: array index 2 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                 ^     ~
   include/linux/compat.h:130:2: note: array 'sig' declared here
     130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
         |         ^
   include/linux/compat.h:458:53: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     458 |         case 2: v.sig[3] = (set->sig[1] >> 32); v.sig[2] = set->sig[1];
         |                                                            ^        ~
   arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
      18 |         unsigned long sig[_NSIG_WORDS];
         |         ^
>> mm/memcontrol.c:1315:8: error: assigning to 'unsigned long' from incompatible type 'void'
    1315 |         limit = READ_ONCE(memcg->memory.max[MCT_MEM]);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:1321:9: error: assigning to 'unsigned long' from incompatible type 'void'
    1321 |                 limit = READ_ONCE(memcg->memory.max[MCT_MEMSW]);
         |                       ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:1529:10: error: operand of type 'void' where arithmetic or pointer type is required
    1529 |                 K((u64)READ_ONCE(memcg->memory.max[MCT_MEM])),
         |                 ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:534:34: note: expanded from macro 'pr_info'
     534 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   include/linux/printk.h:461:60: note: expanded from macro 'printk'
     461 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:433:19: note: expanded from macro 'printk_index_wrap'
     433 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
   mm/internal.h:423:16: note: expanded from macro 'K'
     423 | #define K(x) ((x) << (PAGE_SHIFT-10))
         |                ^
   mm/memcontrol.c:1535:11: error: operand of type 'void' where arithmetic or pointer type is required
    1535 |                         K((u64)READ_ONCE(memcg->memory.max[MCT_SWAP])),
         |                         ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:534:34: note: expanded from macro 'pr_info'
     534 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~
   include/linux/printk.h:461:60: note: expanded from macro 'printk'
     461 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:433:19: note: expanded from macro 'printk_index_wrap'
     433 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
   mm/internal.h:423:16: note: expanded from macro 'K'
     423 | #define K(x) ((x) << (PAGE_SHIFT-10))
         |                ^
>> mm/memcontrol.c:1563:16: error: initializing 'unsigned long' with an expression of incompatible type 'void'
    1563 |         unsigned long max = READ_ONCE(memcg->memory.max[MCT_MEM]);
         |                       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   68 warnings and 20 errors generated.


vim +95 mm/page_counter.c

    70	
    71	/**
    72	 * page_counter_charge - hierarchically charge pages
    73	 * @counter: counter
    74	 * @idx: page counter id
    75	 * @nr_pages: number of pages to charge
    76	 *
    77	 * NOTE: This does not consider any configured counter limits.
    78	 */
    79	void page_counter_charge(struct page_counter *counter, unsigned long idx,
    80				 unsigned long nr_pages)
    81	{
    82		struct page_counter *c;
    83		bool protection = track_protection(counter, idx);
    84	
    85		for (c = counter; c; c = c->parent) {
    86			long new;
    87	
    88			new = atomic_long_add_return(nr_pages, &c->usage[idx]);
    89			if (protection)
    90				propagate_protected_usage(c, new);
    91			/*
    92			 * This is indeed racy, but we can live with some
    93			 * inaccuracy in the watermark.
    94			 */
  > 95			if (new > READ_ONCE(c->watermark[idx]))
    96				WRITE_ONCE(c->watermark[idx], new);
    97		}
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
