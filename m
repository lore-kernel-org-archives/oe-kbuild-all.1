Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE47110F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 00:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731456277; cv=none; b=AIuvAbRaeQoHRkwYZzNK+jXlS5GmBhOPUYXwlfoR1sV4jYA1szovOsQah25boZsKp5JOrU9oKmrewr2Ip3MUUrCj/NVSMuCjIDSPJ+schd0A8TfubvLAohZ0ivmCv9swJ8afMbUX/E08DeYvTUK32kiqfj033ViONT/NU3u60HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731456277; c=relaxed/simple;
	bh=ANcibOJBh8Y+eZ/r2+vYs7M9pBb44reU+d0SR/lamqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZnGVAMNTrD6oH3Z34vnHlXHhiY0mo/XFRb39ei50yLTlchAtpom4UQDML9NExFslTRuJfWXUD+/I4Bzg7uu4lUkmpcYXa8OdVheTcHeKnBLYtkISdAAK4MPoSDRkM/NYY9+Zj7ZLqcdqtLUCywyBG8vj4PRAGsIYnnj2cEvfD4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzM3FqZl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzM3FqZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731456276; x=1762992276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ANcibOJBh8Y+eZ/r2+vYs7M9pBb44reU+d0SR/lamqc=;
  b=VzM3FqZljBpeqPvtdMjtODnV/u0yTPURRtvsvrFQ5YLSRx0sr1rk9IoN
   Y+iNji/Up7D/wvcWxSx78fpTeXo5j+dq82IPGg/iVLabwwkEMplX2XIzq
   O4gPaJzNLoJ3YB+5oZsNpyTxMf6qqEez2ZJIbAzQ0qh/Zwq7o8ymJwuqC
   nGiBQVUBKh/AzwCJ2La+4y0gEW86zsdknZurl36KzJDwYqJFnZSNkRvVz
   OSzmbWocyj5wH/p/2/iUm5zYJJawzGz5UYNTArPEA3KwgRoSWZKKzMXcM
   +2wZaGAVqX/hQCPSc6j5R+tizca4ynuT4zoQRgVA6Yd0d2jaUe4ptaJGt
   A==;
X-CSE-ConnectionGUID: Ir6R0kh4RzGF1Zm1P670Tw==
X-CSE-MsgGUID: HYI1L37pSq+EWZ4NjZwKKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31426784"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="31426784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 16:04:33 -0800
X-CSE-ConnectionGUID: XRo2u0YNTHyy0wLHzU6Hsg==
X-CSE-MsgGUID: QjxARc4TSxmMfPVMxeggGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="87852629"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 16:04:32 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB0s1-0001r0-34;
	Wed, 13 Nov 2024 00:04:29 +0000
Date: Wed, 13 Nov 2024 08:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:sched/rework-eas 5/7] kernel/sched/fair.c:8667:42:
 error: 'struct cfs_rq' has no member named 'pushable_tasks'
Message-ID: <202411130734.ISewGcWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git sched/rework-eas
head:   f56343c093b03ec6e87c249ce16f896e3a51d7ec
commit: 3feee940ffc89b0713ca4fe7d1a72923b8b13cf6 [5/7] sched/fair: Add push task callback for EAS
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241113/202411130734.ISewGcWQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130734.ISewGcWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130734.ISewGcWQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'has_pushable_tasks':
>> kernel/sched/fair.c:8667:42: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8667 |         return !plist_head_empty(&rq->cfs.pushable_tasks);
         |                                          ^
   In file included from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:11,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'pick_next_pushable_fair_task':
   kernel/sched/fair.c:8677:39: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8677 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |                                       ^
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   kernel/sched/fair.c:8677:13: note: in expansion of macro 'plist_first_entry'
    8677 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5:
   kernel/sched/fair.c:8677:39: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8677 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |                                       ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/plist.h:233:9: note: in expansion of macro 'container_of'
     233 |         container_of(plist_first(head), type, member)
         |         ^~~~~~~~~~~~
   kernel/sched/fair.c:8677:13: note: in expansion of macro 'plist_first_entry'
    8677 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8677:39: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8677 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |                                       ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/plist.h:233:9: note: in expansion of macro 'container_of'
     233 |         container_of(plist_first(head), type, member)
         |         ^~~~~~~~~~~~
   kernel/sched/fair.c:8677:13: note: in expansion of macro 'plist_first_entry'
    8677 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/plist.h:233:9: note: in expansion of macro 'container_of'
     233 |         container_of(plist_first(head), type, member)
         |         ^~~~~~~~~~~~
   kernel/sched/fair.c:8677:13: note: in expansion of macro 'plist_first_entry'
    8677 |         p = plist_first_entry(&rq->cfs.pushable_tasks,
         |             ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:8690:47: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8690 |         plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                               ^
   kernel/sched/fair.c: In function 'dequeue_pushable_task':
   kernel/sched/fair.c:8776:55: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8776 |                 plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                                       ^
   kernel/sched/fair.c: In function 'enqueue_pushable_task':
   kernel/sched/fair.c:8790:63: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8790 |                         plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                                               ^
   kernel/sched/fair.c:8792:63: error: 'struct cfs_rq' has no member named 'pushable_tasks'
    8792 |                         plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
         |                                                               ^
   kernel/sched/fair.c: In function 'init_cfs_rq':
   kernel/sched/fair.c:13495:32: error: 'struct cfs_rq' has no member named 'pushable_tasks'
   13495 |         plist_head_init(&cfs_rq->pushable_tasks);
         |                                ^~
   kernel/sched/fair.c: In function 'has_pushable_tasks':
>> kernel/sched/fair.c:8668:1: warning: control reaches end of non-void function [-Wreturn-type]
    8668 | }
         | ^


vim +8667 kernel/sched/fair.c

  8664	
  8665	static inline int has_pushable_tasks(struct rq *rq)
  8666	{
> 8667		return !plist_head_empty(&rq->cfs.pushable_tasks);
> 8668	}
  8669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
