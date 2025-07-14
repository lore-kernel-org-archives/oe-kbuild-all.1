Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56DF23C4EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752529644; cv=none; b=SGZrUeuRudciSMzyESm3cg+fZl24sjbP0H3idYE6yB5Akwub9hfY6e/3LCzZ6NTpthXHkEOwQD2PrFx3t295aKw1JMAUJmlULL325gYGXp/d0yniuEYWR+4kx2m/ZDPcVN6RTB0Jsk9GyfQTyAPuwojB1kmpSZAnkH6XfAYP+mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752529644; c=relaxed/simple;
	bh=TMS1Gk1IbBKnsb85a68U2K9CbvykPO5H2qhhLKloUTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OEXl1G4FcmF1gr0/TN8b736LdP0SCuimtYz8Qh6ubIfyQ+Rpx14c1YJv00fqICt1NhBgDArI/eO9KvCJiiL6PAaaUeTPJsy4UB9BYNO9tRlnAh/EClIU3/kvsfvjmgUIHhqxJBdkrFrNytA7VzH+zoPfGKeo/KVzOTD9Q2mgBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld/Lm2k7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld/Lm2k7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752529643; x=1784065643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMS1Gk1IbBKnsb85a68U2K9CbvykPO5H2qhhLKloUTg=;
  b=ld/Lm2k7BihXT1s9v6/Sj3my8rJBxvbiFn6sDx/UuWrG9Mb7k3Bq5kYC
   b6OCiUH/tEjWR5PhesdWPX2vmdqV10GRCUZfdM5Y/jkSBu1CemLlAI5gZ
   EFVVhAlkUZZe6TX8KKxoF7HoKFIt/fATJnbXoywj/ynmNS3mx8iYPnrET
   vpMS9BirLSRBLVfwFv0WyPEXn65NV5VeFidRvlD46qIf/NiNEYzF/TMEY
   zszBeXaABQSPa/LrrQYp5jHciE+45DbZLNMEP2aYshHwl0itUel5WpPWh
   epwJYDGbDECEjcJNZRD+YLTUV4+6i4yBSR6llBR/yc/B9H5CWbDrOM/N1
   A==;
X-CSE-ConnectionGUID: CSVqVz1sQV+uGWIVWr63WA==
X-CSE-MsgGUID: Xq5TFbeuSXG2aMNsbBwSyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65306157"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="65306157"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 14:47:22 -0700
X-CSE-ConnectionGUID: jYqfISh5SBO/BItxQz6qbg==
X-CSE-MsgGUID: P/a5emDcQcypXbphIv0SiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="188040060"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jul 2025 14:47:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubR14-0009NT-30;
	Mon, 14 Jul 2025 21:47:18 +0000
Date: Tue, 15 Jul 2025 05:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8324/9557] include/linux/compiler_types.h:568:38:
 error: call to '__compiletime_assert_614' declared with attribute error:
 min(__x, __y) signedness error
Message-ID: <202507150504.zO5FsCPm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0be23810e32e6d0a17df7c0ebad895ba2c210fc4
commit: e227c8cdb47b586ebf20b6b4caca0a30bb7e6b68 [8324/9557] io_uring/net: use passed in 'len' in io_recv_buf_select()
config: xtensa-randconfig-r123-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150504.zO5FsCPm-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250715/202507150504.zO5FsCPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150504.zO5FsCPm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'io_recv_buf_select',
       inlined from 'io_recv' at io_uring/net.c:1145:9:
>> include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_614' declared with attribute error: min(__x, __y) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:549:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:568:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   include/linux/minmax.h:179:39: note: in expansion of macro 'min'
     __x == 0 ? __y : ((__y == 0) ? __x : min(__x, __y)); })
                                          ^~~
   io_uring/net.c:1079:18: note: in expansion of macro 'min_not_zero'
       arg.max_len = min_not_zero(*len, kmsg->msg.msg_inq);
                     ^~~~~~~~~~~~


vim +/__compiletime_assert_614 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569  

:::::: The code at line 568 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
