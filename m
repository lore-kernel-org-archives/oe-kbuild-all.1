Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5401401B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753518804; cv=none; b=AwyGcmld9d9W62XuviYNu+PMmz780RLSl1BSD2S6ABlhzlL5sCAEctNu/3Lst8v8uP+fvLF6M/UmaR1TyXgmRSi1HaKnA4pSH9AJ0HpKyjZVHTFxVkfhRspBESeiQ3Q5yNrs5GRbyXZUjfAPZaNjkjG3CkFaJpMW+f3mc0whOJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753518804; c=relaxed/simple;
	bh=d6I2NDYuAXO18rV3UUQi9fQNM8d6Yvei0YFI+8kaAns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCJ0DQkL4MjVSzHhqDSKJ7CzmBv4Ewv+deZfUQ+wZrErf+ui4Y/ApK+SN6hoBeKhwiZSDnlwKjtb8YKp7Ehfg/NFH3FiFOAfHmO0IVrord3Cc1i66YpOgyxiV8TYYq34xRwwsBVHI9sYlrVBgT/0z3eagncaObTQnULt0WFBg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXCiYYyD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXCiYYyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753518803; x=1785054803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6I2NDYuAXO18rV3UUQi9fQNM8d6Yvei0YFI+8kaAns=;
  b=cXCiYYyDiP9E/75XsJQQIy+pXee7CGclOcOIDv5BCCTSlrqXbsl/HYap
   m+xaShd/mN5cA7naVN9MPJ4lm0selkWtZ1zJP/o3Dh1Zcrjq98/LgcVQN
   zhf9Y0v2+L22miPeCZdgVxCrAmfZ02+80eCm0EmcjI0flPKhjd+VP/Idg
   VradFkFp8qGCn6MA1q70P7tyyQp1D+5fYI3DNiZgqDl9k+UKKrbXRavfb
   zmRuw+JRyrVLREKYJnOGxXHHSykGfncOfgctgihuloPmVcWGVNNW8xAJi
   geZTD2iMM84/oSuh5Yh+fcz6oRqG8jk0q6/3IHb/mq9/Q67VJOqcjZ9Qm
   g==;
X-CSE-ConnectionGUID: HayxkAfVQliHKJia6aE6XA==
X-CSE-MsgGUID: GDsr+VSKTTCgQzbQRwt5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55700660"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55700660"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 01:33:22 -0700
X-CSE-ConnectionGUID: 04Wr/1VbSGuZmDw1/dJMnA==
X-CSE-MsgGUID: CyeCVfj8QTagzl+CwXWkXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166803351"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jul 2025 01:33:21 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufaLG-0000Ff-1n;
	Sat, 26 Jul 2025 08:33:18 +0000
Date: Sat, 26 Jul 2025 10:33:10 +0200
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7720/12319]
 include/linux/compiler_types.h:568:38: error: call to
 '__compiletime_assert_627' declared with attribute error: min(__x, __y)
 signedness error
Message-ID: <202507261049.TaRWtUpl-lkp@intel.com>
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
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: e227c8cdb47b586ebf20b6b4caca0a30bb7e6b68 [7720/12319] io_uring/net: use passed in 'len' in io_recv_buf_select()
config: parisc-randconfig-2004-20250719 (https://download.01.org/0day-ci/archive/20250726/202507261049.TaRWtUpl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261049.TaRWtUpl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261049.TaRWtUpl-lkp@intel.com/

Note: the linux-next/master HEAD d7af19298454ed155f5cf67201a70f5cf836c842 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'io_recv_buf_select',
       inlined from 'io_recv' at io_uring/net.c:1145:9:
>> include/linux/compiler_types.h:568:38: error: call to '__compiletime_assert_627' declared with attribute error: min(__x, __y) signedness error
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


vim +/__compiletime_assert_627 +568 include/linux/compiler_types.h

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
