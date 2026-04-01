Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B632D0EE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025399; cv=none; b=jiJLGun8w+xi9YvXW3xiZuTd3UatgTgURaGqNUmgMuuyVvIe2MDKNgIDOi3oQIwKNNzUdE1EbkWzba83sdrFa1de2EC43mC4fOnJt0VK8dDG/u7q2ZtdyKHLmlg0y9LY7J2YPTn79YmvoBUoyLLbELrulDM5LVyg1yymMMdFa0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025399; c=relaxed/simple;
	bh=9iP8iNeQylLUgrDcqXGO085wntIHSol7SpyQMXpQW1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JpiJt4iFiyeeUyWbf87GUsmK61tGFsb63H+LCAhfacnGyXlxEvyreGZAIxaXhL8jgF6Wb4baR9OnJs/PQXiwi1A5UbMEKlL5MdEFzjy46U76ulgt80rAk4Z/51YGpsCkanDnCQeGUgTx80fGP3ynVc3+n7+LnKn5fduxlEGIwAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaUBU9gN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaUBU9gN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775025397; x=1806561397;
  h=date:from:to:cc:subject:message-id;
  bh=9iP8iNeQylLUgrDcqXGO085wntIHSol7SpyQMXpQW1w=;
  b=UaUBU9gN8Bbz9rhwKzhRfx7VmnQ7OXBwM91lveU/0EOaWYFfEx7jLWQV
   XZFRIJG5XnbnvlxuG1w642/BmcH58nKNGrCR0LrN0TA/zs6SXhPlw8oPD
   O3Ex7I79zkTLb4LWNwYX7DlFM81jDLHh/leqEQWvVv5YnLwFVnfFHp6sz
   7vHuik/I9BPRnFbTG9DU8VfiiERrNN74lswmdxH41K15TmVIOBXk5Zs9l
   Ng8CoyfRofHQV/IWrdsue/w4xIJhiIiHKyXfZKKP65osNgYkWYmJKHdFu
   8RVXwufpGNlagJD8QUPRedPErScfFpbl6z3qRmWf1QLM+1PO5Ilcr02f0
   Q==;
X-CSE-ConnectionGUID: KqSxXxGET4mabepf+LK2nw==
X-CSE-MsgGUID: +06xZC7oSG6vSUu3VjArsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75768186"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75768186"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:36:37 -0700
X-CSE-ConnectionGUID: E/ucTZh2QH6DnVTgW0/dFw==
X-CSE-MsgGUID: tKUNaaaxT5KKwV9BgXQxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231385155"
Received: from lkp-server01.sh.intel.com (HELO 699e4e600a11) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2026 23:36:34 -0700
Received: from kbuild by 699e4e600a11 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7pBo-0000000002l-1XOx;
	Wed, 01 Apr 2026 06:36:32 +0000
Date: Wed, 01 Apr 2026 14:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:75:1: warning: no previous prototype
 for function 'hyp_event_trace___hyp_printk'
Message-ID: <202604011432.36rYulmo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ce5b4e244a9fd35566b8e44e12a938b63923fcec
commit: 35cb80a22a73eff43226ffd5e13406de2167a216 [2/2] ANDROID: KVM: arm64: trace_hyp_printk()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604011432.36rYulmo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011432.36rYulmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011432.36rYulmo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:111:1: note: expanded from here
     111 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:116:1: note: expanded from here
     116 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:32:1: warning: no previous prototype for function 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      32 | HYP_EVENT(host_hcall,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:121:1: note: expanded from here
     121 | hyp_event_trace_host_hcall
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:46:1: warning: no previous prototype for function 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      46 | HYP_EVENT(host_smc,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:126:1: note: expanded from here
     126 | hyp_event_trace_host_smc
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:61:1: warning: no previous prototype for function 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      61 | HYP_EVENT(host_mem_abort,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:131:1: note: expanded from here
     131 | hyp_event_trace_host_mem_abort
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/kvm_hypevents.h:75:1: warning: no previous prototype for function 'hyp_event_trace___hyp_printk' [-Wmissing-prototypes]
      75 | HYP_EVENT(__hyp_printk,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:136:1: note: expanded from here
     136 | hyp_event_trace___hyp_printk
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   arch/arm64/kvm/hyp_events.c:215:6: warning: no previous prototype for function 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     215 | bool hyp_trace_init_event_early(void)
         |      ^
   arch/arm64/kvm/hyp_events.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     215 | bool hyp_trace_init_event_early(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:265:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     265 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:265:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     265 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:339:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     339 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     339 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:361:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     361 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     361 | int hyp_trace_init_events(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:378:5: warning: no previous prototype for function 'hyp_trace_init_mod_events' [-Wmissing-prototypes]
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         |     ^
   arch/arm64/kvm/hyp_events.c:378:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         | ^
         | static 
   16 warnings generated.


vim +/hyp_event_trace___hyp_printk +75 arch/arm64/include/asm/kvm_hypevents.h

    59	
    60	
  > 61	HYP_EVENT(host_mem_abort,
    62		HE_PROTO(u64 esr, u64 addr),
    63		HE_STRUCT(
    64			he_field(u64, esr)
    65			he_field(u64, addr)
    66		),
    67		HE_ASSIGN(
    68			__entry->esr = esr;
    69			__entry->addr = addr;
    70		),
    71		HE_PRINTK("esr=0x%llx addr=0x%llx",
    72			  __entry->esr, __entry->addr)
    73	);
    74	
  > 75	HYP_EVENT(__hyp_printk,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
