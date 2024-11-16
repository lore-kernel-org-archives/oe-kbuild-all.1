Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC78BE4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731776756; cv=none; b=c0CFGStwCWm21dy/WhhtCrjtDXdUXMSi2yTLGUgDhJiidqo/Z5leTNkEhBNcOnYrCnmRqe+uz4zAhxALoW1prgrh0SLw/LTENMeSTABNPyP9B5Bxbx7sc/JXppI/jNiLzW9TOrCf9IjA8y2Rf+mms1MeMYj1cD1SDM5q4fjinlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731776756; c=relaxed/simple;
	bh=xDOs6heVHMcsWoN328/WUB+GiQUHgHaxgpiBQVF6+Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/kq3vxK7MMWquxXq0kKFzwPkRSzFauo4OfWbVhCSuSUDMjLx4pK1EXzlEj/wu/SPG3vSGyFseWfbuWcJzcbE1vFBX+5Sja2qRdHTsf/MoiDYw9z5DvCTvvJVKd2SKr3JwACDG69euhq6kLJAVBYJbP/AMCAmfUpG04xQvRpziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i52WBSoS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i52WBSoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731776754; x=1763312754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDOs6heVHMcsWoN328/WUB+GiQUHgHaxgpiBQVF6+Ho=;
  b=i52WBSoSxeJVkccfvGGe+3H9ILCz6Jk2J9+IpTJ9q5x4t0MTLcHm1Dj+
   9qhFEnBGySokJa8UAZlgJRU1o+IHvP3qImr6ovHJO6NL6gJPrS7Xjy+Iy
   TA+Z8L1Me9Biz/NvgmNMhAG+bLNQJig5kvKVI7gLheIS607WDtlP/cFXF
   /Bb5l0YsfLDIFi5jnkWmPYIco8st4o1g/Znb8K1x4VagtwzdTRRKZyyNE
   4cYDcrUxktElEov5MyWrkHyeVTjR7aTSdvOhlQIlCqjlIhgPeVYnN+ZCz
   4Lub43fOIYoUouSXXsKPlrq8+mkjNjYyh+9wjHsjMRrsr7LFfRPD+XFCc
   g==;
X-CSE-ConnectionGUID: UVFyn6r2Twactl4qaA4a3A==
X-CSE-MsgGUID: MNCBVXqqSZuAuhiJMWbafQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42298728"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42298728"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 09:05:50 -0800
X-CSE-ConnectionGUID: BJd+2RGCQ3yiLEnFYHPocw==
X-CSE-MsgGUID: NK19pxJNQI2kEiOsYUTjiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93775744"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 09:05:49 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCMF0-0000zR-2r;
	Sat, 16 Nov 2024 17:05:46 +0000
Date: Sun, 17 Nov 2024 01:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 203/328]
 arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for
 function '__hyp_trace_find_event_name'
Message-ID: <202411170154.3M9o2Q3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5a4c93e2f794001a5efa13c0dec931235240d384
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [203/328] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170154.3M9o2Q3L-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170154.3M9o2Q3L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170154.3M9o2Q3L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
   In file included from arch/arm64/include/asm/kvm_host.h:22:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:235:19: warning: no previous prototype for function '__hyp_trace_find_event_name' [-Wmissing-prototypes]
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         |                   ^
   arch/arm64/kvm/hyp_events.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | struct hyp_event *__hyp_trace_find_event_name(const char *name,
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:247:19: warning: no previous prototype for function 'hyp_trace_find_event_name' [-Wmissing-prototypes]
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         |                   ^
   arch/arm64/kvm/hyp_events.c:247:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     247 | struct hyp_event *hyp_trace_find_event_name(const char *name)
         | ^
         | static 
   6 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__hyp_trace_find_event_name +235 arch/arm64/kvm/hyp_events.c

   231	
   232	#define nr_events(__start, __stop) \
   233		(((unsigned long)__stop - (unsigned long)__start) / sizeof(*__start))
   234	
 > 235	struct hyp_event *__hyp_trace_find_event_name(const char *name,
   236						      struct hyp_event *start,
   237						      struct hyp_event *end)
   238	{
   239		for (; start < end; start++) {
   240			if (!strncmp(name, start->name, HYP_EVENT_NAME_MAX))
   241				return start;
   242		}
   243	
   244		return NULL;
   245	}
   246	
 > 247	struct hyp_event *hyp_trace_find_event_name(const char *name)
   248	{
   249		struct hyp_event_table *table;
   250		struct hyp_event *event =
   251			__hyp_trace_find_event_name(name, __hyp_events_start,
   252						    __hyp_events_end);
   253	
   254		if (event)
   255			return event;
   256	
   257		rcu_read_lock();
   258		table = rcu_dereference(mod_event_tables.tables);
   259	
   260		for (int i = 0; i < mod_event_tables.nr_tables; i++) {
   261			struct hyp_event *end = table->start + table->nr_events;
   262	
   263			event = __hyp_trace_find_event_name(name, table->start, end);
   264			if (event)
   265				break;
   266		}
   267	
   268		rcu_read_unlock();
   269	
   270		return event;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
