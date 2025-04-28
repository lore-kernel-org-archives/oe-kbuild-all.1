Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889D1ACED1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889582; cv=none; b=JhCgal7AE9ck5bsaTsnV4/kXWg9QhnwHxWvnrmJHEgMN1nFGe7fXGJLNJmop0Wfx1W+14NStD3okKfa8cnMzDHl/LpnmQmeLxD5lVfWvlV8enMTU70kjRP9M/rP+69qJsKtrwD4xB9kbq26F2/BZrMJCvumOPDZoAU3cEo/ERd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889582; c=relaxed/simple;
	bh=8WJS/1Wa3PFxeoPjsNH484tGSg7pwut6gEk/4UbNqhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSnP5U/ZIX6JU5kjAggSRFBRq5AjicFno5pmuiuz0BnXxhD+oSUr2FprQ0CXeURRd02o0hmxqOMiJJJZEu2QwmvmbtDDJdw7Wut6RWJAkPkl6C37dOS2FFNI1F3AnljOQQYikDvN3FOqYXocmCMjP2EIgPFH1nDERwgLiLdkbSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZxN438Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZxN438Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889581; x=1777425581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8WJS/1Wa3PFxeoPjsNH484tGSg7pwut6gEk/4UbNqhQ=;
  b=FZxN438Z4pKIfbAZEgx47LmdpYTlRIG+UbvqraGuSdBaWyiMbMuyvPr+
   E5PS76QqYzEiROjSD63B12dgsEC7AX+usJDh0XtObROs4IyZFUWdpZAt0
   x6q9AsQPHqHv12SZZhAh4DjGLxNXcCNUX+NAalCxMvT6PBzxAD9KydUVZ
   NNR+p8RiDT56ioUYRP6419KZFAwWGDJAdDrGjsNsK3DoIrUwC+6726IGG
   Cu/RClPez6ufbGKFvqGXnbsIVnLYYvjcQmHrYjHxkvIQpOdK+aWumAOC6
   siFKvdSXONaZA0TUQkPt57a8LEaVvFNRL29gZzEMCH/m9jPB1IfOWrVDC
   Q==;
X-CSE-ConnectionGUID: Z/8//txcSh2qDqKvbDgf5A==
X-CSE-MsgGUID: fXiTDLjeSwa0RzjeyhL9yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="50154549"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="50154549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:36 -0700
X-CSE-ConnectionGUID: JT6h6hI9THSCM+zS3RvgTQ==
X-CSE-MsgGUID: Vb7CG/91RaS9xkajNjxlxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="133561624"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Apr 2025 18:19:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdE-0000Fk-2q;
	Tue, 29 Apr 2025 01:19:32 +0000
Date: Tue, 29 Apr 2025 05:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/linux/ktask.h:123:21: warning: cast between incompatible function
 types from 'int (*)(long unsigned int,  long unsigned int,  struct
 vfio_pin_args *)' to 'int (*)(void *, void *, void *)'
Message-ID: <202504290542.wZ43d7od-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   230c2b30f879859ac3e9d3cc46407a9dbb103160
commit: b0908eee74d6b5fdec924e1fcfcdb8184888ee61 [1597/1597] vfio: parallelize vfio_pin_map_dma
config: arm64-randconfig-003-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290542.wZ43d7od-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290542.wZ43d7od-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290542.wZ43d7od-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_iommu_type1.c:45:
   drivers/vfio/vfio_iommu_type1.c: In function 'vfio_pin_map_dma':
>> include/linux/ktask.h:123:21: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct vfio_pin_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |   .kc_thread_func = (ktask_thread_func)(thread_func),      \
         |                     ^
   include/linux/ktask.h:139:3: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |   KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
         |   ^~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_iommu_type1.c:1120:2: note: in expansion of macro 'DEFINE_KTASK_CTL'
    1120 |  DEFINE_KTASK_CTL(ctl, vfio_pin_map_dma_chunk, &args, PMD_SIZE);
         |  ^~~~~~~~~~~~~~~~
>> include/linux/ktask.h:163:25: warning: cast between incompatible function types from 'void (*)(long unsigned int,  long unsigned int,  struct vfio_pin_args *)' to 'void (*)(void *, void *, void *)' [-Wcast-function-type]
     163 |  ((ctl)->kc_undo_func = (ktask_undo_func)(undo_func))
         |                         ^
   drivers/vfio/vfio_iommu_type1.c:1122:2: note: in expansion of macro 'ktask_ctl_set_undo_func'
    1122 |  ktask_ctl_set_undo_func(&ctl, vfio_pin_map_dma_undo);
         |  ^~~~~~~~~~~~~~~~~~~~~~~


vim +123 include/linux/ktask.h

