Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F0374185
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886125; cv=none; b=qEjEunSK51RqVGz10PdKb+fi6WRnayWGaFn0fp2aBukjqPfTcDOO0aJ1oZXIgsgxy5xL+6Bay1dL05bjPfAv0+XKEhfmp3K43Sc60DUv2RAhLWrHhpmhQvZqmpKEtqz60cj7YJmToAGIZD8wDDqD65PjTEq7brmwqCPasQx/8HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886125; c=relaxed/simple;
	bh=1BFUgrx2dS7QQN4yb3Vs7PnAxF5BPJWVartoYZIujNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y7RJKkzPJiosVfylOIM3sDHuSW/WiUS9fLyDZXvtsw+b/0PksLROEkmK0+II8I7jVup59WNcIAcGCNgR4DFobyow0EyhQumR3G676EA/GsyKuqv8tiqrRJ/TlSl9i8gaxYzMOiRQzh2FxCuM+Wcx9znAlWYcZtaHy8ieL3v5Kdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ao7oYibZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ao7oYibZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774886124; x=1806422124;
  h=date:from:to:cc:subject:message-id;
  bh=1BFUgrx2dS7QQN4yb3Vs7PnAxF5BPJWVartoYZIujNo=;
  b=Ao7oYibZlPim0HWu2oHl2rlr9pNmjWZ+cDbE/88fxDmTjGKuaLxGJ1Yg
   9MhXIQ8dgbODdSTqymFmbSV/UNLGfND2vCWfywIbvGIsM5yhJG7P9jkJy
   xunAEURLPOOWHThN/6LvxVKUsnsS0hx+YZsnyBjlbCI/Y1Wf89wQscwmt
   C9fdaTBg0CYejWRAlTz4TBEkzseVbDPxqBWkKtyK3DqlWF7KH0c25/AC6
   R/HJtoHqPgbeeQmQb6hdse0YCgaCMyovYrwFPZKZS+m43CuJPN+sRA7tg
   iXfn9w9lkCRshZnfZ669TbOBjLcOyc4SQju66f0uJdeTGj22i8nTnY0pL
   Q==;
X-CSE-ConnectionGUID: LYyotBeVTaO/p3ZvaTGeRQ==
X-CSE-MsgGUID: T+7O/J4vRJauKQ0oIi2hNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86575862"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86575862"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:55:21 -0700
X-CSE-ConnectionGUID: 5LFC9D6nRo6+m2R7wqWhiA==
X-CSE-MsgGUID: iTgniBCTRdSPe0jlgDP0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="219445861"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 08:55:20 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ExR-000000001Ht-3iph;
	Mon, 30 Mar 2026 15:55:17 +0000
Date: Mon, 30 Mar 2026 23:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for
 function 'rb_event_size'
Message-ID: <202603302314.xyPbT2vH-lkp@intel.com>
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
commit: 794f874404060e7e14863872950b53e6a7aa9b68 [2/2] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603302314.xyPbT2vH-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302314.xyPbT2vH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302314.xyPbT2vH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/trace.c:7:
   In file included from arch/arm64/kvm/hyp/include/nvhe/clock.h:6:
   In file included from arch/arm64/include/asm/kvm_hyp.h:11:
   In file included from include/linux/kvm_host.h:16:
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
   arch/arm64/kvm/hyp/nvhe/trace.c:134:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     134 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^
>> arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for function 'rb_event_size' [-Wmissing-prototypes]
     174 | unsigned long rb_event_size(unsigned long length)
         |               ^
   arch/arm64/kvm/hyp/nvhe/trace.c:174:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     174 | unsigned long rb_event_size(unsigned long length)
         | ^
         | static 
   7 warnings generated.


vim +/rb_event_size +174 arch/arm64/kvm/hyp/nvhe/trace.c

   173	
 > 174	unsigned long rb_event_size(unsigned long length)
   175	{
   176		struct ring_buffer_event *event;
   177	
   178		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
