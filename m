Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAB2472B5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762290034; cv=none; b=Z8LB+ak9RJvF74aDxkO9PLeNuQhFWhZQr0MSn/Yc5soJ2kidPGmX75rX/rLt6eKYP5Gdurqdg0uL4Q/q2jS2dSNGAGWZg1ySUum7Tl8k0uYQHctWWKa81dahIgKIL0TXKp4c6IjCMu6ipavZAxd1iAJI9B/poshYpaQ5m0Lu548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762290034; c=relaxed/simple;
	bh=vvYxKIUrSdWb7P7kla4tzTAhiLfBY/lNMAhBzEO8Kck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESs8hhhyDnx923Rq/RNGsGhPsFsmd0bqAdjrX1ZxCslq48BCALMy0fYk7N77XQUMeNCpGs3xIdLs9YOKeR5rOMLSpopfg7I1g93dvxniRdccSoDwlZLSDvvLOn7r/2k/ckR5Gr/CLtIMo3Mzg2yfjIzbtOwug6cQZ1XRi4Sn5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMR8bh0Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMR8bh0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762290033; x=1793826033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vvYxKIUrSdWb7P7kla4tzTAhiLfBY/lNMAhBzEO8Kck=;
  b=QMR8bh0ZSHLesE2BPxrw/lEWmtmT4jFHpIMZy+Hbxz950zBhf3UrghqZ
   pFuDS5gewbzzQk1x7UO/HF65EMraJI5CRSiECIDPQyOX91EVG71M9+c5H
   x9F7BoQT/f2OaVuIVAZWPqe7GGV6upIKoeNumb0MPXzwy4PFWVBtScrUo
   syn0TLxXGOKXEu4dJdA1dDQipbOZSAAGuOiLYM920pvto1dNRfY3z6S9m
   egXTTAhd6/hF8McWxesW3d6EmjTGJ9VPAdcJmcpZtx1Vg9qdRjUhNrQyT
   eAJcolU7iNy5YVgbTxA7+r+q/DghFAKejDQAPswW48pgnKWbyDUb8Qtwl
   g==;
X-CSE-ConnectionGUID: zscivL46TdGcAmXIW+oInw==
X-CSE-MsgGUID: cc6OleuvSpaJNwobubiFdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75745403"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="75745403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 13:00:32 -0800
X-CSE-ConnectionGUID: mKZTRvqtQtamuVj+hKt0RQ==
X-CSE-MsgGUID: D2ZFmro5S0W4KvCVvlTCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="187708343"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2025 13:00:31 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGO8i-000RpH-2S;
	Tue, 04 Nov 2025 21:00:28 +0000
Date: Wed, 5 Nov 2025 05:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slab-fms-cleanup 2/4] include/linux/build_bug.h:78:41:
 error: static assertion failed: "sizeof(struct slab) <= sizeof(struct page)"
Message-ID: <202511050414.ZNuTGTPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-fms-cleanup
head:   e401df7388463ed094dca0ba9c7bac58b1ee4cc7
commit: 382037dcfead97fb0a66368b8237220a7f4a661b [2/4] slab: move counters union to freelist_aba_t
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511050414.ZNuTGTPZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050414.ZNuTGTPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050414.ZNuTGTPZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/mempool.c:13:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct slab) <= sizeof(struct page)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   mm/slab.h:107:1: note: in expansion of macro 'static_assert'
     107 | static_assert(sizeof(struct slab) <= sizeof(struct page));
         | ^~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c4 Ian Abbott       2017-07-10  60  
6bab69c65013bed Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013bed Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013bed Rasmus Villemoes 2019-03-07  63   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013bed Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013bed Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013bed Rasmus Villemoes 2019-03-07  67   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013bed Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013bed Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013bed Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013bed Rasmus Villemoes 2019-03-07  72   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013bed Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013bed Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013bed Rasmus Villemoes 2019-03-07  76   */
6bab69c65013bed Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013bed Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013bed Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79d Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
