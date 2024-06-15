Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC51EB3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718473415; cv=none; b=Ouel7/EXqukGhfKkZCt17m/CVk7JTsxvRUo7Kk1a3eLqIsSzLqAbopikUp1NRNbMYD8rpQDdPH0aozELz2vmyQAOrRFXUOtN+0rHgroK2GZ2cjFFQnyD6ZeWKcsFpLA7rBZfzdLK/E21QNdRRpUC/N/EuNfj9eTlL9dZocMtNfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718473415; c=relaxed/simple;
	bh=J8K9lnyZQX6l8WMlQlav1nAvOVxYAprTS0WpQLq4P44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJwqQCGUQVGaeJTP78nSkO2j7Ee0XQeFaO+vv+rqWM/mfsNwkdpfDvmb6C+cvXs0EbWwwmlUT1Gh4lLCF5GAIM60to/8ncX7Yc0dxxsXZpU0+jvIhNMAzoP6fmQNsKltIhdsp1au4vxSaVFMPyiSELv0VHv7g97/4q6hyaCoxg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWfsUtEY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWfsUtEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718473413; x=1750009413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J8K9lnyZQX6l8WMlQlav1nAvOVxYAprTS0WpQLq4P44=;
  b=jWfsUtEYxCASbkaRghaQOVCTKylZRSBJgcFjL7C2lai/nw7TJZc335aX
   Bsu/a3VLphq7FtbDR344kRuzGVqpQOFkj+zIDRD5gNx+P54PnpKqqojk9
   UKAx10zVVRSUgnZVFKW0D3j/R++BnVMrN/EaLMCF48Q3o31R5V97uFB1i
   1xhiDSR0C7/tAACzyA3xRkb7Izpc3mlD6k8C4zGMZsttmpN8yv+QjNxmy
   OMdV3RMxWvWKey0HNuN2m/SnbfwoUIncmeu8/r5m7RK1nKWNE2NaJSH+a
   KTc5MFCacygIDyJneOByJ/OYlc5cpIIl7cqOArIDD/OSyc7obpU6Hy3XG
   Q==;
X-CSE-ConnectionGUID: lOFQ+/yKSzep+ugSvH/AGA==
X-CSE-MsgGUID: bNhzWTFGRZis5l2P48i6Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15129834"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15129834"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 10:43:33 -0700
X-CSE-ConnectionGUID: 3FvjUzdvQyW9Er2exKxN+w==
X-CSE-MsgGUID: SfRJUUKUTCWpG1VUmMWwZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41287595"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Jun 2024 10:43:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIXR3-0000Le-19;
	Sat, 15 Jun 2024 17:43:29 +0000
Date: Sun, 16 Jun 2024 01:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 53/61] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_rx_queue,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue,
 __cacheline_group_begin__read_write) <= (32 + sizeof(struct
 libeth_rq_stats))"
Message-ID: <202406160140.EUY7l0HR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   a24094f4ded2e9cad3ca80dc94b01112969cc448
commit: 490e3ecc4919daeda77c42c54ccada4e68d8c87f [53/61] idpf: use generic functions to build xdp_buff and skb
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240616/202406160140.EUY7l0HR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160140.EUY7l0HR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160140.EUY7l0HR-lkp@intel.com/

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
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_rx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_write) <= (32 + sizeof(struct libeth_rq_stats))"
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
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:570:1: note: in expansion of macro 'libeth_cacheline_set_assert'
     570 | libeth_cacheline_set_assert(struct idpf_rx_queue,
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
