Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2A8005C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 23:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711150065; cv=none; b=Bg8HqHX0I021tMEorV7z/Z1mE/429jFNcskucUuMtT+JHR2ZagQiLkMbUI6aEa2h70eFIY5fouxdj7WSv047hKNFQ2DlA0PqOx5kYao8vuxH3YDF13TcGRx7yK7LUHTYd75H2e955JZGXPGfxgZtc+uc4Ws32iitlMYfA1nH330=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711150065; c=relaxed/simple;
	bh=92sqvd4L8AdJ96GBH+WtY+w6bUxhWY3sYPEtKPU9byE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ij9Aoah7GbGHjJ2UNmjgd5sWmlTO+lX6hJ+WkQ8D7XJXxPOTtXnQ8YZUcY/DAyGaPxUd836VG+s2R9V8SMM+fpKjI8jtvG+D0rP3ToW5Oj4yJyo00Y5JoqVw6EazZw/9t2bvQ7hFYEqHqsl1T920O67zP67Xsd3fXsHIZUkXmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9WxRiuQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9WxRiuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711150063; x=1742686063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92sqvd4L8AdJ96GBH+WtY+w6bUxhWY3sYPEtKPU9byE=;
  b=J9WxRiuQf/fXBTX2jdFc2kq31O1EpvWmC5mkVdzJoOq8n1Mk+qXq3LJG
   tZn6ZIYZ6hWJk590qeEix6+I5iw0rzxyqMGFtNEKdZTiOU8kjVSKW02Bq
   T0SEYOICHz1zw9kni2NMKTvgdY+OJctq1Wl/n23XE4ZCr1bVFezFUikl2
   gRUPK/2kE7mOzqkdrYfGeWxKDl9ZYZKXnzkwIzZl29k0mLwiUjqhuCIQt
   2q5w6y5UKQcrrZe0P1+l43V3shjT9CQHE2+mwNJpdQihJNWjMP0nn+/UH
   kQj7VcUwqXqskmThTM3j9glB4vIe4vSEwxcKo7xMzCRZavSaPXE3KcMxW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6340632"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6340632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 16:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="38180452"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2024 16:27:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnoIV-000KhL-0X;
	Fri, 22 Mar 2024 23:27:39 +0000
Date: Sat, 23 Mar 2024 07:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 59/69] include/linux/build_bug.h:78:41:
 error: static assertion failed: "sizeof(struct idpf_tx_queue) ==
 ALIGN((((64) + ((__typeof__(64))((1 << 6)) - 1)) & ~((__typeof__(64))((1 <<
 6)) - 1)) + (((96) + ((__typeof__(96))((1 << 6)) - 1)) &
 ~((__typeof__(96))((1 <<...
Message-ID: <202403230707.EOC7wUrV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b336f2db592517d25e745924c92e8604eeea0502
commit: 728a6d13aee720362ad473ff503eed6ca0697694 [59/69] idpf: prepare structures to support xdp
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240323/202403230707.EOC7wUrV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230707.EOC7wUrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230707.EOC7wUrV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from include/net/libeth/xdp.h:7,
                    from drivers/net/ethernet/intel/idpf/idpf_xdp.c:4:
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) == ALIGN(672, __LIBETH_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:444:1: note: in expansion of macro '__libeth_cacheline_group_assert'
     444 | __libeth_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) == ALIGN(96, __LIBETH_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:36:9: note: in expansion of macro '__libeth_cacheline_group_assert'
      36 |         __libeth_cacheline_group_assert(type, read_write, rw);              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: in expansion of macro '__libeth_cacheline_set_assert'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct idpf_tx_queue) == ALIGN((((64) + ((__typeof__(64))((1 << 6)) - 1)) & ~((__typeof__(64))((1 << 6)) - 1)) + (((96) + ((__typeof__(96))((1 << 6)) - 1)) & ~((__typeof__(96))((1 << 6)) - 1)) + (((32) + ((__typeof__(32))((1 << 6)) - 1)) & ~((__typeof__(32))((1 << 6)) - 1)), __LIBETH_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:25:9: note: in expansion of macro 'static_assert'
      25 |         static_assert(sizeof(type) == ALIGN(sz, __LIBETH_LARGEST_ALIGN))
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:38:9: note: in expansion of macro '__libeth_cacheline_struct_assert'
      38 |         __libeth_cacheline_struct_assert(type,                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:733:1: note: in expansion of macro '__libeth_cacheline_set_assert'
     733 | __libeth_cacheline_set_assert(struct idpf_tx_queue, 64, 96, 32);
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
