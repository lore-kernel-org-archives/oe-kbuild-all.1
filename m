Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA96B12D778
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711547740; cv=none; b=fmUCIdwEyKtKYVkpXFuNw2tmrWRq6m0jnNDWMdnNCdgI8lhkgg9shRmJ9NXCLAJf5Aby+A6W41iqf1pWxr9JSRDx7VgYAGL+XX/C1nA6wt5nlQZnPHWLbcoFHL8Cfh2OYi/7FY/sBgwJL4TnqGo5y5JyTaf51HZxQflIBR3X614=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711547740; c=relaxed/simple;
	bh=l7RNtYATIW/KlYSp187oC8/l1iCTUOXWmBZwWKFQEBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HeDHBqgrf1+uTpmsiBAUxFveBjaMZbQC7RAC6RSH1SPzPVyc3D/bOEfhAzm8+5eu86eHWo0RXsFhZHj+dhKW1voOuGfyNujLjZ+OZIgZAyHpUsUYOp1SG1+kT2OCEqrGr42J4bgIfu/0bqRr+FRKDJrt8aJflEcfiD6pcZT/ttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIQL/+eL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIQL/+eL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711547738; x=1743083738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l7RNtYATIW/KlYSp187oC8/l1iCTUOXWmBZwWKFQEBc=;
  b=cIQL/+eLLN1MleQtBqiCwjusWv0/zvYebPJdbloGJSnI4S0+LNEPUT/K
   tuxQZmMaf+4sY7ItJMsFWFPlhB4QmNkP9mzcFza2pk6zXWWZ/F0crqHWR
   m3CB5qykWX3PkAAiBkxw+12D/12Q5HteyX4DIq4N/0STntaUtGg70nEIV
   kJ26tV/lnp9njvSSGBl80GnzJIeqy2uc5bCPiCP14xBlmK6Hs221IJ940
   BPfow3JSuPZCWA/FEwS3TttcVH6PdpxikFX35J+x04yg7N57GAdhZ4l0s
   GYi0sN78IfuUWJVz017woNqwRLSIg+793rxJnmXQBhP4CTM+UUYMQwdiT
   Q==;
X-CSE-ConnectionGUID: 0XyHB2w8SECxVUjyJalSyw==
X-CSE-MsgGUID: 0SszM9zxQg2Xfr9PKH1rsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6837363"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6837363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 06:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="20957952"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2024 06:55:26 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpTkS-00015i-0S;
	Wed, 27 Mar 2024 13:55:24 +0000
Date: Wed, 27 Mar 2024 21:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 2/14]
 arch/arm64/kvm/hyp_events.c:357:5: warning: no previous prototype for
 function 'hyp_trace_init_mod_events'
Message-ID: <202403272104.D4nqi5je-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   3930d879e38c97b7777efd6be4ba7f99aa32e4da
commit: ea75c0835c8fcd34d65b62f6299bf8bdc7744740 [2/14] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240327/202403272104.D4nqi5je-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403272104.D4nqi5je-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403272104.D4nqi5je-lkp@intel.com/

All warnings (new ones prefixed by >>):

      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:110:1: note: expanded from here
     110 | hyp_event_trace_hyp_enter
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
   <scratch space>:115:1: note: expanded from here
     115 | hyp_event_trace_hyp_exit
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
   <scratch space>:120:1: note: expanded from here
     120 | hyp_event_trace_host_hcall
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
   <scratch space>:125:1: note: expanded from here
     125 | hyp_event_trace_host_smc
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
   <scratch space>:130:1: note: expanded from here
     130 | hyp_event_trace_host_mem_abort
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
