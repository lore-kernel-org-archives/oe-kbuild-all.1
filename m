Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59C352935
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976323; cv=none; b=Dyd8iLpidTqI5zsTjxjli21MiaDDqDQsZ+XnCO+viZj0/d87POuiNaV9IJGpgi1WFxn1XwkpTAJLi8gBVYJ60gcePoBEqPL5fJlQR4sqc+lPQ9p2bBbHWB+CILCXe1bxYdqbZBFWvjTKwP4GXX1ak1XNs8T/0kah6HxeZpbSxA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976323; c=relaxed/simple;
	bh=H5isXo1p218kVaxPC+B2LZO5HHb1MkMpRaLsVxIy73w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cE1Nf1xswo7e+dJt80l9Z0nHzK7vu5AyL1AbQlt+4mKTowUGFh+ehp0A27yiT+ZE/WFA+MknotVrpzWl1aZbltfQQUX1x97aHNfGE/rwreZxNdO6my7JMMao89gT0N7al62mY+eAA6hjyI3DcppbWPHL3f+xxzXvoBEVTflTwSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW3HtADK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW3HtADK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765976321; x=1797512321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5isXo1p218kVaxPC+B2LZO5HHb1MkMpRaLsVxIy73w=;
  b=fW3HtADK5Ym67e32ykb1mKGMqD4Bh+EBrBygv5QUjYTvaFfwOUeiMepZ
   TYMdCaz5rugoE3sPwZMif4KXNo5BmviXnHqfRAqCy/EV7Pt433ZJjkH1I
   O5yiUTQifWBvvkDfuPhQ1zXJ3DVqii++MyyKJdvj4kCrIa/AYGRDy7RHC
   soexUHv38tCIeRQvsbnftKRpT8Yr+ZtDhtm7MiD3HnjaDeCsGVT3rs56x
   wt5Y5/ldez8BNMie6sahk0/pM30RQkk77b087MTvBPk5rYddQCbeb4yZU
   F+7z/kzESIGxuLppZPNpXkh4pLVipOMSnaTq6dj7LaMdk5H+fSWhtpeCn
   w==;
X-CSE-ConnectionGUID: rPZ5tTV5SjybMtc/xjEXyA==
X-CSE-MsgGUID: 4hlrdYW4T1K5fkmGBBP5LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78223554"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78223554"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 04:58:40 -0800
X-CSE-ConnectionGUID: 9Zvm67d2SIeLH1Tl4gu6Xg==
X-CSE-MsgGUID: ++E8QJ7iSNS30/cy3r+5dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197916619"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 04:58:38 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVr6y-000000000Yj-0U6t;
	Wed, 17 Dec 2025 12:58:36 +0000
Date: Wed, 17 Dec 2025 20:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype
 for function 'hyp_event_trace_hyp_enter'
Message-ID: <202512172034.dYSrKAJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 [2/2] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251217/202512172034.dYSrKAJq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172034.dYSrKAJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172034.dYSrKAJq-lkp@intel.com/

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