c48676ef6b6f9c Daniel Jordan 2019-08-14  120  
c48676ef6b6f9c Daniel Jordan 2019-08-14  121  #define KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size)	     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  122  	{								     \
c48676ef6b6f9c Daniel Jordan 2019-08-14 @123  		.kc_thread_func = (ktask_thread_func)(thread_func),	     \
69cc5b58cc50d2 Daniel Jordan 2019-08-14  124  		.kc_undo_func = NULL,					     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  125  		.kc_func_arg = (func_arg),				     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  126  		.kc_min_chunk_size = (min_chunk_size),			     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  127  		.kc_iter_func = (ktask_iter_range),			     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  128  		.kc_max_threads = 0,					     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  129  	}
c48676ef6b6f9c Daniel Jordan 2019-08-14  130  
c48676ef6b6f9c Daniel Jordan 2019-08-14  131  /*
c48676ef6b6f9c Daniel Jordan 2019-08-14  132   * KTASK_CTL_INITIALIZER casts 'thread_func' to be of type ktask_thread_func so
c48676ef6b6f9c Daniel Jordan 2019-08-14  133   * clients can write cleaner thread functions by relieving them of the need to
c48676ef6b6f9c Daniel Jordan 2019-08-14  134   * cast the three void * arguments.  Clients can just use the actual argument
c48676ef6b6f9c Daniel Jordan 2019-08-14  135   * types instead.
c48676ef6b6f9c Daniel Jordan 2019-08-14  136   */
c48676ef6b6f9c Daniel Jordan 2019-08-14  137  #define DEFINE_KTASK_CTL(ctl_name, thread_func, func_arg, min_chunk_size)    \
c48676ef6b6f9c Daniel Jordan 2019-08-14  138  	struct ktask_ctl ctl_name =					     \
c48676ef6b6f9c Daniel Jordan 2019-08-14  139  		KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) \
c48676ef6b6f9c Daniel Jordan 2019-08-14  140  
c48676ef6b6f9c Daniel Jordan 2019-08-14  141  /**
c48676ef6b6f9c Daniel Jordan 2019-08-14  142   * ktask_ctl_set_iter_func - Set a task-specific iterator
c48676ef6b6f9c Daniel Jordan 2019-08-14  143   *
c48676ef6b6f9c Daniel Jordan 2019-08-14  144   * Overrides the default iterator, ktask_iter_range.
c48676ef6b6f9c Daniel Jordan 2019-08-14  145   *
c48676ef6b6f9c Daniel Jordan 2019-08-14  146   * Casts the type of the iterator function so its arguments can be
c48676ef6b6f9c Daniel Jordan 2019-08-14  147   * client-specific (see the comment above DEFINE_KTASK_CTL).
c48676ef6b6f9c Daniel Jordan 2019-08-14  148   *
c48676ef6b6f9c Daniel Jordan 2019-08-14  149   * @ctl:  A control structure containing information about the task.
c48676ef6b6f9c Daniel Jordan 2019-08-14  150   * @iter_func:  Walks a given number of units forward in the task, returning
c48676ef6b6f9c Daniel Jordan 2019-08-14  151   *              an iterator corresponding to the new position.
c48676ef6b6f9c Daniel Jordan 2019-08-14  152   */
c48676ef6b6f9c Daniel Jordan 2019-08-14  153  #define ktask_ctl_set_iter_func(ctl, iter_func)				\
c48676ef6b6f9c Daniel Jordan 2019-08-14  154  	((ctl)->kc_iter_func = (ktask_iter_func)(iter_func))
c48676ef6b6f9c Daniel Jordan 2019-08-14  155  
69cc5b58cc50d2 Daniel Jordan 2019-08-14  156  /**
69cc5b58cc50d2 Daniel Jordan 2019-08-14  157   * ktask_ctl_set_undo_func - Designate an undo function to unwind from error
69cc5b58cc50d2 Daniel Jordan 2019-08-14  158   *
69cc5b58cc50d2 Daniel Jordan 2019-08-14  159   * @ctl:  A control structure containing information about the task.
69cc5b58cc50d2 Daniel Jordan 2019-08-14  160   * @undo_func:  Undoes a piece of the task.
69cc5b58cc50d2 Daniel Jordan 2019-08-14  161   */
69cc5b58cc50d2 Daniel Jordan 2019-08-14  162  #define ktask_ctl_set_undo_func(ctl, undo_func)				\
69cc5b58cc50d2 Daniel Jordan 2019-08-14 @163  	((ctl)->kc_undo_func = (ktask_undo_func)(undo_func))
69cc5b58cc50d2 Daniel Jordan 2019-08-14  164  

:::::: The code at line 123 was first introduced by commit
:::::: c48676ef6b6f9cb8497d6264ae9ff71b87630337 ktask: multithread CPU-intensive kernel work

:::::: TO: Daniel Jordan <daniel.m.jordan@oracle.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
