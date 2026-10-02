Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA84A9D5D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948476; cv=none; b=CZ9w+XxeW3n5AAbXhAo9CHjFKiJ7r7SwHavHnHdloQtPPtSbhxBkaUdtTo8yMcYAXiz+cYzorhNQRlf7PH5I11Ly7257tulvedZ66GItPFRYbKyq88XphFN5/rxuNVGSZRcXbL5QhjNBzHhccv+o3H0pmTJcAuYQHQvX/R+rODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948476; c=relaxed/simple;
	bh=YGyeXgOvl9ir0N6O9nJi6v5upqcm7YTPQ32VFCr2hvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qDQpwZEg8WjYwLe6ll/AhX2oop7shWezLDXkjZEAKqc7D+r38nhUQ+wWix5p6VdBsWvxatojN97leGNwkI13yDpZ4nAA3BqCQ7JnBYZzaRDgPM10+nbVp56WswfiGYKLQb5sOkRTYd6tdGUrMm5d5hzWB4WSf//VfZnohI/SMDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i741UrIQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i741UrIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790948474; x=1822484474;
  h=date:from:to:cc:subject:message-id;
  bh=YGyeXgOvl9ir0N6O9nJi6v5upqcm7YTPQ32VFCr2hvM=;
  b=i741UrIQ4Ho62yW11Vx2rdL4WCD/iabWq/oIueYGKdDqntZegYREXXIU
   aTsIvpBpDzCF3LpqEa0kAkB0YSUhTC+DQpz4JncTNzuEenpushuJMOtex
   Pbbn0UQyW7U9rdBObXuXOxBC+RaPL/oHNcDkTyTIL53NE4NH7g7gee4cN
   scT6sxxjXP8BatlKvoksVZCvEzjAfL0tUhYWIjFvFIwZABXW43QXVfimD
   ZQlLl0LNrAwIa1TBGqnwxaozNCVJJKbeG7kcWgndznGjw5klojLpHMiLM
   t5EHQSK1wrPNIrjB3AiutTObyZpNFxnOCVCwtQoDpQOvkKBjoYPfZ1bkC
   A==;
X-CSE-ConnectionGUID: HZ7piQYaS/GEg/h2YX0vvA==
X-CSE-MsgGUID: U0SvbahaSAiIE0h/W85NvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102235828"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102235828"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:41:09 -0700
X-CSE-ConnectionGUID: CIMYaN/ESfeIC32vYmbecQ==
X-CSE-MsgGUID: 2/5qHzyTSWa6KJNC31ifLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274341166"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Oct 2026 06:41:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCdVZ-00000000T5r-47E8;
	Fri, 02 Oct 2026 13:41:05 +0000
Date: Fri, 02 Oct 2026 21:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-09 1/1]
 include/linux/slab.h:903:2: warning: cast to pointer from integer of
 different size
