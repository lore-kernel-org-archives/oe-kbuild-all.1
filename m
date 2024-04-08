Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294C7D095
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712582829; cv=none; b=qe+qf//iSd2xiBTH/IODgmdqwz9x3JaOiUl88lC3W4dmpKbXu4Ev55WxyE12sgW4QrVtmm2T6tMAp88+Jl/xleJeyL2cxnSKACkXioOtpjEDcMmOUO0sXOPIVQKceDa5rAMbTOMfcycDwFDtmgmfW8AOfSo/bpIz7cX/MCQEDEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712582829; c=relaxed/simple;
	bh=o1wEgMGrLxUoIVCirDqp0RgxCLgH2fvzmhaHVy0XxN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdBXi3vQLCx0aZL96RucGGMGhZkxvvkcaL0ZDBZiZwN0XKToNxgjuSHzmbDJe75OUs+oqkvzPmVZ/TKKYL9iNDQpykmvk0yqRaD6x+waZZ4t0Jdx+lM0z4A7C1xcIiFLiNcBInW5H0MT83vrGZYIf107vnWByCBi8nbPrhFquFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5f96amP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5f96amP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712582827; x=1744118827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1wEgMGrLxUoIVCirDqp0RgxCLgH2fvzmhaHVy0XxN8=;
  b=m5f96amPE8nHayfRofSfgRVx/1Kv/ezVFL6uyCTST5xRZH5E7yt+fesi
   5AdGATCt5ejF909rzUWlw5vaB6/Tm1SZs1HGeqBgu0Kcm0Ky+7hfwbO9D
   1u1ISvLGBYspY4LZAdZVpTpG5JVtvovbk4ZE7WdEfXjSitLo80QATGCFF
   xxBKPH7nx+TYbn6DAbAav4uAkTlfgpyUNV8o2eg6H2Kax5VQcdxctU/HE
   nnzDc3Vs64QyKhB/pyZc0MeJjOyb6fMG31QdDzcMae/4Nt7af5H5QNyFV
   vNsSq+U9xb7Yufj3LTplyExSMEvQQKzcadcOqeSE1jF20yk93VhnmSorr
   A==;
X-CSE-ConnectionGUID: lW6UkW+hQbmhRCl4MyWFXw==
X-CSE-MsgGUID: hbV9yR/3Qo+wzvgGTc0b0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11690966"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="11690966"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 06:27:06 -0700
X-CSE-ConnectionGUID: 2ULnB7rERmiJtWVTS/yJGw==
X-CSE-MsgGUID: rCK3mn85Rx6P7hrSulmw1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="50873464"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2024 06:27:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtp1a-0005Dw-02;
	Mon, 08 Apr 2024 13:27:02 +0000
Date: Mon, 8 Apr 2024 21:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: [net-next:main 26/39] include/linux/compiler_types.h:460:45: error:
 call to '__compiletime_assert_907' declared with attribute error:
 BUILD_BUG_ON failed: offsetof(struct tcp_sock,
 __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct tcp_sock,
 __cacheline_group_beg...
Message-ID: <202404082102.UUNpUXV6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   a29689e60ed3e65463d6462390caad669d08a6b7
commit: d2c3a7eb1afada8cfb5fde41489913ea5733a319 [26/39] tcp: more struct tcp_sock adjustments
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240408/202404082102.UUNpUXV6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404082102.UUNpUXV6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404082102.UUNpUXV6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'tcp_struct_check',
       inlined from 'tcp_init' at net/ipv4/tcp.c:4703:2:
>> include/linux/compiler_types.h:460:45: error: call to '__compiletime_assert_907' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_write_txrx) > 92
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:441:25: note: in definition of macro '__compiletime_assert'
     441 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   net/ipv4/tcp.c:4673:9: note: in expansion of macro 'CACHELINE_ASSERT_GROUP_SIZE'
    4673 |         CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_txrx, 92);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_907 +460 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  446  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  447  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  448  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  449  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  450  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  451   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  452   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  453   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  454   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  455   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  456   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  457   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  458   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  459  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @460  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  461  

:::::: The code at line 460 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
