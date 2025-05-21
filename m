Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE142254869
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822308; cv=none; b=eB023Scuvrh5/l29oyv8xUTkO1oAuUKIf2aOYoduOmZot8707EvcZ3Iex7QuQH0SCLk0AxoqRj9yPhdB4CYvMD1qCTrcPtPG4/PF6KfJgPvg9CShzm5YuIxEM0pLTOpXxojvRQA2OL7XqVawacae6xMK5VKNn60J0fVFn6Ac94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822308; c=relaxed/simple;
	bh=fj3n1rUk0Hb1cBtVASv9EhUFHybcRGppy2+gHRLRoNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eajCcO9jOYFftr0HXyOz7SWLKT7gdTh/AqI6AWNWOQujYrnmGeDSQdrzivp41hPqCHVBrmw5Uu+UKhZKWEI/kap/pDPXi19S+r4+Mu2Hqs74toJeuLQiuxAJTKTZwpg/kM8B0ny8/bHSbVe5phGIHqj6L9Bb/Qecn+NJWb8ElTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9dcH6SJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9dcH6SJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747822307; x=1779358307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fj3n1rUk0Hb1cBtVASv9EhUFHybcRGppy2+gHRLRoNE=;
  b=d9dcH6SJQkfOQO42EEKpld+p5PpmXCQtWmDaTJ7jPnGpIQy4mg/Majei
   CN2h8qU9vMGYBiZdBUbYfagd0Tq3uzGImrgKLo9crqJMVqQRcUrEiQjSa
   zXCYyy356S6h5GpnMf8hFh7r+oC1z+r0LRVICknGmfmBHwO7dqc1Ilxr3
   4mpi4N8UUIdvQDm0A9HytP3GvIQ7dwPTS2koCH9A90X0zqWGhPuCiRN6/
   j5ACDTwIcf6x33xnhpvGtlYJRkzkOraS87bJ/bgseebMXoBUPr8OYXQFv
   qryiWetYwpx/GM05pA6ht8op/BEUfprx7NxGGbqaQ14c4ajnk4qVTCscQ
   Q==;
X-CSE-ConnectionGUID: TSrrN9gER26u/9205PgCNA==
X-CSE-MsgGUID: 6CqS4ME7SziJR9xUj61+1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49717987"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49717987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:11:46 -0700
X-CSE-ConnectionGUID: yoPJelr/QtS7VAFxn8LvhA==
X-CSE-MsgGUID: 9hKcquakR1GMmGtWMdU2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140510795"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2025 03:11:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHgQI-000O8O-2Q;
	Wed, 21 May 2025 10:11:42 +0000
Date: Wed, 21 May 2025 18:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 2016/11779]
 include/linux/compiler_types.h:557:45: error: call to
 '__compiletime_assert_748' declared with attribute error: Need native word
 sized stores/loads for atomicity.
Message-ID: <202505211820.JOq2y5qj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daisuke,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: b84001ad0ceeb34bc3fd6c383f197326d4fe8353 [2016/11779] RDMA/rxe: Enable ODP in ATOMIC WRITE operation
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250521/202505211820.JOq2y5qj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211820.JOq2y5qj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211820.JOq2y5qj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/infiniband/sw/rxe/rxe_odp.c: In function 'rxe_odp_do_atomic_write':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_748' declared with attribute error: Need native word sized stores/loads for atomicity.
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:560:9: note: in expansion of macro 'compiletime_assert'
     560 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:141:9: note: in expansion of macro 'compiletime_assert_atomic_type'
     141 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_odp.c:420:9: note: in expansion of macro 'smp_store_release'
     420 |         smp_store_release(&va[page_offset >> 3], value);
         |         ^~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_748 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
