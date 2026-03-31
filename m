Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2A29E10F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 01:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774921297; cv=none; b=CuEoMmcxLMKenl2Evj0O+1Sdd3Q86WjKPt8SoieKlO0hwMK+6qOvQWUWLIp9f/WgQFFRdXVfaxzIvZ2h26ZMQh1W+kvWbTegkuchcZbuU6hTWLwSpnvN0hISH972fDR+IYSIEpMUN4oUSzLcTYVTsyT+hyo145ubcIWI9iSbr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774921297; c=relaxed/simple;
	bh=ejaZOBRJf9YFA3J2BJsWG36IHbQTiFRW75sSowlLYQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LYm43WBtdSL9dra1qGtH2TlpbkmfBsCyIgKms39eleXguCQPpji+nocBTg3fyBFtFNGJsE2wjVx188WIXQ4GyMaJwoUD902nomeFcFslnNb9Q6R5jXp8rRU8bkXLJRY7weI1CfsrH412z6Oikco1RFhmRgd9F5G51zSA9oswPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NILGkxJC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NILGkxJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774921296; x=1806457296;
  h=date:from:to:cc:subject:message-id;
  bh=ejaZOBRJf9YFA3J2BJsWG36IHbQTiFRW75sSowlLYQ0=;
  b=NILGkxJCVLR7Gahk6fP5VktmVYkYarLZQ7nwt2sp48sXnj42bfBJyCod
   h8Zle9gkJfwhc/tWKHr3WLWc/7+TqX/JoPWvAt30e9EtSr5vQJoJsuTs8
   Ja4jPCaA1RIM8M98Zuv/6gs4ocfmqAzqbDaN1WU2ATQnYQ0d25dN4JI9e
   2txwFt/qcXZtpwenv2Z7wdfifr8ZVLZB6PMUjku88s6LNN9spyApFu9XL
   HxzNF0eLxR1/+FuZzr9DjSOXhfyp4SLAdbEOcv/CgwMOrSz3BGpPXVz/F
   RUL5VFIxTckvF9CXLrGzJZjFq7RBp/cFZWBs87wtCRCM2oylyV4sdIdV9
   A==;
X-CSE-ConnectionGUID: Mc9Ww6UGRseJdHDq/5Y6Vw==
X-CSE-MsgGUID: n1Sv9NtcSwCSAdn71H+aYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87000383"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="87000383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 18:41:36 -0700
X-CSE-ConnectionGUID: UvUVoxX4SuuJCahPymvS5Q==
X-CSE-MsgGUID: AeveHC2URQOtp9lhH6MgDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226472927"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Mar 2026 18:41:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7O6l-000000001zX-2Ir3;
	Tue, 31 Mar 2026 01:41:31 +0000
Date: Tue, 31 Mar 2026 09:40:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for
 function 'hyp_trace_init_event_early'
Message-ID: <202603310916.EsL3yNk9-lkp@intel.com>
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
commit: 898e4d2aa33bd70705040b7c2f485c968cc3d594 [2/2] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603310916.EsL3yNk9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310916.EsL3yNk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310916.EsL3yNk9-lkp@intel.com/

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
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
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
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
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
>> arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for function 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     134 | bool hyp_trace_init_event_early(void)
         |      ^
   arch/arm64/kvm/hyp_events.c:134:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     134 | bool hyp_trace_init_event_early(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:169:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     169 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:199:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     199 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     199 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:212:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     212 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | int hyp_trace_init_events(void)
         | ^
         | static 
   11 warnings generated.


vim +/hyp_trace_init_event_early +134 arch/arm64/kvm/hyp_events.c

   133	
 > 134	bool hyp_trace_init_event_early(void)
   135	{
   136		char *token, *buf = early_events;
   137		bool enabled = false;
   138	
   139		while (true) {
   140			token = strsep(&buf, ",");
   141	
   142			if (!token)
   143				break;
   144	
   145			if (*token) {
   146				struct hyp_event *event;
   147				int ret;
   148	
   149				event = find_hyp_event(token);
   150				if (event) {
   151					ret = enable_hyp_event(event, true);
   152					if (ret)
   153						pr_warn("Couldn't enable hyp event %s:%d\n",
   154							token, ret);
   155					else
   156						enabled = true;
   157				} else {
   158					pr_warn("Couldn't find hyp event %s\n", token);
   159				}
   160			}
   161	
   162			if (buf)
   163				*(buf - 1) = ',';
   164		}
   165	
   166		return enabled;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
