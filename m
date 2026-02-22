Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735C535950
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 10:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771757201; cv=none; b=ak8BxSnVW3poS8mJobPnap/cfRZo0nkIoaHEm8umAF0ax2Ra2IiCUhRiFIqO04CnWcqTtPxl3Yea3GnFvXYcNTNJv1L6SjVxESfEhuHa1+oJrQJRZW66lbpVBY7oxXnE7Bh/Fp7Q4Wpcgrx7mI7PYZ6NLuJbr7iBcMZn0FrzkJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771757201; c=relaxed/simple;
	bh=FNWI0Nh7t0BV5DxkTfzedGmZ0V1KGnv0MoatWECR/Nk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wua5tQ4NzLd46AGj7lObkMfOXqsjiA4H96VuNwFChghvRn7tzyoaRQZgcRmZQ7QCYsRoDHo4bYa7459y/QEngMjo2ZIrUvHaWgQoSsU5HkxjAEHrYATP9lXGhXg3LE615fUB7GQ0nOcxoO/2nB9KFrKxqUvj+1JrA56oacUupMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXeAW6a6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXeAW6a6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771757199; x=1803293199;
  h=date:from:to:cc:subject:message-id;
  bh=FNWI0Nh7t0BV5DxkTfzedGmZ0V1KGnv0MoatWECR/Nk=;
  b=fXeAW6a6aSQjKr+pSNSwcvbvUpl0w08oqrLtCWVnnScEmRrf080QpBPC
   zyubv5icsQNR2Bixj3SlJRM2EFtQi1GH8exrIOVGvh8119uR7pd6npMnN
   7b3A4kyTjTyUAHqWJGeLL0ni4ZQ5MImaOjJ+WaDan2ftZ2rG5Fz5nMPhb
   ZqGTyUuNVbkSLqDmD9y8EzrRbOUx4ivZakTC/p57hvBLIjvY9dy7taVmr
   xQZxnwiXfDCVwXqX1C9Xi+JC4l2EureU+1ngCjUTh/aSGBOVKvIaQMYAU
   usjA2Jxbr7Q01d0Da9EYWFcKD9uYf9A6wPxwXhO+MrfHs44uMh91GRXuk
   w==;
X-CSE-ConnectionGUID: RMsPkLS8QE6by+Kh/yYVAA==
X-CSE-MsgGUID: agCcBsRERoaUx387ZWt3bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="90189895"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="90189895"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 02:46:38 -0800
X-CSE-ConnectionGUID: e9fuoKY4RrW6ZEx8VNOavQ==
X-CSE-MsgGUID: 7r7KwXfCTV67WcPwKaekQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="215130467"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2026 02:46:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu6yx-000000015RG-1676;
	Sun, 22 Feb 2026 10:46:35 +0000
Date: Sun, 22 Feb 2026 18:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 50/60]
 mm/oom_kill.c:105:42: error: 'const struct task_struct' has no member named
 'mems_allowed'
Message-ID: <202602221831.OPD7IJKL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 7b2c19807170d073133786c42666d796c42f7d70 [50/60] mm/oom: NP_OPS_OOM_ELIGIBLE - private node OOM participation
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260222/202602221831.OPD7IJKL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221831.OPD7IJKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221831.OPD7IJKL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/oom.h:6,
                    from mm/oom_kill.c:21:
   mm/oom_kill.c: In function 'oom_mems_intersect':
>> mm/oom_kill.c:105:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:105:22: note: in expansion of macro 'node_isset'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                      ^~~~~~~~~~
>> mm/oom_kill.c:105:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:45:23: note: in definition of macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:105:22: note: in expansion of macro 'node_isset'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                      ^~~~~~~~~~
>> mm/oom_kill.c:105:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:46:57: note: in definition of macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:105:22: note: in expansion of macro 'node_isset'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                      ^~~~~~~~~~
>> mm/oom_kill.c:105:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:105:22: note: in expansion of macro 'node_isset'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                      ^~~~~~~~~~
>> mm/oom_kill.c:105:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:105:22: note: in expansion of macro 'node_isset'
     105 |                 if (!node_isset(nid, tsk1->mems_allowed))
         |                      ^~~~~~~~~~
   mm/oom_kill.c:107:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:44:44: note: in definition of macro 'bitop'
      44 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:107:22: note: in expansion of macro 'node_isset'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                      ^~~~~~~~~~
   mm/oom_kill.c:107:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:45:23: note: in definition of macro 'bitop'
      45 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:107:22: note: in expansion of macro 'node_isset'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                      ^~~~~~~~~~
   mm/oom_kill.c:107:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:46:57: note: in definition of macro 'bitop'
      46 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:107:22: note: in expansion of macro 'node_isset'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                      ^~~~~~~~~~
   mm/oom_kill.c:107:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:47:24: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:107:22: note: in expansion of macro 'node_isset'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                      ^~~~~~~~~~
   mm/oom_kill.c:107:42: error: 'const struct task_struct' has no member named 'mems_allowed'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                                          ^~
   include/linux/bitops.h:47:39: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   include/linux/nodemask.h:149:36: note: in expansion of macro 'test_bit'
     149 | #define node_isset(node, nodemask) test_bit((node), (nodemask).bits)
         |                                    ^~~~~~~~
   mm/oom_kill.c:107:22: note: in expansion of macro 'node_isset'
     107 |                 if (!node_isset(nid, tsk2->mems_allowed))
         |                      ^~~~~~~~~~


vim +105 mm/oom_kill.c

    92	
    93	#ifdef CONFIG_NUMA
    94	/*
    95	 * Killing a task can only relieve system pressure if freed memory can be
    96	 * demoted there and reclaim can operate on the node's pages, so we
    97	 * omit private nodes that aren't eligible.
    98	 */
    99	static bool oom_mems_intersect(const struct task_struct *tsk1,
   100				       const struct task_struct *tsk2)
   101	{
   102		int nid;
   103	
   104		for_each_node_state(nid, N_MEMORY) {
 > 105			if (!node_isset(nid, tsk1->mems_allowed))
   106				continue;
   107			if (!node_isset(nid, tsk2->mems_allowed))
   108				continue;
   109			if (!node_oom_eligible(nid))
   110				continue;
   111			return true;
   112		}
   113		return false;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
