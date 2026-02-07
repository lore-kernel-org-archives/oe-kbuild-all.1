Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33F1482E8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 20:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770494877; cv=none; b=hnjVuuXnzTPtJtjiEuQo797bu+4gCuaOEmnWjZcBHmQQFEP/kxprxiqkcAOuT60UuSxkg6fuTvffYj3OnVOpWTqVwg8fZFxt5X66s6AHPoy+Hrl/6knQSf5oGW6SyWLwmJObHl6LX1TaDJpF2+oPwvM67c8SPSfFuedEjLHTcnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770494877; c=relaxed/simple;
	bh=gLXAlQJ58HDzlX0ypM3ULMt75EhTzH5Axd00wD0j+gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iDMLD8bEaaCcOZtPOqyFiK7z7JO0A7dgZckiQXYODDKdjiF+Lo2c1OLoH4v8DVMzESC+8ypNkIDCGV+vD6ptBo6DjDv/aX15RR9j9VyScZwa6X3/bszmmseok5TZ1p61GGaQeU0B9De1BG2pS8XRJQfE4l7NheaCWi/vTerOVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzLbPzHq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzLbPzHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770494877; x=1802030877;
  h=date:from:to:cc:subject:message-id;
  bh=gLXAlQJ58HDzlX0ypM3ULMt75EhTzH5Axd00wD0j+gk=;
  b=BzLbPzHqBvsSgJ0XD7ko7m2mqI/Sf2iyyzROoN4RZ6chqlAwyniFnX+Z
   /8DN7v/Z+N0KGqzqSAld/XT/nVe6dO40rV+H/MSKUbypa/x269H+4c8FN
   cPwGH9H+gPLSBdf6dByDzlK4PnxPNSrC/AYM4+W+dDj6ikCtefWhCPKEN
   AhbsMhYCgsP15sNKUISlBwbCleAWnTPzeSVMau0kXEvgBJHwibp0vfnQd
   erRJ1o+KSf/VrDBxSL0zy6GUvcPYm99cQ/CmOdBGp6fjoRBg6fBnYra0P
   7aCoObnxaaK37c0EyxYIht5ZoUxwfTE+ACKN3mWRKJxbQ3Q6w0CYmjiPB
   A==;
X-CSE-ConnectionGUID: RVhHiklNTjOhZbvxdXFxWg==
X-CSE-MsgGUID: 7acXmbc8Ql2Di96GOOeGJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="71705041"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="71705041"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 12:07:57 -0800
X-CSE-ConnectionGUID: nxYnkLfjSAq/P9ouHpcekA==
X-CSE-MsgGUID: DAVMzS4hR5e53dLf825Uug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="234136367"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2026 12:07:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vooav-00000000lrY-0bpk;
	Sat, 07 Feb 2026 20:07:53 +0000
Date: Sun, 08 Feb 2026 04:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 56/56]
 include/linux/static_call_types.h:45:34: error: too few arguments to function
 '__SCT__kvm_x86_topup_external_cache'
Message-ID: <202602080320.K3DTPHwF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   c86be62d601ede14cbad1d0fb5af9b67d4172342
commit: c86be62d601ede14cbad1d0fb5af9b67d4172342 [56/56] FIXUPS
config: i386-randconfig-013-20260207 (https://download.01.org/0day-ci/archive/20260208/202602080320.K3DTPHwF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602080320.K3DTPHwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602080320.K3DTPHwF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:34,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from arch/x86/include/asm/tlbbatch.h:5,
                    from include/linux/mm_types_task.h:17,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:19:
   arch/x86/kvm/mmu/mmu.c: In function 'mmu_topup_memory_caches':
>> include/linux/static_call_types.h:45:34: error: too few arguments to function '__SCT__kvm_x86_topup_external_cache'
      45 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:76:33: note: in expansion of macro '__raw_static_call'
      76 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:92:33: note: in expansion of macro '__static_call'
      92 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/include/asm/kvm_host.h:2002:28: note: in expansion of macro 'static_call'
    2002 | #define kvm_x86_call(func) static_call(kvm_x86_##func)
         |                            ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:609:21: note: in expansion of macro 'kvm_x86_call'
     609 |                 r = kvm_x86_call(topup_external_cache)(vcpu->kvm, vcpu);
         |                     ^~~~~~~~~~~~


vim +/__SCT__kvm_x86_topup_external_cache +45 include/linux/static_call_types.h

880cfed3a012d7 Peter Zijlstra 2021-01-18  44  
73f44fe19d3596 Josh Poimboeuf 2021-01-27 @45  #define __raw_static_call(name)	(&STATIC_CALL_TRAMP(name))
73f44fe19d3596 Josh Poimboeuf 2021-01-27  46  

:::::: The code at line 45 was first introduced by commit
:::::: 73f44fe19d359635a607e8e8daa0da4001c1cfc2 static_call: Allow module use without exposing static_call_key

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
