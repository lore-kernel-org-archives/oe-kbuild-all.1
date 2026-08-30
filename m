Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01230383333
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788098685; cv=none; b=K4ISVr7D8UPFPAWuQMqzi9xdQcxeLynxW4mACCsoDIyjgZQEmbVRW0DPa+hd/xee0YKVXS4uz3VRPRhn4pOSa/+SjueSb0iogOq9FV4q3jNdkU2cozB3HKMtgpa3GsEO6wArPOa5usrYne8+6HjTsZGFG1vjlLH2o1Q01SfdSFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788098685; c=relaxed/simple;
	bh=4tiCxbXHKm/n6pQynCljbtae0ckzVpN6Mm9iNS/Iu9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nCpusqmizHFWtvWAxT8dZZmgq3DN0jJ3qBytP98zFQZDAlFp8yXEczrcwZF6D7LycK19g9XHEQIjq+rhnqxuQgLo2hP2RkqmZnLS1vNh1dEyEsjx6C0+qWr6nIRgnVfJPiaD7jMTL95lWRIVHf44+wM0Qap7vSokqgokFVTBEbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPQCmgkx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPQCmgkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788098684; x=1819634684;
  h=date:from:to:cc:subject:message-id;
  bh=4tiCxbXHKm/n6pQynCljbtae0ckzVpN6Mm9iNS/Iu9M=;
  b=aPQCmgkxi8+meRSSrTFFI6G+FEg9ssOmYdUhGm7ubTIHD4e89jaEedgg
   4143XOid3VIUBGloGWPo9ZCeZs37IsL8HHDkLrZPfsIkZDz5Hf6kd2ova
   ZcsKRQfobweul1sBqoI50dvfIRNxiDDCEwMW2EKSPojGrKhexwa2SW1+X
   m2sXFn9yASqh0NYG0dy4neoFYBOZj2JV/6d04mMMxkkCt1A2OxozLHqZ7
   2A7MKTETMj6YF3lWaPuaiSbj2BqIhOIGTVZCoWoIZXo1m1ACIz68xL2Aj
   /SHMF+Ya2kgDaB1egOhokSGJXc89ZVeN57h+jw2kqklT1YJGAX+gcnhTi
   Q==;
X-CSE-ConnectionGUID: C98RX0qaRzaKAZQQPsSADw==
X-CSE-MsgGUID: PTofr9yVQJaDrUY9lYuViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88286831"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88286831"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 07:04:43 -0700
X-CSE-ConnectionGUID: 8UVk9t68RsK+WtAF6HIWvw==
X-CSE-MsgGUID: zRo/kT1JTviAH7DS7zaehA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272089450"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2026 07:04:41 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0g9H-00000000Dx5-04Da;
	Sun, 30 Aug 2026 14:04:39 +0000
Date: Sun, 30 Aug 2026 22:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 include/linux/gfp.h:17:52: error: implicit declaration of function
 '__VA_OPT__'; did you mean '__VFP_FP__'?
Message-ID: <202608302253.SFpWbhN1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   36bee94a7cf9bbd4a0782169da5e69c5b3bd5212
commit: 89ffa47ebb4b594af723bd02370a212dbac525bf [3/3] UPSTREAM: fscrypt: Replace mk_users keyring with simple list
config: arm-randconfig-003-20260829 (https://download.01.org/0day-ci/archive/20260830/202608302253.SFpWbhN1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302253.SFpWbhN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302253.SFpWbhN1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5:0,
                    from include/linux/percpu_counter.h:14,
                    from include/linux/mm_types.h:21,
                    from include/linux/mmzone.h:23,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from include/linux/crypto.h:17,
                    from include/crypto/skcipher.h:13,
                    from fs/crypto/keyring.c:22:
   fs/crypto/keyring.c: In function 'add_master_key_user':
>> include/linux/gfp.h:17:52: error: implicit declaration of function '__VA_OPT__'; did you mean '__VFP_FP__'? [-Werror=implicit-function-declaration]
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
>> include/linux/gfp.h:17:63: error: expected expression before ',' token
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
>> include/linux/gfp.h:17:63: error: expected expression before ',' token
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
>> include/linux/gfp.h:17:63: error: expected expression before ',' token
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
   cc1: some warnings being treated as errors


vim +17 include/linux/gfp.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  14  
98e5d4dd4c5c8c Linus Torvalds 2026-07-16  15  /* Helper macro to avoid gfp flags if they are the default one */
98e5d4dd4c5c8c Linus Torvalds 2026-07-16  16  #define __default_gfp(a,...) a
98e5d4dd4c5c8c Linus Torvalds 2026-07-16 @17  #define default_gfp(...) __default_gfp(__VA_ARGS__ __VA_OPT__(,) GFP_KERNEL)
98e5d4dd4c5c8c Linus Torvalds 2026-07-16  18  

:::::: The code at line 17 was first introduced by commit
:::::: 98e5d4dd4c5c8cf8cda5d121d4a0df9729b3d579 UPSTREAM: add default_gfp() helper macro and use it in the new *alloc_obj() helpers

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Carlos Llamas <cmllamas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
