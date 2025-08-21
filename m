Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1B82EE26F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767781; cv=none; b=UYOq7PYXmbV6FpL6suLXqh2vqNBTVLh5p66NgbHJxz2ZywaKcWiFRBpFNVV+9A0hRHz3oL7I76QyON+GBE4H5WXypTNUV3sDwS1xd/k2nww3VdWqI664BYRflJqzbuKNV9XLO/V791+Mzp89GWDLibUJ8i7pYVYRg+xVyr1mn6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767781; c=relaxed/simple;
	bh=bH7J9sU1SOfmcN64Nc4/PP/9wHwVippM8whyoDh4Q9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ny54MEOrV+JvSiFbOFfL0RpGK41vvjBFf5rsZwMpIKZRgMVZmF0u6E+rnWpFPYWini/ib+UicpzXkuv6KGf/+vpkkVymvFaGG2yKY+5PW2yD5jQqPSYx/kz6nFAh6zaBytRBc0crieB65ML+eaHtvNBM1p7Q7RJg+2cFJiTfvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJr079gF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJr079gF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755767779; x=1787303779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bH7J9sU1SOfmcN64Nc4/PP/9wHwVippM8whyoDh4Q9c=;
  b=RJr079gF1pyUNvxLuQo4opN3kzOYTkiyKgt9zytuKE6QGTPcSo8uQHL/
   UIgrxlljliMDfl0luwvB06PyR0xJyb5L+wXwOKp+WfFjvNDT0M+vlsT3d
   sW7Cd2plDItX6P4O/Qo6qAO1eCvDPDgPSolIoxdMa0ArGJhSDZbND1F9s
   Pdzb4x60cArVThcKySYca//+bSiAzafJygxRgKYI4aWazx3lYMaeoOav5
   lNm2J6NS2q/IoVjYsdZDk2fTqAMwED2eLK4SqxQrvIZVs5J54PWRCcs8c
   AYPIvrkMg0PX0SuY2TEslrud83zvvJTyI/ksiT14VO/N7nB24aabsGrFP
   Q==;
X-CSE-ConnectionGUID: 4NB95lBgSwKyTZ563qe9jA==
X-CSE-MsgGUID: MwJRmkWAQ/2O2JGic2sEJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68755472"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68755472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:16:19 -0700
X-CSE-ConnectionGUID: rE+8BfBiT3eAadz6WysL2w==
X-CSE-MsgGUID: mlNuUNJMSTiCXja+29IoLg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2025 02:16:18 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up1P5-0001iF-1m;
	Thu, 21 Aug 2025 09:16:15 +0000
Date: Thu, 21 Aug 2025 11:15:44 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 4/4] include/linux/rcupdate.h:371:9:
 error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
Message-ID: <202508211112.J6U6Jkex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f405d5f9137b73c974509f22235b46df04196e22
commit: a905086c85cb076b98620df34ee237ece7c0599f [4/4] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: arm-randconfig-2006-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211112.J6U6Jkex-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211112.J6U6Jkex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211112.J6U6Jkex-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rculist.h:11:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:8,
                    from include/uapi/linux/aio_abi.h:31,
                    from fs/aio.c:18:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/sched/numa_balancing.h:10,
                    from include/trace/events/sched.h:8,
                    from kernel/sched/core.c:10:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2622:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
     struct rq *rq;
                ^~
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/dcache.h:7,
                    from include/linux/fs.h:8,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:73,
                    from io_uring/io_uring.c:45:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c: In function 'io_queue_async_work':
   io_uring/io_uring.c:1483:61: warning: parameter 'locked' set but not used [-Wunused-but-set-parameter]
    static void io_queue_async_work(struct io_kiocb *req, bool *locked)
                                                                ^~~~~~
--
   In file included from include/linux/rbtree.h:22:0,
                    from include/linux/mm_types.h:10,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from mm/mmap.c:13:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/hugetlb.h:15:0,
                    from mm/mmap.c:28:
   include/linux/userfaultfd_k.h:82:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
--
   In file included from include/linux/rculist.h:11:0,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from mm/compaction.c:11:
   include/linux/userfaultfd_k.h: In function 'is_mergeable_vm_userfaultfd_ctx':
>> include/linux/rcupdate.h:371:9: error: dereferencing pointer to incomplete type 'struct userfaultfd_ctx'
     typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:481:31: note: in expansion of macro '__rcu_access_pointer'
    #define rcu_access_pointer(p) __rcu_access_pointer((p), __rcu)
                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/userfaultfd_k.h:81:9: note: in expansion of macro 'rcu_access_pointer'
     return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
            ^~~~~~~~~~~~~~~~~~
   At top level:
   mm/compaction.c:61:27: warning: 'HPAGE_FRAG_CHECK_INTERVAL_MSEC' defined but not used [-Wunused-const-variable=]
    static const unsigned int HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500;
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +371 include/linux/rcupdate.h

53ecfba259f54b6 Paul E. McKenney        2010-09-13  368  
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  369  #define __rcu_access_pointer(p, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  370  ({ \
7d0ae8086b82831 Paul E. McKenney        2015-03-03 @371  	typeof(*p) *_________p1 = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  372) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  373  	((typeof(*p) __force __kernel *)(_________p1)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  374  })
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  375  #define __rcu_dereference_check(p, c, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  376  ({ \
ac59853c06993a4 Pranith Kumar           2014-11-13  377  	/* Dependency order vs. p above. */ \
506458efaf153c1 Will Deacon             2017-10-24  378  	typeof(*p) *________p1 = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa55 Paul E. McKenney        2015-06-18  379  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  380) 	rcu_check_sparse(p, space); \
ac59853c06993a4 Pranith Kumar           2014-11-13  381  	((typeof(*p) __force __kernel *)(________p1)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  382  })
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  383  #define __rcu_dereference_protected(p, c, space) \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  384  ({ \
f78f5b90c4ffa55 Paul E. McKenney        2015-06-18  385  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad12 Joel Fernandes (Google  2018-12-12  386) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  387  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  388  })
995f1405610bd84 Paul E. McKenney        2016-07-01  389  #define rcu_dereference_raw(p) \
995f1405610bd84 Paul E. McKenney        2016-07-01  390  ({ \
995f1405610bd84 Paul E. McKenney        2016-07-01  391  	/* Dependency order vs. p above. */ \
506458efaf153c1 Will Deacon             2017-10-24  392  	typeof(p) ________p1 = READ_ONCE(p); \
995f1405610bd84 Paul E. McKenney        2016-07-01  393  	((typeof(*p) __force __kernel *)(________p1)); \
995f1405610bd84 Paul E. McKenney        2016-07-01  394  })
ca5ecddfa8fcbd9 Paul E. McKenney        2010-04-28  395  

:::::: The code at line 371 was first introduced by commit
:::::: 7d0ae8086b828311250c6afdf800b568ac9bd693 rcu: Convert ACCESS_ONCE() to READ_ONCE() and WRITE_ONCE()

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
