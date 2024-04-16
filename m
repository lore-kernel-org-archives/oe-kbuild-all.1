Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657265B201
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 22:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713306977; cv=none; b=sT6CHqq3j2o7sZ/DVm7xfFcazWW6abb09qYwvOtUscarfjGruX/i6ap2L2VB55RdYn+Hq774QcPvrRg/e83smmH2fX87mrGhrX0uEpYJDKGtgHAdBt75EbKMnHHA4ckJW1Yp+Z0aMX/bliPX107A83ohRuD9mCgBDMZplLeRKX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713306977; c=relaxed/simple;
	bh=80huPS2u+bvIGbg9SdqhtVS0GUhaOyoikgzNtDjcvfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S7dxAGpX89F+X8nNDdavnsNjjt1Ka1qGxlnliQ2v9HdHxpoSURDuLTy/yVcZBE0F7RAjYcyLInlVGRvaNivVxxwyx5goxkVdP2TP9wjuMD57hexoDYFiTwPTnRz4h91VW1S+5q+o1vWVOmEZSVC26y56vtIH+fUvWzr9Er59Rnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOdwG/+W; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOdwG/+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713306975; x=1744842975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=80huPS2u+bvIGbg9SdqhtVS0GUhaOyoikgzNtDjcvfM=;
  b=JOdwG/+WreSx3zjUqa3a7/RBfmIDxRGgsMHULNL+e+oe636jxpgdJiBE
   TNEHPXg8PVgQlRYkVTDEUoQjh7p1JIrevDB+slPhAf9mNh+j1upy+tkfS
   U1x28qMttPAX5o73bhiTQEByuHfD5yyZt/KAoZpai+7IOOCn4DBoNbswM
   96kBsZrO2QLzUCgv+2bFd7fZ7mmCsdi68LNA+bUZFiAE3UslPtt0tsiOX
   8F7NDX2+aNcA4CNBfwveiDiqTBp1MTqmGR37+6/XI8FQtcEx26RB2lN4t
   hef8++vIwIKLI1+ZBjd3CCApgBIqedxD5cmzEDE5BoTeTN+QmB6KIZqfR
   A==;
X-CSE-ConnectionGUID: FZ7mytMWRqapUZ37Ryl+BQ==
X-CSE-MsgGUID: YIZlHcFnTjWqu8NUzQAEAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19335722"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="19335722"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 15:36:14 -0700
X-CSE-ConnectionGUID: mAEPMFOmSFa3hgkAI6ZfTQ==
X-CSE-MsgGUID: +0RRJ1DuTlqEbYP/6kMloA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22409868"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Apr 2024 15:36:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwrPP-0005no-02;
	Tue, 16 Apr 2024 22:36:11 +0000
Date: Wed, 17 Apr 2024 06:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 70/78] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_rx_queue,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue,
 __cacheline_group_begin__read_write) <= ALIGN(128 + sizeof(struct
 u64_stats_sync), __LI...
Message-ID: <202404170638.bVMRFLrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   472e6c569d5d5052387f59d31d6fb4d688fa0041
commit: 24e2a1b3b0f8db3c41c1ae65ee2a6a6e6eb19e76 [70/78] idpf: use generic functions to build xdp_buff and skb
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240417/202404170638.bVMRFLrB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170638.bVMRFLrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170638.bVMRFLrB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from include/net/libeth/xdp.h:7,
                    from drivers/net/ethernet/intel/idpf/xdp.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_write) <= ALIGN(128 + sizeof(struct u64_stats_sync), __LIBETH_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:28:9: note: in expansion of macro 'static_assert'
      28 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:36:9: note: in expansion of macro '__libeth_cacheline_group_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:568:1: note: in expansion of macro '__libeth_cacheline_set_assert'
     568 | __libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) <= ALIGN(96 + __builtin_offsetof(struct idpf_tx_queue, stats) - (__builtin_offsetof(struct idpf_tx_queue, next_to_clean) + sizeof((((struct idpf_tx_queue *)0)->next_to_clean))), __LIBETH_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:28:9: note: in expansion of macro 'static_assert'
      28 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:36:9: note: in expansion of macro '__libeth_cacheline_group_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:719:1: note: in expansion of macro '__libeth_cacheline_set_assert'
     719 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
