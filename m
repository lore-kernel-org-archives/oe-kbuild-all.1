Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29A7352008
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348957; cv=none; b=o+kVpI1ZptYuP6yP2mvk397SoBB55tLODRSkGI6q8a6GNDSrOaPRfvby1GAbj+Fb1UeqNtFuE+xvibjkoQlKhlSQMnFz2RNFvPSbhYLD4BphfZok/3KzFWcJ5mGi4qiqZsF+EQj4mt5oAdlD5Hnz+cJ4xMFaD4rn3BlRqU8G7uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348957; c=relaxed/simple;
	bh=mpbeUr0ndskysJi0swa5dNpzP2wNz5A//MgKqqoBwBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cw7WOlGPZLZKSGdHFXvRfR4bfQlOsEc/dwRpNoKTlD+k8IcIhZBsxVWq4dWD6YFNzWPwQH5DSc6DczfxPLNtkkAvk+YKTqFOt96sJyYLfzgBIb3l8HwjnRdgwP89M9iMlgOUVhyUEthNaYlDFOXNtza7jU1GLyw8ZaA1AGO/e6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYrMp40Y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYrMp40Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787348955; x=1818884955;
  h=date:from:to:cc:subject:message-id;
  bh=mpbeUr0ndskysJi0swa5dNpzP2wNz5A//MgKqqoBwBY=;
  b=DYrMp40YD0fQdwS8DNQmI37i8P5uYMHZN1Nk9P9B0JpgzuyYQO88wCNL
   EK+lrgYs9jxAq4LvWH12421b3NEeGRb1f0o1NqMU3uQKJwt7fF17KoL/k
   0D8qqjoOBG4mcs5EA2PsBYDAFhxq5Wb+Z89fwLcQyl8LVGxgV7adZ7YAO
   QX7EIZs16uEJRTEWTeMKSesTT1u0mJ640u1JKt5RDdnMCRk/o0SxxFDrc
   /3521BRjGbnx2LTx/J50mchTUAaFW6HOcb+VFX/QInCeaKE9fo6/HrZtG
   xmXyMRUyfkGU/v4SmHSuy/u7FRBK0xoA7LCJtNBdykZMk50tokEhZ/paG
   A==;
X-CSE-ConnectionGUID: wDhAKlKRRgqQLN/nOKohHw==
X-CSE-MsgGUID: Ba3J0/SXR16yN63nwPVffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="113441186"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="113441186"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:49:12 -0700
X-CSE-ConnectionGUID: EkvgDv9ORUyEzBC9ZDfUfg==
X-CSE-MsgGUID: a9/hsZLLQ669ZjXHf11Q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="264685473"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2026 14:49:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxX6q-00000000qVJ-3z76;
	Fri, 21 Aug 2026 21:49:08 +0000
Date: Sat, 22 Aug 2026 05:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/8]
 arch/x86/xen/enlighten_pv.c:650:24: warning: no previous prototype for
 function 'xen_pv_evtchn_do_upcall'
Message-ID: <202608220519.3LglqRHS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Brian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   9fd3e1d56be51348e5fa5a1633a82a3e82987954
commit: 67d749f3e3516c7343ea6c7fdd38fd3dbfa05936 [0/8] x86/xen: Move Xen upcall handler
config: x86_64-randconfig-004-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220519.3LglqRHS-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220519.3LglqRHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220519.3LglqRHS-lkp@intel.com/

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
