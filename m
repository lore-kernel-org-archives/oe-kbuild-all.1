Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5614417548
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 05:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735795257; cv=none; b=K4tqN3f+XYpQAIWx6CILOZXxM5zyVv4b3vbBU26ZaXVftuSVaxnFYMD/k/nvG97VbSzNuF0KGlqFmhbZVSlHjNb9oXQUVeght3yNg/tWJTMWUQ6+CwlAWYEGkfWnZkvHhevxQwnVZ5hod7eDOes2JJm7of1bCCtM3TE+rT47QeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735795257; c=relaxed/simple;
	bh=10RttOhFofs1dYsCK12/8W8cceRE3iO38HMTR3nBJUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNhXnpw8/GzLpc4BUfZqE0OY0u4szvE7PcYbKvFiGU0Shod4V95UKolDCMCJ3N7ZzP8sfkniySxToKJ2oYJWz2pXMKAdSilRNvPqAfbTmYncmeaGu7wcYWlcT94bV2t1bOJzO+XaS1vu9tPPkB7EJ269KjEgQ/7nOAzvVXc53Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrchjPCB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrchjPCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735795255; x=1767331255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10RttOhFofs1dYsCK12/8W8cceRE3iO38HMTR3nBJUM=;
  b=ZrchjPCBktK4cGWajTbfi6DmgXNZblHaOKNQ/e972CCbtRCNzAFm8xMQ
   7C1wOR+IEEoirxHwxEPduki0w+POt109s8WvuqCpsIRZUfnFyfFPyRE2k
   t8U1dpdb16Ci7Zl9RkNdzD2ccb1Ajz3WY4VQrq/HoNARGQ4TnZNoXMzPf
   1aIwrowJxxBINdQKaqcB/MsZKlxkCqSBV3GVC10r0FKmQl8Ng3MKRNHVu
   oh03aZrrP9EYwrgswzHAii8wWH6XRaRkrJVVXQBpquWJky+5G8k5D58Xh
   Xzt8MjDXecXEZHklxarjlQnyaoLrWqeVBCUf+SJ+uOwuWxwxMeeK26VY2
   w==;
X-CSE-ConnectionGUID: HiCP+YmTRcWe7v63SemQdg==
X-CSE-MsgGUID: 7f4bnaX0Th2eW6YyUGe8Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="39953358"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="39953358"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 21:20:54 -0800
X-CSE-ConnectionGUID: e+Bmckf9TjCkHiI74E7ZUA==
X-CSE-MsgGUID: 4uN5KxRGQQ68mfyKlIr2jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="106387619"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2025 21:20:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTDdb-0008GB-0d;
	Thu, 02 Jan 2025 05:20:51 +0000
Date: Thu, 2 Jan 2025 13:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/prjc-revert-active-balance 9/12]
 include/linux/rcupdate.h:1091:49: warning: cast to pointer from integer of
 different size
