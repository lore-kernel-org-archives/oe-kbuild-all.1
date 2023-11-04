Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57236188
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 00:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asnXEXi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699056638; x=1730592638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZcDOiRl2ExFh38QTFLiGHI8XWUdq7IWsg6HZMuXGA0=;
  b=asnXEXi7nMue4OBcSp/LjZ4jWrWgwcLzKwmBw4IMjdoQxHgyEY/jlCNo
   CbkZD6cjf3Qtoz+hrL1No89UiXV1+wo/cHjgmWFOtIqzFPyl0Yc6n1/MW
   qTL33wd+hbaqV1JCa3VRA216UNdW2ta+5LuADA52Rltu1gjW/MdnykRpf
   G1ux2bC+E6Ck6yPktpKKyI8Q9xUP+zuFoT8vFzXKtk2/j7FyyjiQi2W34
   0IHsLIqhtKYb2Nb6/uDWptKQ6hdt2psPQsbp+VHMv41lW97AF6NpNLxAr
   ONWmTBf55gzDD7+CWKyPZ2MYThVcmep/X6oEFvljGlnjSwhkwQ6wNRnIc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386216024"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="386216024"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 17:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008974433"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1008974433"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Nov 2023 17:10:36 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz4FG-000360-0b;
	Sat, 04 Nov 2023 00:10:34 +0000
Date: Sat, 4 Nov 2023 08:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: [drm-xe:oak/drm-evictable-lru 8/11]
 include/linux/container_of.h:20:54: error: invalid use of undefined type
 'struct drm_i915_private'
Message-ID: <202311040705.FeX3lWHT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
commit: 5c7ab6e4b1aea6c20a00aeb0110f82696d5840e3 [8/11] drm: Initialize drm lru manager
config: i386-randconfig-016-20231104 (https://download.01.org/0day-ci/archive/20231104/202311040705.FeX3lWHT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040705.FeX3lWHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040705.FeX3lWHT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/preempt.h:12,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:6:
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c: In function 'i915_ttm_buddy_man_init':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct drm_i915_private'
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
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:307:41: note: in expansion of macro 'container_of'
     307 |         struct drm_i915_private *i915 = container_of(bdev,
         |                                         ^~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:307:41: note: in expansion of macro 'container_of'
     307 |         struct drm_i915_private *i915 = container_of(bdev,
         |                                         ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/uapi/linux/sysinfo.h:5,
                    from include/uapi/linux/kernel.h:5,
                    from include/linux/cache.h:5,
                    from include/linux/slab.h:15:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct drm_i915_private'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:307:41: note: in expansion of macro 'container_of'
     307 |         struct drm_i915_private *i915 = container_of(bdev,
         |                                         ^~~~~~~~~~~~
>> drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:309:39: error: invalid use of undefined type 'struct drm_i915_private'
     309 |         struct drm_device *drm = &i915->drm;
         |                                       ^~
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c: In function 'i915_ttm_buddy_man_fini':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct drm_i915_private'
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
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:359:41: note: in expansion of macro 'container_of'
     359 |         struct drm_i915_private *i915 = container_of(bdev,
         |                                         ^~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
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
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:359:41: note: in expansion of macro 'container_of'
     359 |         struct drm_i915_private *i915 = container_of(bdev,
         |                                         ^~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct drm_i915_private'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:359:41: note: in expansion of macro 'container_of'
     359 |         struct drm_i915_private *i915 = container_of(bdev,
         |                                         ^~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c:361:39: error: invalid use of undefined type 'struct drm_i915_private'
     361 |         struct drm_device *drm = &i915->drm;
         |                                       ^~


vim +20 include/linux/container_of.h

d2a8ebbf8192b84 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e017 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6dfb Rasmus Villemoes 2021-11-08 @20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6dfb Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  24  

:::::: The code at line 20 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
