Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B462A15AD9D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716948235; cv=none; b=X0GY692TBuoe6WEJ7WKLu7Rr4Ukvs7Ud0BG0Ade3CKU1krF9Pvy+2KHSbLWE+6AWtKJjIiEqlUODh07ewpmgXyuUwOZatAKJOXBfugXCeLq9V96S8F4MuMLCpZfURr4oFTw4C4D0DV/nW4mlZ904LULmpo7h0mSRn6lsLEsJV6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716948235; c=relaxed/simple;
	bh=AqwpNZbczUSCPJKpp3aqNnSW6VAPV+m0By0o7hDgh9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mKzKaxy8M37Q+8OJOXYDOVTeyFx6JaXRGedj0djS4snqBRvFBrOTSD/nG6hyKMFcG1RdFfxDIh0z16U427n2OuK+FDfBuGn/8nWit+VAHQkkki5aDZq/w0n7r02G3b80wRCOTDugx+X6VIKmBB8XJIxbVH0bv2hoZe7t9NXQwxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JM6upFoF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JM6upFoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716948234; x=1748484234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AqwpNZbczUSCPJKpp3aqNnSW6VAPV+m0By0o7hDgh9U=;
  b=JM6upFoFnx5l0DtPvV+yETNT+FsPb+CotHcO6x8ROjTn8PheXcVvYv9b
   o60/6KH8vn3/UWyd49Z6xeDPtKa1dzYF0n+3eZvWy++jqYdDwiPn/t41j
   r2V5q+5rA+DIKgZezCQeJ7OYOd4h8LZPQGLPl7Ub3Mduk4tcSd0YV8z4z
   cEMuFB3t3jZhtzylKajLoSpBIoxlZgSutWg+Mm3tdz55qID7k3avmPBJe
   LoSXmdW/QYyKR7ix2pav67s2/aEf7MFHEvdsEMyqnJ0i70tCWDZkKGMYz
   IicbTE6Y6wPGu7naGSqYHHlGKZ0r2KhYFbI2ZHMW+N9/dgJJHk3jO8KwI
   w==;
X-CSE-ConnectionGUID: GurIjWvBQ8u/Yqr/DGtrSg==
X-CSE-MsgGUID: lUquGQSLSqeNec4wo2dF3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23884798"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="23884798"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 19:03:53 -0700
X-CSE-ConnectionGUID: mG1E3EgjSDWIwiqWsWga5g==
X-CSE-MsgGUID: 7xW+ZXc+StW38GUNPXqbtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35208167"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 May 2024 19:03:52 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC8fN-000Czn-1w;
	Wed, 29 May 2024 02:03:49 +0000
Date: Wed, 29 May 2024 10:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] include/linux/rcupdate.h:391:9:
 error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
Message-ID: <202405290949.9JNk4OA5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   4b0be62caf6923eac6acdb5a44eb03688e6f9dc5
commit: 9b613572d6246da9b616f34e4a0e0b5ac74b2dd0 [1/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: i386-randconfig-003-20240528 (https://download.01.org/0day-ci/archive/20240529/202405290949.9JNk4OA5-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290949.9JNk4OA5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290949.9JNk4OA5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/mm_types.h:6,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/mm/pgtable.c:2:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/dcache.h:8,
                    from include/linux/fs.h:8,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:76,
                    from io_uring/io_uring.c:45:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c: In function 'io_queue_async_work':
   io_uring/io_uring.c:1476:61: warning: parameter 'locked' set but not used [-Wunused-but-set-parameter]
    1476 | static void io_queue_async_work(struct io_kiocb *req, bool *locked)
         |                                                       ~~~~~~^~~~~~
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
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
   mm/vmscan.c: At top level:
   mm/vmscan.c:910:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     910 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:1384:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1384 |  int err;
         |      ^~~
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
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: At top level:
   mm/page_alloc.c:4128:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    4128 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
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
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/hugetlb.h:15,
                    from mm/mmap.c:29:
   include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void function [-Wreturn-type]
      82 | }
         | ^
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:4670:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    4670 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/rt.c:6:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:391:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     391 |  typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
         |         ^
   include/linux/rcupdate.h:501:31: note: in expansion of macro '__rcu_access_pointer'
     501 | #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
      81 |  return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:682:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     682 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


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
