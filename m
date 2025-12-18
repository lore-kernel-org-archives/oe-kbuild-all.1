Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1189523B638
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766093197; cv=none; b=MpHt+VIGE0Y203xnmT29xv8qtN808jryeqWMrHUcgLTy5VLC24QBAqgeSxxh393mXQ6F2h1fxZ7Ci3EY2h7oBgTr6+SU0SwaJ1NVs9t+PXCMyGES7ONjtnL0eXmZmm2rmQ9DFthfJcpEAZj8pS3FAIU3dD1xdDLs6MUFddJrnKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766093197; c=relaxed/simple;
	bh=RE52kT0onfdP0/MXBWwRc4AMk3KB6YeKjxj1oCvoaQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QXzFATVTEccNI0aUPUmy6dSjGrEILv3p+doJZbdE37545/QkB+kUedacDWcjiuj4xNmOI7kZNjPQY0w7Ci29f6mZuXWaCCGTsIa2joAmp2M/Pemonecsa4p/fBwUQBu92gAggnEinKLXP8NhUUzbCIWPJI5ZitagLrxC/kEEtEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fX/QvEmD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fX/QvEmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766093193; x=1797629193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RE52kT0onfdP0/MXBWwRc4AMk3KB6YeKjxj1oCvoaQs=;
  b=fX/QvEmDj3nn+uNQS6O/Of0ZJtq0CtMprBXYR6N7mo1kwkRVnwdJ4OSJ
   7Ok3QLIvas2ac02wZdHwejfjlvu6wp/FcOGwb/w8anSuCcVGRxrBTb6kA
   q+ec2Fbwr7BLFtiC59rsj5kJrRSoQHBFJdCG1ldpRxdhzMizszBFcsbep
   ROymYJe6ky0JhS/Cpeg6eNHa5uaVUl2tPTRNiT7puz5ZvPPD6UVBlLPkE
   tiY1ewzSmbQTvFZ5TB4pblqj4GA8f+0wInSw6pMH/HvyM7uJFXrsSG5XK
   5sadSUOwBl9k3naMFqupY7LSfMifcW15ZB6mF+BkkB5f5DMqBJbZnx3L/
   w==;
X-CSE-ConnectionGUID: dEfxZOj4RKiLSJCW4ZZ95Q==
X-CSE-MsgGUID: GDG9a+oeTmSbfBT9PCB4kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67950213"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67950213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 13:26:32 -0800
X-CSE-ConnectionGUID: Z7jMeCMfQIWShvY41YQUQA==
X-CSE-MsgGUID: IFEj5FvyR9G28eXlkBEftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203093737"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 13:26:31 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWLW0-000000002fx-2XC5;
	Thu, 18 Dec 2025 21:26:28 +0000
Date: Fri, 19 Dec 2025 05:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:75:1: warning: no previous prototype
 for function 'hyp_event_trace___hyp_printk'
Message-ID: <202512190548.7imRFtzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   16aa689262af24cd0897f463b3d0dd9ecee6b37c
commit: 35cb80a22a73eff43226ffd5e13406de2167a216 [2/2] ANDROID: KVM: arm64: trace_hyp_printk()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512190548.7imRFtzI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190548.7imRFtzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190548.7imRFtzI-lkp@intel.com/

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