Message-ID: <202501021329.3mmcdxlV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/prjc-revert-active-balance
head:   4a42958cae493501eea276a2926f0d3727193c66
commit: 2352960e110a0c5e47e22008a9a47003bf62c7c3 [9/12] Revert "sched/alt: Introduce alt_topology.c/.h files"
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250102/202501021329.3mmcdxlV-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021329.3mmcdxlV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021329.3mmcdxlV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/alt_core.c:1781:40: error: invalid use of undefined type 'struct affinity_context'
    1781 |         cpumask_copy(&p->cpus_mask, ctx->new_mask);
         |                                        ^~
   kernel/sched/alt_core.c:1782:48: error: invalid use of undefined type 'struct affinity_context'
    1782 |         p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
         |                                                ^~
   kernel/sched/alt_core.c:1787:16: error: invalid use of undefined type 'struct affinity_context'
    1787 |         if (ctx->flags & SCA_USER)
         |                ^~
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/alt_core.c:14:
   kernel/sched/alt_core.c:1788:43: error: invalid use of undefined type 'struct affinity_context'
    1788 |                 swap(p->user_cpus_ptr, ctx->user_mask);
         |                                           ^~
   include/linux/minmax.h:323:44: note: in definition of macro 'swap'
     323 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                            ^
   kernel/sched/alt_core.c:1788:43: error: invalid use of undefined type 'struct affinity_context'
    1788 |                 swap(p->user_cpus_ptr, ctx->user_mask);
         |                                           ^~
   include/linux/minmax.h:323:49: note: in definition of macro 'swap'
     323 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                 ^
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:1792:53: warning: 'struct affinity_context' declared inside parameter list will not be visible outside of this definition or declaration
    1792 | __do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
         |                                                     ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__do_set_cpus_allowed':
   kernel/sched/alt_core.c:1795:36: error: passing argument 2 of 'set_cpus_allowed_common' from incompatible pointer type [-Wincompatible-pointer-types]
    1795 |         set_cpus_allowed_common(p, ctx);
         |                                    ^~~
         |                                    |
         |                                    struct affinity_context *
   kernel/sched/alt_core.c:1779:73: note: expected 'struct affinity_context *' but argument is of type 'struct affinity_context *'
    1779 | set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx)
         |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/sched/alt_core.c: In function 'do_set_cpus_allowed':
   kernel/sched/alt_core.c:1804:16: error: variable 'ac' has initializer but incomplete type
    1804 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1805:18: error: 'struct affinity_context' has no member named 'new_mask'
    1805 |                 .new_mask  = new_mask,
         |                  ^~~~~~~~
   kernel/sched/alt_core.c:1805:30: warning: excess elements in struct initializer
    1805 |                 .new_mask  = new_mask,
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:1805:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:1806:18: error: 'struct affinity_context' has no member named 'user_mask'
    1806 |                 .user_mask = NULL,
         |                  ^~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/smp.h:11:
   include/linux/stddef.h:8:14: warning: excess elements in struct initializer
       8 | #define NULL ((void *)0)
         |              ^
   kernel/sched/alt_core.c:1806:30: note: in expansion of macro 'NULL'
    1806 |                 .user_mask = NULL,
         |                              ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'ac')
       8 | #define NULL ((void *)0)
         |              ^
   kernel/sched/alt_core.c:1806:30: note: in expansion of macro 'NULL'
    1806 |                 .user_mask = NULL,
         |                              ^~~~
   kernel/sched/alt_core.c:1807:18: error: 'struct affinity_context' has no member named 'flags'
    1807 |                 .flags     = SCA_USER,  /* clear the user requested mask */
         |                  ^~~~~
   kernel/sched/alt_core.c:1493:33: warning: excess elements in struct initializer
    1493 | #define SCA_USER                0x08
         |                                 ^~~~
   kernel/sched/alt_core.c:1807:30: note: in expansion of macro 'SCA_USER'
    1807 |                 .flags     = SCA_USER,  /* clear the user requested mask */
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:1493:33: note: (near initialization for 'ac')
    1493 | #define SCA_USER                0x08
         |                                 ^~~~
   kernel/sched/alt_core.c:1807:30: note: in expansion of macro 'SCA_USER'
    1807 |                 .flags     = SCA_USER,  /* clear the user requested mask */
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:1804:33: error: storage size of 'ac' isn't known
    1804 |         struct affinity_context ac = {
         |                                 ^~
   In file included from include/linux/rculist.h:11,
                    from include/linux/sched/signal.h:5,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/alt_core.c:15:
   include/linux/rcupdate.h:1091:41: error: invalid type argument of '->' (have 'int')
    1091 |                 kvfree_call_rcu(&((___p)->rhf), (void *) (___p));                       \
         |                                         ^~
   include/linux/rcupdate.h:1062:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1062 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1824:9: note: in expansion of macro 'kfree_rcu'
    1824 |         kfree_rcu((union cpumask_rcuhead *)ac.user_mask, rcu);
         |         ^~~~~~~~~
>> include/linux/rcupdate.h:1091:49: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1091 |                 kvfree_call_rcu(&((___p)->rhf), (void *) (___p));                       \
         |                                                 ^
   include/linux/rcupdate.h:1062:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1062 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:1824:9: note: in expansion of macro 'kfree_rcu'
    1824 |         kfree_rcu((union cpumask_rcuhead *)ac.user_mask, rcu);
         |         ^~~~~~~~~
   kernel/sched/alt_core.c:1804:33: warning: unused variable 'ac' [-Wunused-variable]
    1804 |         struct affinity_context ac = {
         |                                 ^~
   kernel/sched/alt_core.c: In function 'dup_user_cpus_ptr':
   kernel/sched/alt_core.c:1847:21: error: implicit declaration of function 'alloc_user_cpus_ptr'; did you mean 'dup_user_cpus_ptr'? [-Wimplicit-function-declaration]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     dup_user_cpus_ptr
   kernel/sched/alt_core.c:1847:19: error: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1847 |         user_mask = alloc_user_cpus_ptr(node);
         |                   ^
   kernel/sched/alt_core.c: In function 'affine_move_task':
   kernel/sched/alt_core.c:2138:25: error: implicit declaration of function '__task_access_unlock'; did you mean '__task_rq_unlock'? [-Wimplicit-function-declaration]
    2138 |                         __task_access_unlock(p, lock);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         __task_rq_unlock
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:2159:49: warning: 'struct affinity_context' declared inside parameter list will not be visible outside of this definition or declaration
    2159 |                                          struct affinity_context *ctx,
         |                                                 ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__set_cpus_allowed_ptr_locked':
   kernel/sched/alt_core.c:2184:44: error: invalid use of undefined type 'struct affinity_context'
    2184 |         if (!kthread && !cpumask_subset(ctx->new_mask, cpu_allowed_mask)) {
         |                                            ^~
   kernel/sched/alt_core.c:2193:17: error: invalid use of undefined type 'struct affinity_context'
    2193 |         if ((ctx->flags & SCA_CHECK) && (p->flags & PF_NO_SETAFFINITY)) {
         |                 ^~
   kernel/sched/alt_core.c:2198:45: error: invalid use of undefined type 'struct affinity_context'
    2198 |         if (cpumask_equal(&p->cpus_mask, ctx->new_mask))
         |                                             ^~
   kernel/sched/alt_core.c:2201:55: error: invalid use of undefined type 'struct affinity_context'
    2201 |         dest_cpu = cpumask_any_and(cpu_valid_mask, ctx->new_mask);
         |                                                       ^~
   include/linux/cpumask.h:857:67: note: in definition of macro 'cpumask_any_and'
     857 | #define cpumask_any_and(mask1, mask2) cpumask_first_and((mask1), (mask2))
         |                                                                   ^~~~~
   kernel/sched/alt_core.c:2207:34: error: passing argument 2 of '__do_set_cpus_allowed' from incompatible pointer type [-Wincompatible-pointer-types]
    2207 |         __do_set_cpus_allowed(p, ctx);
         |                                  ^~~
         |                                  |
         |                                  struct affinity_context *
   kernel/sched/alt_core.c:1792:71: note: expected 'struct affinity_context *' but argument is of type 'struct affinity_context *'
    1792 | __do_set_cpus_allowed(struct task_struct *p, struct affinity_context *ctx)
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/sched/alt_core.c: At top level:
   kernel/sched/alt_core.c:2227:35: warning: 'struct affinity_context' declared inside parameter list will not be visible outside of this definition or declaration
    2227 |                            struct affinity_context *ctx)
         |                                   ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2226:5: warning: no previous prototype for '__set_cpus_allowed_ptr' [-Wmissing-prototypes]
    2226 | int __set_cpus_allowed_ptr(struct task_struct *p,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c: In function '__set_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2234:14: error: implicit declaration of function '__task_access_lock'; did you mean '__task_rq_lock'? [-Wimplicit-function-declaration]
    2234 |         rq = __task_access_lock(p, &lock);
         |              ^~~~~~~~~~~~~~~~~~
         |              __task_rq_lock
   kernel/sched/alt_core.c:2234:12: error: assignment to 'struct rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2234 |         rq = __task_access_lock(p, &lock);
         |            ^
   kernel/sched/alt_core.c:2240:18: error: invalid use of undefined type 'struct affinity_context'
    2240 |             !(ctx->flags & SCA_USER) &&
         |                  ^~
   kernel/sched/alt_core.c:2241:46: error: invalid use of undefined type 'struct affinity_context'
    2241 |             cpumask_and(rq->scratch_mask, ctx->new_mask, p->user_cpus_ptr))
         |                                              ^~
   kernel/sched/alt_core.c:2242:20: error: invalid use of undefined type 'struct affinity_context'
    2242 |                 ctx->new_mask = rq->scratch_mask;
         |                    ^~
   kernel/sched/alt_core.c:2245:49: error: passing argument 2 of '__set_cpus_allowed_ptr_locked' from incompatible pointer type [-Wincompatible-pointer-types]
    2245 |         return __set_cpus_allowed_ptr_locked(p, ctx, rq, lock, irq_flags);
         |                                                 ^~~
         |                                                 |
         |                                                 struct affinity_context *
   kernel/sched/alt_core.c:2159:67: note: expected 'struct affinity_context *' but argument is of type 'struct affinity_context *'
    2159 |                                          struct affinity_context *ctx,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   kernel/sched/alt_core.c: In function 'set_cpus_allowed_ptr':
   kernel/sched/alt_core.c:2250:16: error: variable 'ac' has initializer but incomplete type
    2250 |         struct affinity_context ac = {
         |                ^~~~~~~~~~~~~~~~
   kernel/sched/alt_core.c:2251:18: error: 'struct affinity_context' has no member named 'new_mask'
    2251 |                 .new_mask  = new_mask,
         |                  ^~~~~~~~
   kernel/sched/alt_core.c:2251:30: warning: excess elements in struct initializer
    2251 |                 .new_mask  = new_mask,
         |                              ^~~~~~~~
   kernel/sched/alt_core.c:2251:30: note: (near initialization for 'ac')
   kernel/sched/alt_core.c:2252:18: error: 'struct affinity_context' has no member named 'flags'
    2252 |                 .flags     = 0,
         |                  ^~~~~
   kernel/sched/alt_core.c:2252:30: warning: excess elements in struct initializer
    2252 |                 .flags     = 0,


vim +1091 include/linux/rcupdate.h

608723c41cd951 Uladzislau Rezki (Sony  2023-02-01  1084) 
5130b8fd06901c Uladzislau Rezki (Sony  2020-11-20  1085) #define kvfree_rcu_arg_2(ptr, rhf)					\
5130b8fd06901c Uladzislau Rezki (Sony  2020-11-20  1086) do {									\
5130b8fd06901c Uladzislau Rezki (Sony  2020-11-20  1087) 	typeof (ptr) ___p = (ptr);					\
5130b8fd06901c Uladzislau Rezki (Sony  2020-11-20  1088) 									\
5ea5d1ed572cb5 Uladzislau Rezki (Sony  2020-11-20  1089) 	if (___p) {									\
5ea5d1ed572cb5 Uladzislau Rezki (Sony  2020-11-20  1090) 		BUILD_BUG_ON(!__is_kvfree_rcu_offset(offsetof(typeof(*(ptr)), rhf)));	\
04a522b7da3dbc Uladzislau Rezki (Sony  2022-10-25 @1091) 		kvfree_call_rcu(&((___p)->rhf), (void *) (___p));			\
5ea5d1ed572cb5 Uladzislau Rezki (Sony  2020-11-20  1092) 	}										\
5130b8fd06901c Uladzislau Rezki (Sony  2020-11-20  1093) } while (0)
5130b8fd06901c Uladzislau Rezki (Sony  2020-11-20  1094) 

:::::: The code at line 1091 was first introduced by commit
:::::: 04a522b7da3dbc083f8ae0aa1a6184b959a8f81c rcu: Refactor kvfree_call_rcu() and high-level helpers

:::::: TO: Uladzislau Rezki (Sony) <urezki@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
