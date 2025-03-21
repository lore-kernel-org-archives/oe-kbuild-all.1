Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6322318
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 23:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742599850; cv=none; b=aLwdHEWSNDAxk2AJqeqO9HKQHKBu+sYmTYxWfOOw+ajnMXxtVIwemWF0S7hgXty8Bx93JPQHqH4U0MDynfGFF8qMuNvoDaaUC7GW3ln4xEg9oKT775gsFjQwBGTEd8sOtEmy6T68CGIZ2k2Kg1JI3+j81umvSecNoumwDnlLawk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742599850; c=relaxed/simple;
	bh=frFvfnk4tXwGc6o2lrRCo55G15Y/xOe4qvWCkazEKks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6NDH3jfCbRs1URzdXNS0EbFE3bUkmb8PFYiZKbSQ2Lq3mWwz0j5t2HdL9X80JVfeE4utkjJpYGAhjbz6HjePDapK9SSDuV6CrCMZQhxQ2OQMVYkIXVAgT+kWMfYT0qhhipnrSu71nwMJs4SXsihBgyJnjXt67f7RADNM4pAVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiKLKN3E; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiKLKN3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742599848; x=1774135848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=frFvfnk4tXwGc6o2lrRCo55G15Y/xOe4qvWCkazEKks=;
  b=PiKLKN3ERvW0DRYRXlMNpf6tJ2+QeGx6nHvnY8MbMEG7Ugp4kb179qF+
   OJD17RxZ6m2BUMU4IvCvOVgVtcvG7fqFKzI073SFuVVfGuQnq5nw8AYPC
   IkvyDv07R3T8GxAyVMYuO+MkjeenqohcSlmPCTlMjxtatZ2MhO8UnywUu
   QG4lFtaQONEFTttnZzpkiH1voA19SV8WwKpk/bPC4eeKGGV21uG9d24bV
   UmiKHEyVsMCQrtbftuao3Szy2W+wV5nMPlLfc9hXfjI9HPcBgp46Jl1Xa
   WUuOWofD2qkPwmlri7Z8zJ20OO8mrUW8Fz7H6Ga3onWcm2UUouOvCC853
   w==;
X-CSE-ConnectionGUID: s0xJahQUSiGDsE6njsKEYQ==
X-CSE-MsgGUID: YExiC5oyQlegvKkJyZri9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="69231525"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="69231525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 16:30:47 -0700
X-CSE-ConnectionGUID: diiYqFZYTrOQEpLgOMjaLg==
X-CSE-MsgGUID: U21fpJl8RHmsA4q9GBXt3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="128206520"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2025 16:30:46 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvlp5-0001mB-35;
	Fri, 21 Mar 2025 23:30:43 +0000
Date: Sat, 22 Mar 2025 07:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2024-11 2/2]
 include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete
 type 'struct userfaultfd_ctx'
Message-ID: <202503220753.M2DGFO52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-11
head:   705f06af57bc55a7f9c751dc308faaa3ee40b93e
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [2/2] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm64-randconfig-003-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220753.M2DGFO52-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220753.M2DGFO52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220753.M2DGFO52-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/kthread.h:6,
                    from include/trace/events/sched.h:8,
                    from kernel/sched/core.c:10:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:3532:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    void sched_set_stop_task(int cpu, struct task_struct *stop)
         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:4844:6: warning: no previous prototype for '__balance_callbacks' [-Wmissing-prototypes]
    void __balance_callbacks(struct rq *rq)
         ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/idle.c:9:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:4670:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11377:6: warning: no previous prototype for 'task_vruntime_update' [-Wmissing-prototypes]
    void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/pelt.c:27:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c: At top level:
   kernel/sched/pelt.c:183:5: warning: no previous prototype for '___update_load_sum' [-Wmissing-prototypes]
    int ___update_load_sum(u64 now, struct sched_avg *sa,
        ^~~~~~~~~~~~~~~~~~
   kernel/sched/pelt.c:260:6: warning: no previous prototype for '___update_load_avg' [-Wmissing-prototypes]
    void ___update_load_avg(struct sched_avg *sa, unsigned long load)
         ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/rt.c:6:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:682:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
    bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/mm_types.h:6,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from mm/vmscan.c:15:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   mm/vmscan.c: At top level:
   mm/vmscan.c:910:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
    unsigned long shrink_slab(gfp_t gfp_mask, int nid,
                  ^~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1384:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     int err;
         ^~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/mm_types.h:6,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from mm/page_alloc.c:19:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:4128:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
                  ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   At top level:
   mm/compaction.c:61:27: warning: 'HPAGE_FRAG_CHECK_INTERVAL_MSEC' defined but not used [-Wunused-const-variable=]
    static const unsigned int HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500;
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/mm_types.h:6,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from mm/mmap.c:13:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/hugetlb.h:15,
                    from mm/mmap.c:29:
>> include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +391 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  388  
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  389  #define __rcu_access_pointer(p, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  390  ({ \
7d0ae8086b8283 Paul E. McKenney        2015-03-03 @391  	typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  392) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  393  	((typeof(*p) __force __kernel *)(_________p1)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  394  })
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  395  #define __rcu_dereference_check(p, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  396  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  397  	/* Dependency order vs. p above. */ \
506458efaf153c Will Deacon             2017-10-24  398  	typeof(*p) *________p1 = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  399  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  400) 	rcu_check_sparse(p, space); \
ac59853c06993a Pranith Kumar           2014-11-13  401  	((typeof(*p) __force __kernel *)(________p1)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  402  })
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  403  #define __rcu_dereference_protected(p, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  404  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  405  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  406) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  407  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  408  })
995f1405610bd8 Paul E. McKenney        2016-07-01  409  #define rcu_dereference_raw(p) \
995f1405610bd8 Paul E. McKenney        2016-07-01  410  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  411  	/* Dependency order vs. p above. */ \
506458efaf153c Will Deacon             2017-10-24  412  	typeof(p) ________p1 = READ_ONCE(p); \
995f1405610bd8 Paul E. McKenney        2016-07-01  413  	((typeof(*p) __force __kernel *)(________p1)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  414  })
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  415  

:::::: The code at line 391 was first introduced by commit
:::::: 7d0ae8086b828311250c6afdf800b568ac9bd693 rcu: Convert ACCESS_ONCE() to READ_ONCE() and WRITE_ONCE()

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
