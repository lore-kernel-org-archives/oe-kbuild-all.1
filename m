Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ECE129A7F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709816041; cv=none; b=FyAYC8vpYCC2Q2gcQeAE7WzwmYUg7cOaShcbmAIPsX0e2pdu9aORTys+dXSwzvnPBgrbGgIUK0IAnSgOhFtz5wGbN/TOdcHUFAcP0E0SkXmX3MxU7kwLjwRO9F6WWGMBTYiKXszrDbF8WJIaj7SVa9+MyjnRYpcw8Tk+VCYHnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709816041; c=relaxed/simple;
	bh=4jBP36rDLrYzLNV2PU97T0mRj+xrjgO11AEIA95IU+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0Llj2rziXKmDRPcDKvgRWZlUJA43INizxwja/MPTqEJ3oaCy3yosr1ZhxuLiLamC8Z2zrqFiGPve8YTh6FFqna6qsFUiRti2duDzjSCMdd6w9KCj4aeMHPGgFpv5ov5CnwjZv+wDeC1Q2C9rPK9CJ93yV/qkThTRGKczd4C8Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+ftybRG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+ftybRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709816040; x=1741352040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jBP36rDLrYzLNV2PU97T0mRj+xrjgO11AEIA95IU+k=;
  b=X+ftybRGcKIjysfuz6RbNddTXOSzHArhlijfK7P6LC7IawJRBMLzV15h
   u6FUSqUPPnJXJucZ1LIjqVrLM3BX7S7Baoq0UOH9ecBrBCZr2w7iJvzUc
   d2UDRhkO368hx2K8b6cPvoFv7Si6Lqi6JtfVoO4sNltDdfWW2uhBZKaOa
   +6FXS846GVcKAlsSiaEGdF7UaQg0k5tFn3ZlYQPqyowIfgkEHbhMF4DDH
   9QixEDv0PY8xb5J+lgclEomyMM50Dl0s8LpoFbunelNvY9ylgcptcAQPp
   MDuUe2sc095MNNJ3BqXcM/RUQ4rBedUCbhCRTodyhL7UjtkGKr7VZmB8o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15203247"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="15203247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 04:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="10528418"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Mar 2024 04:53:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riDFz-0005Bp-1T;
	Thu, 07 Mar 2024 12:53:55 +0000
Date: Thu, 7 Mar 2024 20:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-sbinfo 10/12]
 include/linux/fsnotify_backend.h:496:1: warning: control reaches end of
 non-void function
Message-ID: <202403072056.s1eq8GAv-lkp@intel.com>
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
commit: 1f5b11803af3efc542c56c7aab00f27e241269d9 [10/12] fsnotify: move s_fsnotify_connectors into fsnotify_sb_info
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240307/202403072056.s1eq8GAv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403072056.s1eq8GAv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403072056.s1eq8GAv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify_backend.h:495:16: note: in expansion of macro 'READ_ONCE'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
   include/linux/fsnotify_backend.h:495:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
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
   include/linux/fsnotify_backend.h:495:16: note: in expansion of macro 'READ_ONCE'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
   include/linux/fsnotify_backend.h:495:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
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
   include/linux/fsnotify_backend.h:495:16: note: in expansion of macro 'READ_ONCE'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
   include/linux/fsnotify_backend.h:495:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
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
   include/linux/fsnotify_backend.h:495:16: note: in expansion of macro 'READ_ONCE'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
   include/linux/fsnotify_backend.h:495:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/linux/compiler_types.h:398:27: note: in definition of macro '__unqual_scalar_typeof'
     398 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/linux/fsnotify_backend.h:495:16: note: in expansion of macro 'READ_ONCE'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
   In file included from arch/alpha/include/asm/rwonce.h:33,
                    from include/linux/compiler.h:251,
                    from include/linux/array_size.h:5,
                    from include/linux/string.h:5,
                    from fs/open.c:8:
   include/linux/fsnotify_backend.h:495:28: error: 'struct super_block' has no member named 's_fsnotify_info'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                            ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/fsnotify_backend.h:495:16: note: in expansion of macro 'READ_ONCE'
     495 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~
   In file included from include/linux/fsnotify.h:15,
                    from fs/open.c:12:
>> include/linux/fsnotify_backend.h:496:1: warning: control reaches end of non-void function [-Wreturn-type]
     496 | }
         | ^


vim +496 include/linux/fsnotify_backend.h

8c7adb172311fa Amir Goldstein 2024-03-06  492  
8c7adb172311fa Amir Goldstein 2024-03-06  493  static inline struct fsnotify_sb_info *fsnotify_sb_info(struct super_block *sb)
8c7adb172311fa Amir Goldstein 2024-03-06  494  {
8c7adb172311fa Amir Goldstein 2024-03-06  495  	return READ_ONCE(sb->s_fsnotify_info);
8c7adb172311fa Amir Goldstein 2024-03-06 @496  }
8c7adb172311fa Amir Goldstein 2024-03-06  497  

:::::: The code at line 496 was first introduced by commit
:::::: 8c7adb172311fa05c785dc2d15dd2f76dfa5e3a6 fsnotify: lazy attach fsnotify_sb_info state to sb

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
