Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4923418027
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 22:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759445944; cv=none; b=Qtm7YF0xrf7EJzU1eb9meXHpd1mteng3fQX/MxO8tgx45QUXT6aeSPyLUdfUhOFiYLBhyOmM0s8KpVdEfqXDHtbnvNTmCGb2uIoVHOavL/5EPC3bIVkdn+ZGvaED2Tais1MTMHQgq+Njn6hE3pfJuWi5Q3f52ioICgxcQpet0c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759445944; c=relaxed/simple;
	bh=1uofHuTcikdFlKFuMoeE1xKi1IV3oBRqbTC2oKoEs/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZttf9Hf4DkEP15YnVAkfs0noGcAhaowoeIzbVfZeyZcc1dIj48CoONy546Pk/RO52FAmpVA2bhr+Bu9n4F5pEbkqm7Vq/de2XQL0Oyj2lufwl+y63YOjX1hBjvrcMfPGyF5GIFxkIlTF2ztOfBVtaIw/lOZIi4MIIi2w5i37b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4xmDLDf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4xmDLDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759445943; x=1790981943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1uofHuTcikdFlKFuMoeE1xKi1IV3oBRqbTC2oKoEs/o=;
  b=k4xmDLDfiuyzdU7kdvgb3HmswxUu8EJGaLqRv1pGD778OFv2SBAX0eMo
   3nYOneUcmfbOSFH+fywonmCnh6r+MIzooH5KJZBzs0gdZ6YVuQJrzMn8/
   yyv9Wq6lY6o7gx1fPxejP9CvsPGyMjz432Iw1wk6uwCgmoSLbOojhwgZ3
   iKVBDprRb6wNwjdJIhVtwNLAy6JQEjnqZwKx6WY3OolxnsKDrL9gq0TVl
   0C9C1bpFrSBXpYWlKEIMUsk/rXgkFQni1pPQ/EArHWJnLllr0KMg8uu8E
   6YTVV0qahwtKrfhScsMJs78f8VmXuC5SgdXaRnlfe0CfO1FAzAb9DVk0D
   w==;
X-CSE-ConnectionGUID: Q4/I6bEfTvaXl5meh2WCuA==
X-CSE-MsgGUID: 88dZHZJwTaW9bgqoFw07PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61699976"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61699976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 15:59:02 -0700
X-CSE-ConnectionGUID: uSqPpK+5SjSiy+eJCj7B7w==
X-CSE-MsgGUID: hZic5iHdTOqEYeBJAUhHIg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Oct 2025 15:59:00 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4SGI-0004B1-0h;
	Thu, 02 Oct 2025 22:58:58 +0000
Date: Fri, 3 Oct 2025 06:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 6/6] include/linux/compiler.h:166:45:
 error: '__UNIQUE_ID_y_353' undeclared; did you mean '__UNIQUE_ID_x_352'?
Message-ID: <202510030703.3pACLe8t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54497cbaadaae5433eaeca76106fecbba90841c8
commit: caeb52b32bd70bc82167f136ab287e2b7a916375 [6/6] ANDROID: cgroup: Use backport reservation for freeze time
config: arm-randconfig-004-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030703.3pACLe8t-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510030703.3pACLe8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510030703.3pACLe8t-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/blk-crypto.h:127,
                    from include/linux/blk-crypto-profile.h:10,
                    from include/linux/mmc/host.h:19,
                    from drivers/mmc/host/mmci.c:23:
   include/linux/blkdev.h:1803:24: error: field 'req_list' has incomplete type
    1803 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from <command-line>:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
>> include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_353' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_352'?
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
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
   include/linux/compiler.h:166:45: note: each undeclared identifier is reported only once for each function it appears in
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
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
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
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
   include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \


vim +166 include/linux/compiler.h

fe8c8a126806fe Cesar Eduardo Barros 2013-11-25  165  
a8306f2d4dcea0 Nick Desaulniers     2023-08-31 @166  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4c Rusty Russell        2012-11-22  167  

:::::: The code at line 166 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
