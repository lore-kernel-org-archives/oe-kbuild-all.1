Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A80F13774D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Oct 2025 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759574587; cv=none; b=FK2ZLQcQ1qVQNLmACQ+JORaGqNGqT4lc1ePxzoHS7pdE9q3K+cA9ZeZMS8L1GU1R+eRM1AZmFc1thGO50EiWorP48hLqF+XyIBn0viQxwjbCPPZ/xINbAQCTf4rLa4XE2ZtiIp7VuEtd76EKTWWQl31m30I3b3hgbxLyz12NNzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759574587; c=relaxed/simple;
	bh=ZVlQkCaHDufpfMZEhdCSTwC/huN3oIihJjRtYKMbfbY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p89J/5eiEXOkCzm4PBK2aeSkMZqCD+G2Io18BOPX+mhs4MEHNWJUcY2XhuEn0mewQo61v7gSs4+KHR7Z1tXpdgm7XA48rYsKBxw0ndH6WNDPgCLViJPGJRnOnkNNWAq4WjnKztYcU9F3Ykz2gimHXwky8XdNh+Rr0m4Ii7FwWfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfDa4aLr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfDa4aLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759574584; x=1791110584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVlQkCaHDufpfMZEhdCSTwC/huN3oIihJjRtYKMbfbY=;
  b=hfDa4aLrBw2le1HLLUs+AYEB98VwtrjABJdc0ZK65wwDlCe2Qp9VQp+7
   frM2VHiV1bPAnVw8HhcC+fOerz8EUjQbK6hhblXBaBGfGUhGrwyrZLhHH
   972zeejevAZKQyQ6NPhQpm9UX2eiR9NOG6JDAnd9JQLOzwZqWsoVxkhuH
   TMesgbDN4nvQarwWJa+IBk6F4HCL8V73OGp0xGNnl7QTHe5cJKhrBlrc3
   ORyyzoYG4RqHNxGmlAe+EFd127FhwxT/a224OpnSbChCXyGUEn+GySAdE
   VjoQ86lwzK1VviEXUIEStitZYVXNK8Y3yC2teGpFmE0Tj64uGSAkOWTx7
   g==;
X-CSE-ConnectionGUID: NThC+HUvS4y68v/Fya+Meg==
X-CSE-MsgGUID: RrHmmQJHQwGyQE7D3DiotQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="73262457"
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; 
   d="scan'208";a="73262457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2025 03:43:04 -0700
X-CSE-ConnectionGUID: kH02L0mTQXeFAs12tzPH/g==
X-CSE-MsgGUID: scLKnoFoT8m8wrvoKjoWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; 
   d="scan'208";a="216586956"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Oct 2025 03:43:02 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4zjA-0005Dz-1V;
	Sat, 04 Oct 2025 10:43:00 +0000
Date: Sat, 4 Oct 2025 18:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.17/prjc 574/583] kernel/sched/alt_core.c:1466:39: error:
 'struct thread_info' has no member named 'cpu'
Message-ID: <202510041831.RpEVULjC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.17/prjc
head:   e901d7e18045fc771c34a9c19af59305b838071b
commit: 408e2859c2cc3905b06666e854c1e10325301780 [574/583] sched/smp/alt: Make SMP unconditional
config: x86_64-buildonly-randconfig-001-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041831.RpEVULjC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510041831.RpEVULjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510041831.RpEVULjC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/sched/alt_core.c: In function '__set_task_cpu':
>> kernel/sched/alt_core.c:1466:39: error: 'struct thread_info' has no member named 'cpu'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |                                       ^~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1466:9: note: in expansion of macro 'WRITE_ONCE'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |         ^~~~~~~~~~
>> kernel/sched/alt_core.c:1466:39: error: 'struct thread_info' has no member named 'cpu'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |                                       ^~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1466:9: note: in expansion of macro 'WRITE_ONCE'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |         ^~~~~~~~~~
>> kernel/sched/alt_core.c:1466:39: error: 'struct thread_info' has no member named 'cpu'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |                                       ^~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1466:9: note: in expansion of macro 'WRITE_ONCE'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |         ^~~~~~~~~~
>> kernel/sched/alt_core.c:1466:39: error: 'struct thread_info' has no member named 'cpu'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |                                       ^~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1466:9: note: in expansion of macro 'WRITE_ONCE'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |         ^~~~~~~~~~
>> kernel/sched/alt_core.c:1466:39: error: 'struct thread_info' has no member named 'cpu'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |                                       ^~
   include/linux/compiler_types.h:552:23: note: in definition of macro '__compiletime_assert'
     552 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:60:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      60 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1466:9: note: in expansion of macro 'WRITE_ONCE'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |         ^~~~~~~~~~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
