Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FED190462
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731781800; cv=none; b=TrXBk7rQpMtyWjqdrQqeUV951pidCyFtCprfjJfrg+qHL9y4bA/wJcrCBY07vN/4PglMjgJiI95KY7h0IIDtjo5uhLJ3q9w6uCawxmFgy4H7r0/2lh9E5kIyfbfKh/Oi5C8ppz1hHnd9HsC4tDmeSgazHYGq5TGt+0pth1+Xs7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731781800; c=relaxed/simple;
	bh=nLcdQ0w3zye+Hzb7wS+goBsCy+u8cHgux//UJtiYvuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I6ceahNw/W3rNEmC94HJBsekyu8tsEmOt8xzl71dqwFuv/rK3+KYdZQWH/Ytmr7ngtprEgHPmVvGLKWpWdvSq+4vOVp/PP2phZD4mEZcJA8kkkfoHfXmepkn5lCQjYNzxo5fhiwoyjIrlKpRa9DHfN3FZ36zYE/xYRsKcY4xciQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib3dwUfq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib3dwUfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731781799; x=1763317799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLcdQ0w3zye+Hzb7wS+goBsCy+u8cHgux//UJtiYvuI=;
  b=Ib3dwUfqK4e71TUnTJiqJv3niggGByA2TtY8VUulgFzkAyPY46jGnVhT
   6z4TNccIs8EinD0UNcpjFLLl4YHr3/rW6AuaCNoGSkP/zBQnv/5Lb2Ki4
   DDLHXfRIgDohN/td3hT+8XPcg6EwjQ4+D0oR/xwCGyF7yNRvQDwgIDWdE
   hWLpg04Adoo58ne04NQnJte+GuawEmGREEecD8nywhm8NjX5pCJVOV4do
   0gBPMJuvHcOZOgUTFv0Ho2iHbduW9f3NL7TkmYmIT+rj2tILjN5rSkSCn
   eZ1x3mqaKJHQxJIJr1ylqNH9N5OHt3+iL1mF3EEtHxmFwGDPf0nRBjO8Y
   g==;
X-CSE-ConnectionGUID: aPLqmathQNOV3sFw7EACgg==
X-CSE-MsgGUID: ZIh+g+nmTxyrSl28eVbU8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54273692"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="54273692"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 10:29:56 -0800
X-CSE-ConnectionGUID: RIDIcrzRSR69NMO1O9XE8Q==
X-CSE-MsgGUID: X0TiUiLsQ/2SRXfvF7SLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="126389374"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Nov 2024 10:29:56 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCNYP-00011l-1q;
	Sat, 16 Nov 2024 18:29:53 +0000
Date: Sun, 17 Nov 2024 02:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11929/11989] include/linux/compiler.h:189:45:
 error: '__UNIQUE_ID_y_676' undeclared; did you mean '__UNIQUE_ID_x_675'?
Message-ID: <202411170253.Q3d4kbWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   744cf71b8bdfcdd77aaf58395e068b7457634b2c
commit: 665a3d4e1107ceb1fc0fe4009d710f3091a0b305 [11929/11989] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git
config: arm64-randconfig-002-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170253.Q3d4kbWs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170253.Q3d4kbWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170253.Q3d4kbWs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/blk-crypto.h:73,
                    from include/linux/blk-crypto-profile.h:10,
                    from include/linux/mmc/host.h:19,
                    from drivers/mmc/host/mmci.c:23:
   include/linux/blkdev.h:1692:24: error: field 'req_list' has incomplete type
    1692 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from <command-line>:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
>> include/linux/compiler.h:189:45: error: '__UNIQUE_ID_y_676' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_675'?
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:503:23: note: in definition of macro '__compiletime_assert'
     503 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:523:9: note: in expansion of macro '_compiletime_assert'
     523 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/compiler.h:189:45: note: each undeclared identifier is reported only once for each function it appears in
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:503:23: note: in definition of macro '__compiletime_assert'
     503 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:523:9: note: in expansion of macro '_compiletime_assert'
     523 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   drivers/mmc/host/mmci.c: At top level:
   drivers/mmc/host/mmci.c:53:21: warning: 'fmax' defined but not used [-Wunused-variable]
      53 | static unsigned int fmax = 515633;
         |                     ^~~~


vim +189 include/linux/compiler.h

fe8c8a126806fe Cesar Eduardo Barros 2013-11-25  188  
a8306f2d4dcea0 Nick Desaulniers     2023-08-31 @189  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4c Rusty Russell        2012-11-22  190  

:::::: The code at line 189 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
