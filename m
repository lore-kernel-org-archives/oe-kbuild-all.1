Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0E239A809
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 19:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900362; cv=none; b=gD601LxmvCQKX5VIw5jmwl4XfVkSp9ddZo8EVB2MB6Qlxpa6LW2SsLfb+n8NU8+m2KCToJWaDO2B7gV/D9zG7nUC8m6AO8DZJ0leB1cars36aos8D80n6ApI1opnwRUXx3sv1bX/1UemwKSXjq94vS3j1MtJxvHbRTfXyhN63fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900362; c=relaxed/simple;
	bh=GBhXzRePQyJYelRNp+XRTStgT4dkyqHLp4URm/bmSIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eMgcX8xXQqBMpHUd/V+u1wZt1ijQ3sNyDoxErVlgPZalntFejHbxNQ4b0uTHu9500TxeyPqETQGF/isXNTCFwW+DicYq2MfqrBw+BP6cC9/svN74Y/SZhV+ZKih13z6rpxM1XmCaVem6Fz7JB/mDjbtEN78n3mnzdYYGY6JIjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/51j0jE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/51j0jE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774900360; x=1806436360;
  h=date:from:to:cc:subject:message-id;
  bh=GBhXzRePQyJYelRNp+XRTStgT4dkyqHLp4URm/bmSIQ=;
  b=m/51j0jEQg5iMeOpB8b9Urv1U1otQC6x0zvvb/W+NhxwvvNISaZLp7jH
   AA12xveA2rXU0T3rvtAmUXyBGXe6vVrOjm4i3X62HESIDAfnBb4/8d0zq
   c8jIjTge5pe6Op6bXm3t5BAD4vNrwZYUfaJF6eMB4B9Ig+lB0b+bOIoq5
   ksHmIabqwenvA1hZ4eVTBegxNP5+BF5ieZ/a4wne1/Mo/9u6tSv07GHpQ
   vuPYVjYCO8A9au8gD8DatpnNwVebXJhdD1mdi0HV/0czwzSj5EH85m8Te
   boEM++VWtGOzgCd3xzqplp88NFiTftQ6CSK5HDKULg72++QTjvy7GIPN6
   Q==;
X-CSE-ConnectionGUID: 8Y26OuM7SZaaafsxRXI2tQ==
X-CSE-MsgGUID: ZAakAahaRvm0wQsU9kXHaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86204811"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86204811"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 12:52:39 -0700
X-CSE-ConnectionGUID: NI2NdD2zSPesv1sCu5E7lQ==
X-CSE-MsgGUID: QMIJmdFTSWqyRrXA41J4Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="221285774"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2026 12:52:38 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7If5-000000001cF-3l7Z;
	Mon, 30 Mar 2026 19:52:35 +0000
Date: Tue, 31 Mar 2026 03:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype
 for function 'hyp_event_trace_hyp_enter'
Message-ID: <202603310328.QONbptad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5fdbbd61a3cbdca7ac1034dc16723bdbc7ece8cc
commit: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 [2/2] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603310328.QONbptad-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310328.QONbptad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310328.QONbptad-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:8:
   In file included from arch/arm64/include/asm/kvm_host.h:22:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2168:
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
   In file included from arch/arm64/kvm/hyp_events.c:9:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:91:1: note: expanded from here
      91 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:9:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:96:1: note: expanded from here
      96 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
>> arch/arm64/kvm/hyp_events.c:100:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     100 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:130:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     130 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:130:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     130 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:143:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     143 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     143 | int hyp_trace_init_events(void)
         | ^
         | static 
   10 warnings generated.


vim +/hyp_event_trace_hyp_enter +14 arch/arm64/include/asm/kvm_hypevents.h

     9	
    10	/*
    11	 * Hypervisor events definitions.
    12	 */
    13	
  > 14	HYP_EVENT(hyp_enter,
    15		HE_PROTO(void),
    16		HE_STRUCT(
    17		),
    18		HE_ASSIGN(
    19		),
    20		HE_PRINTK(" ")
    21	);
    22	
  > 23	HYP_EVENT(hyp_exit,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
