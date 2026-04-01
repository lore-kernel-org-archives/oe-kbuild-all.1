Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA03128D7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 02:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009731; cv=none; b=rdsWLpAFeO+piE2OKlLH/dnt2L3f8Z0G2JulP2oFldo1a0gMFIo79lrl+ii1w+p+Dr1kqWFl2KQHAvFhWNVCCMQMO4j+emVr75Z22AnYEIWxxgbnwwsNd8bluU538E9bDSS0W3539TSP64opi97rRCtSNsr8aoNMxTeuGa5pXno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009731; c=relaxed/simple;
	bh=xnmvnOOnzX7zAl5KU8NCbAzqjX0xccdZ9ailFtWrVCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aRMHisTR/g/ng21zx5jSMx2xcbThe8VBaHBMNhki1HqH0iESiBZffsWAHGr9z9x071+aiDMfKqb/uMJw8zzNFlRl35vcpvtftlt36IepeCcGd9zid86FU0kDHi+TIzKoBo/3kDPRf8hphr4pIawUVXVqtfDem+KkRbuaqw7JY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sdla2xmL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sdla2xmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775009729; x=1806545729;
  h=date:from:to:cc:subject:message-id;
  bh=xnmvnOOnzX7zAl5KU8NCbAzqjX0xccdZ9ailFtWrVCM=;
  b=Sdla2xmLYybXa9HeXxK/r2dm6fldznFdiMsPNdyFINgSMKNb7fbdNcpi
   mHQaNyZVHcsGeERwdcyQ6Ob8PDl5CCaFgvZY10uAwrYVvrQgOeA6u+kb6
   9q6H4XmEFGeLlrwh3xNMecmt+DY2o9a/J5DNL8F3nkY/GLqbeAoO4a7MC
   xfm7DkxDJ/c2bFD0S1bLuZfNNZ/lhxr++Q6ArCj82/Z8y4FwQZ3CUhsQN
   zpehm1nxE7SKW/1uWZfypBKXct7vx01uEd5hsYjNf4VpGZpqTzZMSrKu9
   bALAUVhaOYcWBt5cvJUONrBlmXv4Ir372zS9U19n4Wl0eMYSq0UUU1Flv
   g==;
X-CSE-ConnectionGUID: wMwLt2u4RdSE/sjrND0URQ==
X-CSE-MsgGUID: 7z0GSBdvTliUNLNJ58m48A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86341402"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86341402"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:15:27 -0700
X-CSE-ConnectionGUID: jX3l+foVQ+usFvsXRROVeA==
X-CSE-MsgGUID: oBvefTfuQHibVE/aIqnrpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223651226"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 19:15:26 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7l75-000000004ca-2Bt8;
	Wed, 01 Apr 2026 02:15:23 +0000
Date: Wed, 01 Apr 2026 10:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp_events.c:357:5: warning: no previous prototype for
 function 'hyp_trace_init_mod_events'
Message-ID: <202604011005.wVTTG66Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cebae8e8f6b662df743cb2de67532e375b92ec50
commit: 78bed703d25530454c49f696c15ffaa7c02bfeb2 [2/2] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604011005.wVTTG66Z-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011005.wVTTG66Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011005.wVTTG66Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from arch/arm64/kvm/hyp_events.c:10:
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
   In file included from arch/arm64/kvm/hyp_events.c:10:
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
   In file included from arch/arm64/kvm/hyp_events.c:10:
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
   In file included from arch/arm64/kvm/hyp_events.c:10:
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
   arch/arm64/kvm/hyp_events.c:199:6: warning: no previous prototype for function 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     199 | bool hyp_trace_init_event_early(void)
         |      ^
   arch/arm64/kvm/hyp_events.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     199 | bool hyp_trace_init_event_early(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:249:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     249 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     249 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:323:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     323 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     323 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:345:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     345 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     345 | int hyp_trace_init_events(void)
         | ^
         | static 
>> arch/arm64/kvm/hyp_events.c:357:5: warning: no previous prototype for function 'hyp_trace_init_mod_events' [-Wmissing-prototypes]
     357 | int hyp_trace_init_mod_events(struct hyp_event *event,
         |     ^
   arch/arm64/kvm/hyp_events.c:357:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     357 | int hyp_trace_init_mod_events(struct hyp_event *event,
         | ^
         | static 
   15 warnings generated.


vim +/hyp_trace_init_mod_events +357 arch/arm64/kvm/hyp_events.c

   356	
 > 357	int hyp_trace_init_mod_events(struct hyp_event *event,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
