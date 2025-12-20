Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE652AD37
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 00:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766192129; cv=none; b=LUQUG0eRzYFZ+ACJFOg8hxOxDMadqDUxdi/BXB8DaD0pW1J9LYqCp3UeZRHU8877s1olJenwQx/wNhU4zL4/Eo9E/qy94lTidGZP3G+mPmmjyD1qE+NnSIRdwlZZbIHmzIpqqgBjetStnpgVoO47pD6FzckVaKWR2W4USApBRQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766192129; c=relaxed/simple;
	bh=98ApzdMYJJs+NTEt+RTK80vc6hviwAhX7uPoZgR4j8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NXMObRTeqE5j2+xgeRB5MWHgVFLaLK0lObi5rqiFppmfIxu1CNTvrmYd1N5RXY4alwR1fwbKG8QxqP2dX9aqzCtmMaoQ++KYjiyUlci6kPLkRVh35k+mwOgWsW4hfiCzIgoEF04s7q+5wbfU8+Hz1W1q5LvYfeFnfGO1KnQwEJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2QOyjz4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2QOyjz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766192126; x=1797728126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98ApzdMYJJs+NTEt+RTK80vc6hviwAhX7uPoZgR4j8E=;
  b=M2QOyjz47dJdwOHES8I/rcYPu38yzVeQL+Nu3AJfj9zGE9oEwGThgXTr
   lQChuRHlRTCtV5bfSCNuCzFF2RgoflcUlEWf4US/d/Ih5Ctg0QffVg/vz
   GlTVN6I5QS7uMyHgkZ0rcidZHsv2iujUX+n2rSkl9suZ8YMhHaU/fmeS8
   XaDLkwQWR++BeVtzpkUW4gpNMXDzY5RvOYIQobPTvAGJ4cbCNx+EvS8zo
   8ezRQ15GeBWgcY6i5jxit6y0KFkjKGzYadGi+dgmJ44G2ygSr3rM7fw5S
   hnP+0hlxm+TCdjOuN+EvJD2YiyelX8sNAIs7R2r608+fQV3IfkyqUB/Q6
   A==;
X-CSE-ConnectionGUID: cPg6un+hTDOhRkBAfelPfA==
X-CSE-MsgGUID: sd85Oji5T3Sh8b6BlZu5JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="67349841"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="67349841"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 16:55:25 -0800
X-CSE-ConnectionGUID: h94d9VUdRDCEAOsigePnKg==
X-CSE-MsgGUID: /5q2cFZTRHKw9ODYn6sNig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="203146878"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Dec 2025 16:55:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWlFi-0000000049d-12ht;
	Sat, 20 Dec 2025 00:55:22 +0000
Date: Sat, 20 Dec 2025 08:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1:
 warning: no previous prototype for function 'hyp_event_trace_filtered_smc'
Message-ID: <202512200852.2k8E91x1-lkp@intel.com>
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
commit: eea6841a3b9606ed64907c77030b1d50ebdd56fe [2/2] ANDROID: misc: pkvm_smc: Trace denied SMCs.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512200852.2k8E91x1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200852.2k8E91x1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200852.2k8E91x1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:10:
   In file included from arch/arm64/include/asm/kvm_pkvm_module.h:6:
   In file included from arch/arm64/include/asm/kvm_pgtable.h:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2191:
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
   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:13:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: warning: no previous prototype for function 'hyp_event_trace_filtered_smc' [-Wmissing-prototypes]
       9 | HYP_EVENT(filtered_smc,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:126:1: note: expanded from here
     126 | hyp_event_trace_filtered_smc
         | ^
   arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   6 warnings generated.


vim +/hyp_event_trace_filtered_smc +9 arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h

     8	
   > 9	HYP_EVENT(filtered_smc,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
