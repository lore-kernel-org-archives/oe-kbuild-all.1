Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8012D768
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709828890; cv=none; b=c+vj8i1P8Rnws/EX0KdKuWvKXYF9367rcvICmqlUV3GJJD2tJUcXlk7HQl29wuleovAX9DJXxCEabSX/unTwWbll2WJkT/MmBg+J4bqFYtR+o2Y0g4VbFc7/holVCs0JSvZ7nBZ/MLs2LzFodh/eVA0wgs/1uKVbmbjH3A3NtKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709828890; c=relaxed/simple;
	bh=tOiZA7kNwDH3dPX6Xkf8bUoULATaqTUSJ7dbpYuoh5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bcdhD+1pRkGo6vIBjbDPxqyYLsvsCUQxdOVvSRt+6VEZdmgcErjrarvbxiZzEWiQ2uE93e9dFfXLF3RY0bs24jNLZkgSrc6FXZYPEJ0MP0TiLLuQrGwv2ohVQx7SEvGo46BgBM1hjzjWYR0suIYRPUtJrC6PGmOuKJcCM96rGww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGlcd1gA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGlcd1gA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709828888; x=1741364888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tOiZA7kNwDH3dPX6Xkf8bUoULATaqTUSJ7dbpYuoh5M=;
  b=DGlcd1gArwdCmVtLAShu4o42JfURRLd8Afe6Q/RMub+pzcL4xQVL1csi
   v5LmDNADj7BFEWNX9Ei5nhbtkCKtnLRgTnOdKNumQNiQZHiXQ64myxWLV
   luvtntt/0WQ5k03UQVzKyEhavKryXR1XAnPAzFF8Rl8DMFben1+vv7SZF
   IWyuJkxoiTxWIpcg34uSUgtWtGTIfAQUFTlwiWQovVM/gu9l4j5TowHt8
   OzWaV/zbvQNd6FWCaQE4qimmcGmR1e2E+i+oxKPgf/RcpsfZxhxDeHfgG
   ViFtTFitjcsU5vN0ZwykSKJQh5pXYOfDzyyJ7SWaZjEID1ibZu4whOmgk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15647974"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="15647974"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 08:28:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="10230542"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2024 08:28:06 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riGbD-0005Lj-2F;
	Thu, 07 Mar 2024 16:28:03 +0000
Date: Fri, 8 Mar 2024 00:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-sbinfo 9/12]
 include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no
 member named 's_fsnotify_info'
Message-ID: <202403080015.J2oWJynt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-sbinfo
head:   937e7579197b4e5cb02d5525370c554378ff8fb8
commit: 8c7adb172311fa05c785dc2d15dd2f76dfa5e3a6 [9/12] fsnotify: lazy attach fsnotify_sb_info state to sb
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240308/202403080015.J2oWJynt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080015.J2oWJynt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080015.J2oWJynt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/linux/fsnotify_backend.h: In function 'fsnotify_sb_info':
>> include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:490:16: note: in expansion of macro 'READ_ONCE'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:490:16: note: in expansion of macro 'READ_ONCE'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:490:16: note: in expansion of macro 'READ_ONCE'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:490:16: note: in expansion of macro 'READ_ONCE'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/linux/compiler_types.h:422:23: note: in definition of macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:442:9: note: in expansion of macro '_compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:490:16: note: in expansion of macro 'READ_ONCE'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
>> include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/linux/compiler_types.h:398:27: note: in definition of macro '__unqual_scalar_typeof'
     398 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/fsnotify_backend.h:490:16: note: in expansion of macro 'READ_ONCE'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
   In file included from ./arch/openrisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/string.h:5,
                    from fs/open.c:8:
>> include/linux/fsnotify_backend.h:490:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/fsnotify_backend.h:490:16: note: in expansion of macro 'READ_ONCE'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~


vim +490 include/linux/fsnotify_backend.h

   487	
   488	static inline struct fsnotify_sb_info *fsnotify_sb_info(struct super_block *sb)
   489	{
 > 490		return READ_ONCE(sb->s_fsnotify_info);
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
