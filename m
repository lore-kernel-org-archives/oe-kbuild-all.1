Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840FB2E6CB3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770452739; cv=none; b=SU1UCiOs7qE0AM7TsV9a1cwMqRhWYwYvwkdDpyHWa14necbqSdbkc9o5c1T3tPF0wflQYiHaAL+YKdDLYZ/RBt48LBcF3+2tlhkR+KDJahzAsRMV/uM3EyOFZXmE0AgYbNTTrMYZnBuzjzrqYhum6i5yn5EZ9aCzpvA/CK8lgjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770452739; c=relaxed/simple;
	bh=T7Zydu4Izus+Poy/RhCGEKnXZoSz4CZQz+ESeXsx12I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hN5ewV+KCCwFTLesRckgiul30TLa7HE9rfXy5HXfQ2Hiy+boYo0XT82xf0eTKziIfO+m94V1jfZsY64Nf10eebpuisB7bQMej3hJsA5yOxtRzLdUsq4gmIm9GdSHNPUPdieUbctxWiZdhbAkpgTj1XC37BQUnHhfmohPq48ILBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awBgpaEV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awBgpaEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770452738; x=1801988738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T7Zydu4Izus+Poy/RhCGEKnXZoSz4CZQz+ESeXsx12I=;
  b=awBgpaEVWoTiWdYPSDwQkEeGbcQJUzw8CtEyc1eAWDy2V3P6WzR5AQ/H
   Yeu0El4CC232UptQRNKRHKdkILkoKJL0qbAFqzBbuYoh4WDSRFc2UKc4E
   pvfZlUcEtGVr23StnD785nU37+qTOladocupEBuIfTMptcnL5kkS29brW
   u1yGGS97htq1cYaIn1Tv8u7rNkash02i8l/TfEscGwVr1/g6pwjon2Xom
   17Zxg+j2vDHAjRLO8IlAVGazTcIMStZUJRao9RbeJEySmKWYvC9SpKVSw
   hU37FziZWug4zNDeozbxaUS+VOr4SFoRGO7+UPHzFCDuOu2pwFslhisla
   w==;
X-CSE-ConnectionGUID: aXobiRLNQqS+M7vCe/PgRg==
X-CSE-MsgGUID: rmfk3AuySYuESeoyzMNdsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="82762321"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="82762321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 00:25:38 -0800
X-CSE-ConnectionGUID: T/8TPPEaRNy5NRmyQkkvbQ==
X-CSE-MsgGUID: 6YUKh6laTmq6Yt7mG9RojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="241436547"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2026 00:25:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voddG-00000000lVs-1OK3;
	Sat, 07 Feb 2026 08:25:34 +0000
Date: Sat, 7 Feb 2026 16:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/7] mm/slab: introduce k[v]free_rcu() with struct
 rcu_ptr
Message-ID: <202602071648.vowybwDl-lkp@intel.com>
References: <20260206093410.160622-2-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206093410.160622-2-harry.yoo@oracle.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260205]
[also build test ERROR on v6.19-rc8]
[cannot apply to akpm-mm/mm-everything linus/master vbabka-slab/for-next rcu/rcu/dev v6.19-rc8 v6.19-rc7 v6.19-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-slab-introduce-k-v-free_rcu-with-struct-rcu_ptr/20260206-173717
base:   next-20260205
patch link:    https://lore.kernel.org/r/20260206093410.160622-2-harry.yoo%40oracle.com
patch subject: [RFC PATCH 1/7] mm/slab: introduce k[v]free_rcu() with struct rcu_ptr
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20260207/202602071648.vowybwDl-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071648.vowybwDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071648.vowybwDl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/time.h:5,
                    from include/vdso/auxclock.h:5,
                    from lib/vdso/gettimeofday.c:5,
                    from <command-line>:
>> include/linux/types.h:257:29: warning: declaration does not declare anything
     257 |         struct callback_head;
         |                             ^
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from arch/mips/include/asm/page.h:14,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from arch/mips/include/asm/vdso.h:10,
                    from arch/mips/include/asm/vdso/vdso.h:15,
                    from arch/mips/include/asm/vdso/gettimeofday.h:16,
                    from include/vdso/datapage.h:196,
                    from lib/vdso/gettimeofday.c:6:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rcu_head) == sizeof(struct rcu_ptr)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1127:1: note: in expansion of macro 'static_assert'
    1127 | static_assert(sizeof(struct rcu_head) == sizeof(struct rcu_ptr));
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
