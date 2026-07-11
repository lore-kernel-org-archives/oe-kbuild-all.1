Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5DD2EEE89
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 01:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783734826; cv=none; b=Jmw1nGhLN7KFIAT1AQl0Kx6zbc4PpT+5OmBLwNoR+eLQU6dXxq7KXO48Rzqtv0ahuR8XNftkfGjCLCvWX9Ttyt/kM53cMA9DpkCoGWu4wPq79CeZx7kHDy/O1d0gf/zj7wQbl2B+0FSwtHeD0I9nG61VWQny86/qbUZg2NXDtwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783734826; c=relaxed/simple;
	bh=Xih0NB+jFhynOeXHiBrDWRNbJpLGlJUSCR00d/KRWR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SMjRzz7VPW/Hz69QUD8DhwD2ZygOvsddLUEvaNtV5gkg7V0n6RaEuX5uwdWhe1HIzA8VVwO6sMpZzKXGuzJLNbq9lb7VLpAd8DOC0x+bGGvx/JVinPf08tCQr//FudB4NchubM8Xt7x1Yw5qdR0FF31KxRii0+kaUuvPKlWMLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkjxnxAp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkjxnxAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783734825; x=1815270825;
  h=date:from:to:cc:subject:message-id;
  bh=Xih0NB+jFhynOeXHiBrDWRNbJpLGlJUSCR00d/KRWR0=;
  b=DkjxnxApKhkzqBtckTLIKBEd8dT+ynOxgIX5xuhMruq4oawwq4Uw4au4
   oXP0liIwE/HBHBDCYtYWVH6cEjf6x/yyrHP4ePi9KZugYUpT4GnCEc/m9
   I4SayRGRrwyhKlroXztSP3sRa774+w5e1mQs0q6vOa5JBq2LPD6nQIThm
   +eFKbxqbe7EZOHETaFTQxBGqCqkbXFMlEmkWbu55IZz0n8eFIosRdz+RO
   ietqV6a5yBRK4dcE7qXkRgRvYmNcZzjS93V+jGLeLmMU6OnbQpGNG0JAs
   zp/5fGkS+liQsHSkYA2lTxFtqa9kGlW75mijRhyDWg97mGgut2SRh6vKK
   g==;
X-CSE-ConnectionGUID: zFowSBgsR3ySYcPB1udFVg==
X-CSE-MsgGUID: OBYRXK2bSTO/2vFhmrqjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71956491"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71956491"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 18:53:41 -0700
X-CSE-ConnectionGUID: uLB3+yjaTvKR1wLSLP/A+A==
X-CSE-MsgGUID: dHg1WxDZQ9yZ2AnDWwcZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259929405"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2026 18:53:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiMuO-00000000JcI-1v6c;
	Sat, 11 Jul 2026 01:53:36 +0000
Date: Sat, 11 Jul 2026 09:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [powerpc:fixes-test 10/12]
 include/linux/static_call.h:223:9: warning: data definition has no type or
 storage class
Message-ID: <202607110847.u4TL0RJC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
head:   afc2830892a128a13a65f677271a0a48aeb61b5e
commit: 4747e17fe063720a30b1c0075bae3e8f8acd26f4 [10/12] powerpc/32: Use HAVE_PREEMPT_DYNAMIC_CALL instead of HAVE_PREEMPT_DYNAMIC_KEY
config: powerpc-randconfig-001-20260711 (https://download.01.org/0day-ci/archive/20260711/202607110847.u4TL0RJC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110847.u4TL0RJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110847.u4TL0RJC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:16:
>> include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7449:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Werror=implicit-int]
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7449:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:7449:1: warning: parameter names (without types) in function declaration
   In file included from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:16:
>> include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7522:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7522 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Werror=implicit-int]
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7522:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7522 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7522:1: warning: parameter names (without types) in function declaration
   In file included from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:16:
>> include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7769:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7769 | EXPORT_STATIC_CALL_TRAMP(cond_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Werror=implicit-int]
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7769:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7769 | EXPORT_STATIC_CALL_TRAMP(cond_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7769:1: warning: parameter names (without types) in function declaration
   In file included from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:16:
>> include/linux/static_call.h:223:9: warning: data definition has no type or storage class
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7774:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7774 | EXPORT_STATIC_CALL_TRAMP(might_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:223:9: error: type defaults to 'int' in declaration of 'ARCH_ADD_TRAMP_KEY' [-Werror=implicit-int]
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7774:1: note: in expansion of macro 'EXPORT_STATIC_CALL_TRAMP'
    7774 | EXPORT_STATIC_CALL_TRAMP(might_resched);
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:7774:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +223 include/linux/static_call.h

9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  212  
9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  213  #define EXPORT_STATIC_CALL(name)					\
9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  214  	EXPORT_SYMBOL(STATIC_CALL_KEY(name));				\
9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  215  	EXPORT_SYMBOL(STATIC_CALL_TRAMP(name))
9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  216  #define EXPORT_STATIC_CALL_GPL(name)					\
9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  217  	EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));			\
9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  218  	EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
9183c3f9ed710a8 Josh Poimboeuf 2020-08-18  219  
73f44fe19d35963 Josh Poimboeuf 2021-01-27  220  /* Leave the key unexported, so modules can't change static call targets: */
73f44fe19d35963 Josh Poimboeuf 2021-01-27  221  #define EXPORT_STATIC_CALL_TRAMP(name)					\
73f44fe19d35963 Josh Poimboeuf 2021-01-27  222  	EXPORT_SYMBOL(STATIC_CALL_TRAMP(name));				\
73f44fe19d35963 Josh Poimboeuf 2021-01-27 @223  	ARCH_ADD_TRAMP_KEY(name)
73f44fe19d35963 Josh Poimboeuf 2021-01-27  224  #define EXPORT_STATIC_CALL_TRAMP_GPL(name)				\
73f44fe19d35963 Josh Poimboeuf 2021-01-27  225  	EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name));			\
73f44fe19d35963 Josh Poimboeuf 2021-01-27  226  	ARCH_ADD_TRAMP_KEY(name)
73f44fe19d35963 Josh Poimboeuf 2021-01-27  227  

:::::: The code at line 223 was first introduced by commit
:::::: 73f44fe19d359635a607e8e8daa0da4001c1cfc2 static_call: Allow module use without exposing static_call_key

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
