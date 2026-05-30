Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499252F0C45
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 03:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780113317; cv=none; b=UDpFqEgPP48TCrFtRvRTDZ4aq1E6GYzmKje5IOFMsOir6gQVqe0uDrCbZNv3r1Hx0tAwqgFlihGmLHRqL8zJouTJQI053owQBz7bQe+cvdCaOc0PgjyjFzH42juicpxJ7UZNOZD2bp01EJ04jXFBoe6FYcETo/wFfEVqct2aq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780113317; c=relaxed/simple;
	bh=X3ABSEvCMxjkZzM8KEzEoY5qZd/hZRcYT8cVCVejwKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GlBbPRU94GF7CzeZ0MTrQwkA92PFN8nMmDl0z4KAjuSu50xvapqo/K9HqG+ZVdAsCmpvf3HJFPFHdl80G0H6r9HdNa/xjeo7RaGt/jx7P1jq0ipsV7SxdTQetayDJoZcE4J3HYkNuPipuxaqyD+/5D2lxryJNQHdI/UNRje5SOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2SEIlS2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2SEIlS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780113316; x=1811649316;
  h=date:from:to:cc:subject:message-id;
  bh=X3ABSEvCMxjkZzM8KEzEoY5qZd/hZRcYT8cVCVejwKE=;
  b=J2SEIlS2lNEzxgQGH6pQgYIqb3u4uAiNEiqjDpVAGJ1a9ubjS2fuMj5F
   ufNJ+rTuu2vQTZrtDAUoqDeE784tXEQcLFOuq/ThTzca06RyRj02S30Co
   Rin+K7akYm5dTmNWU7KCT/bvwZ0j6TihLp5wxKI21fZMF8LhkONUCnFC2
   IZSRZNA4rrT+hPc99vGx0lc5OfUBlRJEUUg0mNvE42o9J4tJBZlQfQjhR
   L13IrtB4MdEXR4F4t7Cgxqai3uI7D78LkGOZ+mV74uLAClrghurSV04hx
   /H/Jc+8LlXKaxmkqsv9rw1v3tqQyiPI3713ZKJhPHTgLF6NJ3Gtv5ckDB
   w==;
X-CSE-ConnectionGUID: zVCP/06nR4qCxaWeqKZwtg==
X-CSE-MsgGUID: UAjb/XFzSgy5slHAIaF4DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80691314"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="80691314"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 20:55:15 -0700
X-CSE-ConnectionGUID: ICddFmc2S1+2jx2UnwHFzQ==
X-CSE-MsgGUID: z3l7eOFERgGZU8Hbc4nIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247296955"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 May 2026 20:55:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTAn1-0000000085O-00b5;
	Sat, 30 May 2026 03:55:11 +0000
Date: Sat, 30 May 2026 11:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 16/62]
 include/linux/kvm_host.h:1023:68: error: 'struct kvm_vcpu' has no member
 named 'srcu_depth'
Message-ID: <202605301131.dBYJ1dIh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: 4be7559caa1d9c7436c368cf89fee7d28d0559a9 [16/62] kvm: Move VCPU locking to struct kvm_vcpu_common
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605301131.dBYJ1dIh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301131.dBYJ1dIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301131.dBYJ1dIh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from arch/mips/include/asm/cmpxchg.h:11,
                    from arch/mips/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:14:
   include/linux/kvm_host.h: In function 'kvm_vcpu_srcu_read_lock':
>> include/linux/kvm_host.h:1023:68: error: 'struct kvm_vcpu' has no member named 'srcu_depth'
    1023 |                   "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
         |                                                                    ^~
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:185:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1022:9: note: in expansion of macro 'WARN_ONCE'
    1022 |         WARN_ONCE(vcpu->common->srcu_depth++,
         |         ^~~~~~~~~
   include/linux/kvm_host.h: In function 'kvm_vcpu_srcu_read_unlock':
   include/linux/kvm_host.h:1034:70: error: 'struct kvm_vcpu' has no member named 'srcu_depth'
    1034 |                   "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
         |                                                                      ^~
   include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/asm-generic/bug.h:185:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |         ^~~~~~~~~~~~~~~
   include/linux/kvm_host.h:1033:9: note: in expansion of macro 'WARN_ONCE'
    1033 |         WARN_ONCE(--vcpu->common->srcu_depth,
         |         ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1023 include/linux/kvm_host.h

8d5df887c3504a Joerg Roedel        2026-03-04  1018  
2031f2876896d8 Sean Christopherson 2022-04-15  1019  static inline void kvm_vcpu_srcu_read_lock(struct kvm_vcpu *vcpu)
2031f2876896d8 Sean Christopherson 2022-04-15  1020  {
2031f2876896d8 Sean Christopherson 2022-04-15  1021  #ifdef CONFIG_PROVE_RCU
4be7559caa1d9c Joerg Roedel        2026-03-04  1022  	WARN_ONCE(vcpu->common->srcu_depth++,
2031f2876896d8 Sean Christopherson 2022-04-15 @1023  		  "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
2031f2876896d8 Sean Christopherson 2022-04-15  1024  #endif
4be7559caa1d9c Joerg Roedel        2026-03-04  1025  	vcpu->common->____srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
2031f2876896d8 Sean Christopherson 2022-04-15  1026  }
2031f2876896d8 Sean Christopherson 2022-04-15  1027  

:::::: The code at line 1023 was first introduced by commit
:::::: 2031f2876896d82aca7e82f84accd9181b9587fb KVM: Add helpers to wrap vcpu->srcu_idx and yell if it's abused

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
