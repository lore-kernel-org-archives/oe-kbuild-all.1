Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3A1ADC69
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Apr 2025 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356164; cv=none; b=PQTnwCb9Bcc/nleaDZkzRbOVhYBw2UwdSzXPlYrndJg+RJOMm24vVGgCQ9AD5yfyO32Vyt9y7erIN1Zl51OKiLRMKGsQuBqKN5+dRlzr4G3wbFUVygwO2JesRIFEX/Yb/Gkpm9IkQrdju4xn8cem8vv1YENuVjkhHWqhRMmM5yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356164; c=relaxed/simple;
	bh=xkMrcOt1vu7jY2dJZj+WtDbsadOjprErB6yNih5kNAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNt4c9whVVkJ+Me+//TZ4b2yD+XWnccGyhzvzokTr5uKlD7p+hkT0DMVRc1goDnLQOIz3b46nsArrTxow2kodXcrPbeKUk/s+t/y86Lz2kbaURrMygCDfmJ/mKHHGrjgw/ExAq5SGiUJjuxYXfH4jLTbNuo54vPTgjLLw+giKnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9o2aNZg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9o2aNZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744356162; x=1775892162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkMrcOt1vu7jY2dJZj+WtDbsadOjprErB6yNih5kNAQ=;
  b=F9o2aNZgueQjhWN2NY0Wy+unuCpyVcEKGh7Ie1XO1UjW6JyzL8DUXUr1
   VUItLc0pk66PcsdSDlht8hCrUeG8QDDkEQseM4GdtWRax6F7chpsYxdNH
   DL0Jic7tfRgDYAtIRtLh9MVPVGIK5lnlo4YWFzx0kuGSiD5YyPfTk66OM
   Bq7wqaW8qPoIrGfM0ySdD4titWcUVQ3MHP+36axXvnUJf0k0mFUTl+Zip
   MwiSAm1hNKwtkgMAZ8loMzTzOu1iIdV0gTkRzLbayg7ZnCImWmeB7gRer
   roeflP1MeS3lPROvpXyWBwk9VtLdN3kabHynF0PLySiv7iXxii8+8gvjJ
   A==;
X-CSE-ConnectionGUID: dCWSgkg4TLm8QoWiEWX9pw==
X-CSE-MsgGUID: AIhA5iISSDyy+U/2orRGjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45140151"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45140151"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 00:22:41 -0700
X-CSE-ConnectionGUID: jVc+c2/vSd6Hj08QHWsOug==
X-CSE-MsgGUID: zBVzTBRZTo68epIwnAtlXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134231233"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2025 00:22:40 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u38ik-000Avm-15;
	Fri, 11 Apr 2025 07:22:38 +0000
Date: Fri, 11 Apr 2025 15:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Daisuke Matsuda <matsuda-daisuke@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 2/42] include/linux/compiler_types.h:557:45:
 error: call to '__compiletime_assert_748' declared with attribute error:
 Need native word sized stores/loads for atomicity.
Message-ID: <202504111508.95Mwh2s3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   a29475f2c916b1a1a4b30b916242b3ad97f930a0
commit: b84001ad0ceeb34bc3fd6c383f197326d4fe8353 [2/42] RDMA/rxe: Enable ODP in ATOMIC WRITE operation
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250411/202504111508.95Mwh2s3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111508.95Mwh2s3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111508.95Mwh2s3-lkp@intel.com/

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
