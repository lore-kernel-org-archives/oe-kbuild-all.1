Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C7E79F3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 05:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725687934; cv=none; b=KyzSq+EtZttgICifBQM1je/Fo6EId/G/5x+gKKPoZD942Ac3ZdNymwYAbFjlsPj+VikVOHIzB+dwsfGH86H6sIOlxukfShyacYjpKPAaNy7fKRbpaoOhISK6ZedMFRee1pw43RV+ogxKXqFPOP1nN4GNK2a9swUY18/jchzPjC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725687934; c=relaxed/simple;
	bh=RjZKexk+el37Q/P38Jk4rfI2JHKIjXBtXkELLKS7hbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UKag1DkwikWZtp3WTvYpz6Zamo9tektwuSVL0sVNBbhkrhfaWCBO1BNXiln5NmWHjjQG1k7JZZb+QtZYHLMZM9hfBV+QtlnwqCOVtnDQ27v5VIX/fCfQnAhvtsD6ewiCResLNeaovMoIY/Ph0QgH6wvckLo7OHzgnm2KSe6z//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StphlkUo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StphlkUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725687933; x=1757223933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RjZKexk+el37Q/P38Jk4rfI2JHKIjXBtXkELLKS7hbw=;
  b=StphlkUo4NaFITRnhtAuofLqq+DLtuAaUHF0EQVw9JpIloGubM/nGOr8
   9Tu4QNAL3F5uwzv0rOtkoBTVGLgT1ruc1WhSqbma2jPoaPM70XiLLc/po
   crN5DR8GjPXtoX+Dxbmrp2p8AXJtmCtUBq4RBQwSHZY1Lr2blSP8fRAZG
   7O7O3pIw5ZU8JLxmvSSqXmmT1QhU0ColqLpqaGFECNg/vOY0GKKLgshmp
   eKHZ1GsygpEg8zitvs2wHDzEnKrBcxlHml0pDHMmZUKhDYlDQFH2uAfkS
   2hLJ1eoQGZd7WpGawS9jmBtAD+Ob1OFCyYTWXiE9lTjEb1sGMzZXLjUrT
   g==;
X-CSE-ConnectionGUID: +DsAUAIyTHChs7a8Lxhnxg==
X-CSE-MsgGUID: GMJ98hbOTeuO6S5N/heztA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23956105"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="23956105"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 22:45:30 -0700
X-CSE-ConnectionGUID: ULmFuY1AQoCspBBKFbTlGw==
X-CSE-MsgGUID: 6kvnVcq8SbSLPHaBxrnQeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="96859848"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Sep 2024 22:45:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smoGF-000C9X-0Q;
	Sat, 07 Sep 2024 05:45:27 +0000
Date: Sat, 7 Sep 2024 13:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 22/43] include/linux/build_bug.h:78:41: error:
 static assertion failed: "pointer type mismatch in container_of()"
Message-ID: <202409071303.5G7qqF5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   9caef88739ac46b62a0e2d08d5b1d47c441d9655
commit: cbc2abb2d3b27b11f3a1659f904b0a5b9102ffe3 [22/43] crypto: virtio - Drop superfluous [as]kcipher_req pointer
config: arc-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240907/202409071303.5G7qqF5v-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071303.5G7qqF5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071303.5G7qqF5v-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/cmpxchg.h:9,
                    from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/crypto/aead.h:11,
                    from include/crypto/engine.h:10,
                    from drivers/crypto/virtio/virtio_crypto_skcipher_algs.c:9:
   drivers/crypto/virtio/virtio_crypto_skcipher_algs.c: In function 'virtio_crypto_dataq_sym_callback':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "pointer type mismatch in container_of()"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_skcipher_algs.c:58:17: note: in expansion of macro 'container_of'
      58 |                 container_of(vc_sym_req, struct skcipher_request, __ctx);
         |                 ^~~~~~~~~~~~
--
   In file included from arch/arc/include/asm/cmpxchg.h:9,
                    from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/crypto/aead.h:11,
                    from include/crypto/engine.h:10,
                    from drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:10:
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c: In function 'virtio_crypto_dataq_akcipher_callback':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct akcipher_req'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:17: note: in expansion of macro 'container_of'
      70 |                 container_of(vc_akcipher_req, struct akcipher_req, __ctx);
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:451:27: error: expression in static assertion is not an integer
     451 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:17: note: in expansion of macro 'container_of'
      70 |                 container_of(vc_akcipher_req, struct akcipher_req, __ctx);
         |                 ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/atomic.h:5:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct akcipher_req'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:70:17: note: in expansion of macro 'container_of'
      70 |                 container_of(vc_akcipher_req, struct akcipher_req, __ctx);
         |                 ^~~~~~~~~~~~


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