>> kernel/sched/alt_core.c:1466:39: error: 'struct thread_info' has no member named 'cpu'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |                                       ^~
   include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                           ^
   kernel/sched/alt_core.c:1466:9: note: in expansion of macro 'WRITE_ONCE'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |         ^~~~~~~~~~
>> kernel/sched/alt_core.c:1466:39: error: 'struct thread_info' has no member named 'cpu'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |                                       ^~
   include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                  ^
   kernel/sched/alt_core.c:1466:9: note: in expansion of macro 'WRITE_ONCE'
    1466 |         WRITE_ONCE(task_thread_info(p)->cpu, cpu);
         |         ^~~~~~~~~~
   kernel/sched/alt_core.c: At top level:
>> kernel/sched/alt_core.c:1469:6: error: redefinition of 'set_task_cpu'
    1469 | void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
         |      ^~~~~~~~~~~~
   In file included from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:15:
   include/linux/sched.h:2263:20: note: previous definition of 'set_task_cpu' with type 'void(struct task_struct *, unsigned int)'
    2263 | static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
         |                    ^~~~~~~~~~~~


vim +1466 kernel/sched/alt_core.c

ffc3f73cc688cd Alfred Chen 2019-08-19  1456  
ffc3f73cc688cd Alfred Chen 2019-08-19  1457  static inline void __set_task_cpu(struct task_struct *p, unsigned int cpu)
ffc3f73cc688cd Alfred Chen 2019-08-19  1458  {
ffc3f73cc688cd Alfred Chen 2019-08-19  1459  	/*
ffc3f73cc688cd Alfred Chen 2019-08-19  1460  	 * After ->cpu is set up to a new value, task_access_lock(p, ...) can be
ffc3f73cc688cd Alfred Chen 2019-08-19  1461  	 * successfully executed on another CPU. We must ensure that updates of
ffc3f73cc688cd Alfred Chen 2019-08-19  1462  	 * per-task data have been completed by this moment.
ffc3f73cc688cd Alfred Chen 2019-08-19  1463  	 */
ffc3f73cc688cd Alfred Chen 2019-08-19  1464  	smp_wmb();
ffc3f73cc688cd Alfred Chen 2019-08-19  1465  
ffc3f73cc688cd Alfred Chen 2019-08-19 @1466  	WRITE_ONCE(task_thread_info(p)->cpu, cpu);
ffc3f73cc688cd Alfred Chen 2019-08-19  1467  }
ffc3f73cc688cd Alfred Chen 2019-08-19  1468  
ffc3f73cc688cd Alfred Chen 2019-08-19 @1469  void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
ffc3f73cc688cd Alfred Chen 2019-08-19  1470  {
4ae83feabb2dcf Alfred Chen 2021-08-11  1471  	unsigned int state = READ_ONCE(p->__state);
4ae83feabb2dcf Alfred Chen 2021-08-11  1472  
ffc3f73cc688cd Alfred Chen 2019-08-19  1473  	/*
ffc3f73cc688cd Alfred Chen 2019-08-19  1474  	 * We should never call set_task_cpu() on a blocked task,
ffc3f73cc688cd Alfred Chen 2019-08-19  1475  	 * ttwu() will sort out the placement.
ffc3f73cc688cd Alfred Chen 2019-08-19  1476  	 */
4ae83feabb2dcf Alfred Chen 2021-08-11  1477  	WARN_ON_ONCE(state != TASK_RUNNING && state != TASK_WAKING && !p->on_rq);
4ae83feabb2dcf Alfred Chen 2021-08-11  1478  

:::::: The code at line 1466 was first introduced by commit
:::::: ffc3f73cc688cd9e7aaff0d1dc8201b5f29e9503 Project C v5.7.5-r2

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
