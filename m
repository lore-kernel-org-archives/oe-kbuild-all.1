Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5BD3264F4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750215; cv=none; b=VLf7cXhieWY/ER7VQ/+VNeR8bJ41fxi/XJae3/HtG1L+ayFsWKJNJvEiqmrnnJRUFAO8BGBjCazVpNB0Q4RUAICcjyggxbBaJsTx99aouDPgdsw5yIpwsUxi1h941tvxkrBlvC1iD9zgFQUMFA7dvXl4veMxIh9pKHdFFjLrNFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750215; c=relaxed/simple;
	bh=Hm+k6CCIWVVNF7nkJK2LxoHLjpU04QYdXC17B2sHjCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ue0V2tyYkjt2yQpqv6Ejrd3V9KTaXQqI1/BY/ru5eeikxSUeLeoLBvveCCNg8Vjoxb3YTTLXTJRIzHNyahnPGL3pgW8fMX2KzGZw+hiQljTEGapKYdPX+KpCedolJFshSei4bl+Hv1/9IC9mtz5NFGdgPDWavyCbt0VoLENnVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMW6vl2X; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMW6vl2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783750213; x=1815286213;
  h=date:from:to:cc:subject:message-id;
  bh=Hm+k6CCIWVVNF7nkJK2LxoHLjpU04QYdXC17B2sHjCA=;
  b=PMW6vl2XNBQYS226KACmtTW9rQoD8HlbAKk2vVoLcVzg0RBMxuZ4Gk3X
   tFfDNGtNyBhiDb6VJwWfVDPMF2+dMGAaL0SKGuVDf7TdqKvDINlxKkj4u
   MLdnOiblcbMzBqY3Nw3EkDFTCyXQCuBA8nh+uUR/l3NR2jORjBZpRxFfS
   w52dh2Kp7x0W13mIrd4qJmp8hAV9qve3+/028lW0vjXyWXUtND8im7Pr/
   ji8F7QcDBXmipxZ1Y7DbKFHRfUPmtNi4vvf+/7nedRQDmp8s304YrJzRk
   8r+z8SIm/FMV49tsPVkCMRjEsXzrUKUvoClj4dyawpmEKeDIly/J2LGM2
   Q==;
X-CSE-ConnectionGUID: nmkXhGERT7iHd4GwTEEhDw==
X-CSE-MsgGUID: 0SY+UC43Sn+ZATXFrBWngg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71964246"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71964246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 23:10:12 -0700
X-CSE-ConnectionGUID: Ego9bicsSHyvfJPR1p9j+g==
X-CSE-MsgGUID: wFwFdniKSjKLTE33/3kUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258943262"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2026 23:10:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiQud-00000000Jo6-3MD7;
	Sat, 11 Jul 2026 06:10:07 +0000
Date: Sat, 11 Jul 2026 14:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [powerpc:fixes-test 10/12] kernel/sched/core.c:7449:1:
 error: parameter names (without types) in function declaration
Message-ID: <202607111437.4PFwCibd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
head:   afc2830892a128a13a65f677271a0a48aeb61b5e
commit: 4747e17fe063720a30b1c0075bae3e8f8acd26f4 [10/12] powerpc/32: Use HAVE_PREEMPT_DYNAMIC_CALL instead of HAVE_PREEMPT_DYNAMIC_KEY
config: powerpc-mvme5100_defconfig (https://download.01.org/0day-ci/archive/20260711/202607111437.4PFwCibd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111437.4PFwCibd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111437.4PFwCibd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:16:
   include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7449:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Wimplicit-int]
   kernel/sched/core.c:7449:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:7449:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
    7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7522:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7522 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Wimplicit-int]
   kernel/sched/core.c:7522:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7522 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7522:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
    7522 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7769:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7769 | EXPORT_STATIC_CALL_TRAMP(cond_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Wimplicit-int]
   kernel/sched/core.c:7769:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7769 | EXPORT_STATIC_CALL_TRAMP(cond_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7769:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
    7769 | EXPORT_STATIC_CALL_TRAMP(cond_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7774:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7774 | EXPORT_STATIC_CALL_TRAMP(might_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Wimplicit-int]
   kernel/sched/core.c:7774:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7774 | EXPORT_STATIC_CALL_TRAMP(might_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7774:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
    7774 | EXPORT_STATIC_CALL_TRAMP(might_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +7449 kernel/sched/core.c

009f60e2763568 Oleg Nesterov          2014-10-05  7441  
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7442) #ifdef CONFIG_PREEMPT_DYNAMIC
b7ebb758568b60 Ingo Molnar            2025-05-28  7443  # ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
8a69fe0be143b0 Mark Rutland           2022-02-14  7444  #  ifndef preempt_schedule_dynamic_enabled
8a69fe0be143b0 Mark Rutland           2022-02-14  7445  #   define preempt_schedule_dynamic_enabled	preempt_schedule
8a69fe0be143b0 Mark Rutland           2022-02-14  7446  #   define preempt_schedule_dynamic_disabled	NULL
8a69fe0be143b0 Mark Rutland           2022-02-14  7447  #  endif
8a69fe0be143b0 Mark Rutland           2022-02-14  7448  DEFINE_STATIC_CALL(preempt_schedule, preempt_schedule_dynamic_enabled);
ef72661e28c64a Peter Zijlstra         2021-01-25 @7449  EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7450  # elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
99cf983cc8bca4 Mark Rutland           2022-02-14  7451  static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7452  void __sched notrace dynamic_preempt_schedule(void)
99cf983cc8bca4 Mark Rutland           2022-02-14  7453  {
99cf983cc8bca4 Mark Rutland           2022-02-14  7454  	if (!static_branch_unlikely(&sk_dynamic_preempt_schedule))
99cf983cc8bca4 Mark Rutland           2022-02-14  7455  		return;
99cf983cc8bca4 Mark Rutland           2022-02-14  7456  	preempt_schedule();
99cf983cc8bca4 Mark Rutland           2022-02-14  7457  }
99cf983cc8bca4 Mark Rutland           2022-02-14  7458  NOKPROBE_SYMBOL(dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7459  EXPORT_SYMBOL(dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7460  # endif
b7ebb758568b60 Ingo Molnar            2025-05-28  7461  #endif /* CONFIG_PREEMPT_DYNAMIC */
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7462) 

:::::: The code at line 7449 was first introduced by commit
:::::: ef72661e28c64ad610f89acc2832ec67b27ba438 sched: Harden PREEMPT_DYNAMIC

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