Message-ID: <202610022139.YlosHCVT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-09
head:   db9bd6c18b8007e430fb3e44723a93859aebee68
commit: 89ffa47ebb4b594af723bd02370a212dbac525bf [1/1] UPSTREAM: fscrypt: Replace mk_users keyring with simple list
config: arm64-randconfig-1002-20261002 (https://download.01.org/0day-ci/archive/20261002/202610022139.YlosHCVT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610022139.YlosHCVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610022139.YlosHCVT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/crypto/keyring.c: In function 'add_master_key_user':
   include/linux/gfp.h:17:52: error: implicit declaration of function '__VA_OPT__'; did you mean '__CHAR_BIT__'? [-Werror=implicit-function-declaration]
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                                                       ^
   include/linux/alloc_tag.h:227:9: note: in definition of macro 'alloc_hooks_tag'
     typeof(_do_alloc) _res;      \
            ^~~~~~~~~
   include/linux/slab.h:1119:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   include/linux/slab.h:903:10: note: in expansion of macro 'kzalloc'
     (TYPE *)KMALLOC(__obj_size, GFP);    \
             ^~~~~~~
   include/linux/slab.h:967:2: note: in expansion of macro '__alloc_objs'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
     ^~~~~~~~~~~~
   include/linux/gfp.h:17:26: note: in expansion of macro '__default_gfp'
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                             ^~~~~~~~~~~~~
   include/linux/slab.h:967:24: note: in expansion of macro 'default_gfp'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
                           ^~~~~~~~~~~
   fs/crypto/keyring.c:359:12: note: in expansion of macro 'kzalloc_obj'
     mk_user = kzalloc_obj(*mk_user);
               ^~~~~~~~~~~
   include/linux/gfp.h:17:63: error: expected expression before ',' token
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                                                                  ^
   include/linux/alloc_tag.h:227:9: note: in definition of macro 'alloc_hooks_tag'
     typeof(_do_alloc) _res;      \
            ^~~~~~~~~
   include/linux/slab.h:1119:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   include/linux/slab.h:903:10: note: in expansion of macro 'kzalloc'
     (TYPE *)KMALLOC(__obj_size, GFP);    \
             ^~~~~~~
   include/linux/slab.h:967:2: note: in expansion of macro '__alloc_objs'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
     ^~~~~~~~~~~~
   include/linux/gfp.h:17:26: note: in expansion of macro '__default_gfp'
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                             ^~~~~~~~~~~~~
   include/linux/slab.h:967:24: note: in expansion of macro 'default_gfp'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
                           ^~~~~~~~~~~
   fs/crypto/keyring.c:359:12: note: in expansion of macro 'kzalloc_obj'
     mk_user = kzalloc_obj(*mk_user);
               ^~~~~~~~~~~
   include/linux/gfp.h:17:63: error: expected expression before ',' token
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                                                                  ^
   include/linux/alloc_tag.h:231:10: note: in definition of macro 'alloc_hooks_tag'
      _res = _do_alloc;     \
             ^~~~~~~~~
   include/linux/slab.h:1119:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   include/linux/slab.h:903:10: note: in expansion of macro 'kzalloc'
     (TYPE *)KMALLOC(__obj_size, GFP);    \
             ^~~~~~~
   include/linux/slab.h:967:2: note: in expansion of macro '__alloc_objs'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
     ^~~~~~~~~~~~
   include/linux/gfp.h:17:26: note: in expansion of macro '__default_gfp'
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                             ^~~~~~~~~~~~~
   include/linux/slab.h:967:24: note: in expansion of macro 'default_gfp'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
                           ^~~~~~~~~~~
   fs/crypto/keyring.c:359:12: note: in expansion of macro 'kzalloc_obj'
     mk_user = kzalloc_obj(*mk_user);
               ^~~~~~~~~~~
   include/linux/gfp.h:17:63: error: expected expression before ',' token
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                                                                  ^
   include/linux/alloc_tag.h:234:10: note: in definition of macro 'alloc_hooks_tag'
      _res = _do_alloc;     \
             ^~~~~~~~~
   include/linux/slab.h:1119:25: note: in expansion of macro 'alloc_hooks'
    #define kzalloc(...)    alloc_hooks(kzalloc_noprof(__VA_ARGS__))
                            ^~~~~~~~~~~
   include/linux/slab.h:903:10: note: in expansion of macro 'kzalloc'
     (TYPE *)KMALLOC(__obj_size, GFP);    \
             ^~~~~~~
   include/linux/slab.h:967:2: note: in expansion of macro '__alloc_objs'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
     ^~~~~~~~~~~~
   include/linux/gfp.h:17:26: note: in expansion of macro '__default_gfp'
    #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
                             ^~~~~~~~~~~~~
   include/linux/slab.h:967:24: note: in expansion of macro 'default_gfp'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
                           ^~~~~~~~~~~
   fs/crypto/keyring.c:359:12: note: in expansion of macro 'kzalloc_obj'
     mk_user = kzalloc_obj(*mk_user);
               ^~~~~~~~~~~
   In file included from include/linux/crypto.h:17:0,
                    from include/crypto/skcipher.h:13,
                    from fs/crypto/keyring.c:22:
>> include/linux/slab.h:903:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     (TYPE *)KMALLOC(__obj_size, GFP);    \
     ^
   include/linux/slab.h:967:2: note: in expansion of macro '__alloc_objs'
     __alloc_objs(kzalloc, default_gfp(__VA_ARGS__), typeof(P), 1)
     ^~~~~~~~~~~~
   fs/crypto/keyring.c:359:12: note: in expansion of macro 'kzalloc_obj'
     mk_user = kzalloc_obj(*mk_user);
               ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +903 include/linux/slab.h

ce6a50263d4dde Christoph Lameter 2013-01-10  889  
ac46cdb098c8c6 Kees Cook         2026-07-16  890  /**
ac46cdb098c8c6 Kees Cook         2026-07-16  891   * __alloc_objs - Allocate objects of a given type using
ac46cdb098c8c6 Kees Cook         2026-07-16  892   * @KMALLOC: which size-based kmalloc wrapper to allocate with.
ac46cdb098c8c6 Kees Cook         2026-07-16  893   * @GFP: GFP flags for the allocation.
ac46cdb098c8c6 Kees Cook         2026-07-16  894   * @TYPE: type to allocate space for.
ac46cdb098c8c6 Kees Cook         2026-07-16  895   * @COUNT: how many @TYPE objects to allocate.
ac46cdb098c8c6 Kees Cook         2026-07-16  896   *
ac46cdb098c8c6 Kees Cook         2026-07-16  897   * Returns: Newly allocated pointer to (first) @TYPE of @COUNT-many
ac46cdb098c8c6 Kees Cook         2026-07-16  898   * allocated @TYPE objects, or NULL on failure.
ac46cdb098c8c6 Kees Cook         2026-07-16  899   */
ac46cdb098c8c6 Kees Cook         2026-07-16  900  #define __alloc_objs(KMALLOC, GFP, TYPE, COUNT)				\
ac46cdb098c8c6 Kees Cook         2026-07-16  901  ({									\
ac46cdb098c8c6 Kees Cook         2026-07-16  902  	const size_t __obj_size = size_mul(sizeof(TYPE), COUNT);	\
ac46cdb098c8c6 Kees Cook         2026-07-16 @903  	(TYPE *)KMALLOC(__obj_size, GFP);				\
ac46cdb098c8c6 Kees Cook         2026-07-16  904  })
ac46cdb098c8c6 Kees Cook         2026-07-16  905  

:::::: The code at line 903 was first introduced by commit
:::::: ac46cdb098c8c6a0a81e9f9d5714a30c811993a1 UPSTREAM: slab: Introduce kmalloc_obj() and family

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Carlos Llamas <cmllamas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
