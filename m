Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F99324B2A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355552; cv=none; b=sSyyAVPDbh7OqcpTDqH8DsXKkkwOCrs+2jjDgKw4Anz/df3kAcix8BUxgpt+7v5Lqy2KUiCUIDSGvaWuml4tcdQidGNF0ITPdtEwNHzwQzRPJWLNOQzZxkk5xvX5Tx5KNhb3nVyI/kixkZVo+FOc9u0t6KJz/K0gr4Y+VodM1cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355552; c=relaxed/simple;
	bh=rw8Sr6daw7QIHKu+kxMj3wLdjfU+CTFxigELbUnxDAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oZEbfgIqOt5HcUr/mOMHe9z7wADtP6nTLJ6sV03hV66yYlz9NJVCqY55g+AAtaE3fk8ofhH0fr02JJMCQP+d+13+pS1JwqfytHW/hTiv0BOXISiX71kDg76AXG1Pz4S++2soxKZT8Hef7JZTgmV0ZyiIUOYSGFaHcCrg7uD+8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNlvyPBQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNlvyPBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769355552; x=1800891552;
  h=date:from:to:cc:subject:message-id;
  bh=rw8Sr6daw7QIHKu+kxMj3wLdjfU+CTFxigELbUnxDAI=;
  b=RNlvyPBQwqB6OBZVMEMZYZNwijM7Ad2lqNpzCSvWZ9XJDphF72lOJ6rn
   VYz311ZFqsHm31oDZTTvYxNxBf5VQ1E+1tyNrlazyR/5BXzZv3xANIFQB
   Qb99K4JEtLO9Xl2XyEJDLUu6B/qBSrLdIJgTwYWx/A8ArlZzxHDeYl5ZB
   snL2hmkfQ/g19bELSCIduA2LbEYemUHNHaOiJ6gdqGtamYgzev9jaDdLf
   APgPjQz4JiTh7UKO4w3+h28y/82v8nkhfGpxee2+BJqPlZ0pcYzysBSoL
   QPFM5saCumkNGWjRVVB7ntvYyPQg4/yW5XNjuf5WpNowYy//4K5LY2Nl6
   g==;
X-CSE-ConnectionGUID: Dr98gK+hTymM01TsruMw5g==
X-CSE-MsgGUID: bjIWgNoTRKWn47ixH3CC+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87962626"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="87962626"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 07:39:11 -0800
X-CSE-ConnectionGUID: hPlukEMKR823ec8C7CCyFw==
X-CSE-MsgGUID: jNns1bzkT8qErbL0PdccaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207079814"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jan 2026 07:39:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk2Cg-00000000W6w-24Sd;
	Sun, 25 Jan 2026 15:39:06 +0000
Date: Sun, 25 Jan 2026 23:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 95/95]
 arch/x86/xen/enlighten_pv.c:650:24: warning: no previous prototype for
 function 'xen_pv_evtchn_do_upcall'
Message-ID: <202601252328.huCJn8oI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   f32d30ba0d3898356d1a193eea42a9cbdeb348ba
commit: 67d749f3e3516c7343ea6c7fdd38fd3dbfa05936 [95/95] x86/xen: Move Xen upcall handler
config: x86_64-buildonly-randconfig-001-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252328.huCJn8oI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252328.huCJn8oI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252328.huCJn8oI-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/x86/xen/enlighten_pv.c:650:24: warning: no previous prototype for function 'xen_pv_evtchn_do_upcall' [-Wmissing-prototypes]
     650 | __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
         |                        ^
   arch/x86/xen/enlighten_pv.c:650:19: note: declare 'static' if the function is not intended to be used outside of this translation unit
     650 | __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
         |                   ^
         |                   static 
   arch/x86/xen/enlighten_pv.c:1301:34: warning: no previous prototype for function 'xen_start_kernel' [-Wmissing-prototypes]
    1301 | asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
         |                                  ^
   arch/x86/xen/enlighten_pv.c:1301:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1301 | asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
         |                      ^
         |                      static 
   2 warnings generated.


vim +/xen_pv_evtchn_do_upcall +650 arch/x86/xen/enlighten_pv.c

   649	
 > 650	__visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
   651	{
   652		irqentry_state_t state = irqentry_enter(regs);
   653		bool inhcall;
   654	
   655		instrumentation_begin();
   656		run_sysvec_on_irqstack_cond(__xen_pv_evtchn_do_upcall, regs);
   657	
   658		inhcall = get_and_clear_inhcall();
   659		if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
   660			irqentry_exit_cond_resched();
   661			instrumentation_end();
   662			restore_inhcall(inhcall);
   663		} else {
   664			instrumentation_end();
   665			irqentry_exit(regs, state);
   666		}
   667	}
   668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
