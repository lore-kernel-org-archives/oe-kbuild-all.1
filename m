Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBE65A106
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709273525; cv=none; b=h/pflE+3YdA8JAhzPfrZnNJla9yxoQkl6y5h2hhTO5X1kcIxS9LqPmjH72v1le0NKMAvQfmT3wJWCueXJlZv799mHucv3zhRxtVpsjmpRMAyxupJ9i/xKdBQsHBpQYuZtMDJ6PiPM7n1rzPx2ZboruJflw6QgSqzBmUDJZYSwos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709273525; c=relaxed/simple;
	bh=IADSChza3GxJ/D2qURiNt0hPK4l5ON5jrYU6O5TAvKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G/qjcNoyljUifRiDlXnK49NY1mnyWZK8S08cBvF1326CQJEOT2a1uJr+y3bTr+k543ew2IKgolrSYr8WTrOZQfNRDjXE8I+fgeNmGLMNavohE+Q8E2tKLrlv0QXy0c8XDopBJuRKXwe0DbQ4OCItChULhq5U+Iplmmst+WV2s4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ma/sm+Kl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ma/sm+Kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709273522; x=1740809522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IADSChza3GxJ/D2qURiNt0hPK4l5ON5jrYU6O5TAvKg=;
  b=Ma/sm+Kl7Chng8RcOXd3TEN+w5PRKZ7xpEkM8bp9zb85DtBIGmVW4SOm
   ZK5gfxRCfkbJKSliSMVLIPSUqURWae0CBKW46T/yzuHr0De2jIP9PJEMi
   Ay652AMuA3blIStXivLXRo1lIhax6bMY8ah6ZXIW4kH38cvC83uBPzIwJ
   Ij+iTsnGCiQNK1PHMY5PfUjBEVXoNiTQtY21bsWThVsOQLAgtAzqXAr6F
   2I9dzfVfrs0v9FbtAPsXYTvnGmC1hR4rVm+taV1U/0I0LxR/c6kkHvqtG
   sUo7O6DFPdirDAwaeMNCNIrUQe7UKQkHudpjse+V4PpV0eBZc8rDTQkeK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3659782"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3659782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 22:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8230532"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Feb 2024 22:12:00 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfw7h-000DaH-15;
	Fri, 01 Mar 2024 06:11:57 +0000
Date: Fri, 1 Mar 2024 14:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@nvidia.com>
Subject: [netdev-net-next:main 28/30] include/linux/compiler_types.h:442:45:
 error: call to '__compiletime_assert_907' declared with attribute error:
 BUILD_BUG_ON failed: offsetof(struct tcp_sock,
 __cacheline_group_end__tcp_sock_write_rx) - offsetofend(struct tcp_sock,
 __cacheline_group_begin...
Message-ID: <202403011451.csPYOS3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   65f5dd4f02a89df429b8212b4c2f3ada6c4f3fc1
commit: 99123622050f10ca9148a0fffba2de0afd6cdfff [28/30] tcp: remove some holes in struct tcp_sock
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240301/202403011451.csPYOS3C-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011451.csPYOS3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011451.csPYOS3C-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'tcp_struct_check',
       inlined from 'tcp_init' at net/ipv4/tcp.c:4700:2:
>> include/linux/compiler_types.h:442:45: error: call to '__compiletime_assert_907' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_rx) - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_write_rx) > 99
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:423:25: note: in definition of macro '__compiletime_assert'
     423 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/cache.h:108:9: note: in expansion of macro 'BUILD_BUG_ON'
     108 |         BUILD_BUG_ON(offsetof(TYPE, __cacheline_group_end__##GROUP) - \
         |         ^~~~~~~~~~~~
   net/ipv4/tcp.c:4687:9: note: in expansion of macro 'CACHELINE_ASSERT_GROUP_SIZE'
    4687 |         CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_rx, 99);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_907 +442 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  428  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  429  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  430  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  431  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  432  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  433   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  434   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  435   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  436   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  437   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  438   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  439   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  440   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  441  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @442  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  443  

:::::: The code at line 442 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
