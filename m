Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39A847C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 00:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734740976; cv=none; b=cma2kaxc9QMdpMS6d7veZvqa5L+Le98CavQMuFKeSH4G70+15rwhGyX2sM1KiDH+3Yfh0WN4NJhHo8Ibdp9V2or55MWxW+8SctW+AGwbC8bJdObs1xXyxlO1T3JqorpGS/cfcthjKmBgF1GFxlWe9GOSbhhzqPL2L2CjvzDgNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734740976; c=relaxed/simple;
	bh=TwXqUAzOkTUikpplVyAS4ZvG8z2BZDokpUKhyPuXpcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XoD7vlqX+Aedz1tA+n78JO5BbBHypIGPJfXHPIwdycKQ11NGS9V8B790x0suii/fJo74Cr065AQ8mhkv7oS+Ryj2ff571dwnQrQdbALH9XqAUBta+GtcSTMyIIK/ZsWENO0Vd8EdAhRfRKwB0lBdXN+xl2TOnuilSRMrHFZZXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbDPKfee; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbDPKfee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734740974; x=1766276974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TwXqUAzOkTUikpplVyAS4ZvG8z2BZDokpUKhyPuXpcc=;
  b=MbDPKfeek7zYyhbuJAGZCPm+kZMOFGjyDq6206VX4wHUWAXNBwFMvwUQ
   /QDdCLcJbmaYwC2Um+sVS+Tsow1Vf3SW5Q3CF2g87Eb6C8sZtXlIgHwMa
   AxLKyPQYl/HF50A+S/Je3FpCeA7IlCzo+H4X0wNGqGXZfhAnztGfhYfsw
   nc3X8YQegpn34Mbyfz0mRuj7Ktw0C5OL1j8d20sreO9VTM4/ki7OqLvlQ
   zJ7XogkByAP6bGLp79n4y/nUVd7X/4OzJ2IjFnwIUmg3YEktIbmKry/Bl
   vzSLrj4DquU4NaeYZWaWYD31CtSP4wJtFeg7vVlwwmy04MwJa99324xdE
   Q==;
X-CSE-ConnectionGUID: H8iVZscgSByifxRrh1SKPg==
X-CSE-MsgGUID: ffYQYezIShWcAHC8UJCS8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52822391"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="52822391"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 16:29:34 -0800
X-CSE-ConnectionGUID: ylhil4NnTo6uhj4vTltJ4A==
X-CSE-MsgGUID: 3UjpYLpzSpesCxTE+gHWMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="98708230"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2024 16:29:33 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOnN4-0001nf-1S;
	Sat, 21 Dec 2024 00:29:30 +0000
Date: Sat, 21 Dec 2024 08:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 12/15] include/linux/build_bug.h:78:41: error:
 static assertion failed: "offsetof(struct idpf_rx_queue,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue,
 __cacheline_group_begin__read_write) <= (88 + sizeof(struct
 u64_stats_sync))"
Message-ID: <202412210842.IKQzmayd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   757d2c6e0fcb01e7b0f7ba5fe9c1ea78564bcd27
commit: c24eb7fec7dbac08f7cd34456cc95a36e6a11ff1 [12/15] idpf: use generic functions to build xdp_buff and skb
config: xtensa-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241221/202412210842.IKQzmayd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210842.IKQzmayd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210842.IKQzmayd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/xtensa/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/idpf_lib.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_write) <= (88 + sizeof(struct u64_stats_sync))"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:24:9: note: in expansion of macro 'static_assert'
      24 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -          \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:62:9: note: in expansion of macro 'libeth_cacheline_group_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);                  \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:598:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     598 | libeth_cacheline_set_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


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
