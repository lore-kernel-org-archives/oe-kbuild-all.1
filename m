Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1115A140381
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713361582; cv=none; b=Cq+JnyDpp3+TMlgOpv+oAHqJCzGt9PWXHBldrWH4HPu8ruZhLkyD4Y9VPeXL2C7GfW/U08qbysSDrP2ZmKR+5QKKhJnkv55/IKuNZ0Qj+mF8wy1j48/MWD+w5WF60VlvQfqxUrmDEJjgQgn77d0J6014kQXngDFK5QdGVmW0qn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713361582; c=relaxed/simple;
	bh=6XdZcKvLocCBNz4KGQgKkbZnXgfTKr8yKYEgYdMdnPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r6RzxfuJ2xdP4FDVx4Y1Ay7B+eS1rwaKgxKgsRvbf7Y/IrGS9xcI41HMmCdUv6p1Ozyj8BSWcTjRgZoOUp3mgLTkdp+79TKXumnDLaQkQo8/iFPXxVh52AzGpjqOLofmYOMBdxQpNcTUE1nZDCkT6CVQrQq4L3XiwjwnMhp+GYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7RxXB4A; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7RxXB4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713361580; x=1744897580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XdZcKvLocCBNz4KGQgKkbZnXgfTKr8yKYEgYdMdnPY=;
  b=Z7RxXB4AvgbyDeJM7/X2wB0Zwz+DDf0wsNV6kB56rsQoz6zd3sRsTxLB
   tsSt1DmcP+mpxcPXoANSKxUBHRKsnYAWTcTJl7NyMTnawGvYWO0cjJcC8
   nZcBInWCBb8RKHWpOmSWck8+Pag+TNRSH752AWr5tl482XPWmmEzea+Za
   syLSx2wqY+8AEgxkti4u0qRnUfPWxVSKZ7nfYWcPdfhbP7BAfGs3ZHy74
   mQleypdvKalCCeabusXaz1j5Tw4ZutOzb0fu1sYGhp2M4No4Amjf5235f
   jL/LmHbcvo1LyJXSOQjvIdWcSeC6zweZe/1cKbDMX6J8OJ8EIcr4NVNdD
   g==;
X-CSE-ConnectionGUID: 1z16rpLDQSWSLoF4Ogwkng==
X-CSE-MsgGUID: xjmHMJR2S4+dYKDBilheJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8732341"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8732341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 06:46:19 -0700
X-CSE-ConnectionGUID: NnCck7fkQSaFXhAKlzPpHg==
X-CSE-MsgGUID: Awiyp1yAS2++goDNXJR/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="53840612"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Apr 2024 06:46:18 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx5c8-0006dq-0R;
	Wed, 17 Apr 2024 13:46:16 +0000
Date: Wed, 17 Apr 2024 21:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Kubiak <michal.kubiak@intel.com>
Subject: [alobakin:idpf-libie-new 71/78] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_tx_queue,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue,
 __cacheline_group_begin__read_write) <= ALIGN(4 + (__builtin_offsetof(struct
 idpf_tx_qu...
Message-ID: <202404172133.N0ecBzAn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   4967113e08d65181db24e0abda80681ed6a18587
commit: 6aaf730e056ddec06975b940864254ba7e2366bb [71/78] idpf: add support for XDP on Rx
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240417/202404172133.N0ecBzAn-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404172133.N0ecBzAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404172133.N0ecBzAn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/microblaze/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:12,
                    from drivers/net/ethernet/intel/idpf/xdp.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) <= ALIGN(4 + (__builtin_offsetof(struct idpf_tx_queue, stats) + sizeof((((struct idpf_tx_queue *)0)->stats))) - (__builtin_offsetof(struct idpf_tx_queue, next_to_clean) + sizeof((((struct idpf_tx_queue *)0)->next_to_clean))), __LIBETH_LARGEST_ALIGN)"
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
