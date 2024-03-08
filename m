Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BD5C8B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 02:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709865169; cv=none; b=Fv6OF1kQECX8gyUal0C//huGrvDnyizy2+V5a1bfYYDmurSMq79Gju6q0UC5nj39T0XGhAYFgRD8XkQHrDBnamDU8ZNSU0fdizkVp83wddl/w0eq4WMb4vHkTV1MhViIRLPpdOu3MVRf2XzkXkWIScE8t75Ef0PcVtvuf6u4XU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709865169; c=relaxed/simple;
	bh=Amkt60m3i3ULJnZlouq1RumgRIH86CF4sOUzxx2Ws4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NpswcflkC4/CcizXloHAK/nI7gtVrKt8TVDHj4wSlKRkZEJU40vUfOIpgzrbxKj0shOCPDEUbr9I3CRoADF8gmCAwL0ZigBJcP7fOMswaa3xFrFXonozAd4okgbNm5mgR2DHps0SveR43aEwFeRzhmhK9DBV1I99WLsPfT2HOTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A19R3yNe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A19R3yNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709865167; x=1741401167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Amkt60m3i3ULJnZlouq1RumgRIH86CF4sOUzxx2Ws4s=;
  b=A19R3yNehyHboUw81sbAsZa6YUZ7Kw0ISE4OIhkKWLW7/T+VyedGiJ2j
   vMEqw1S35f07ziMj+VxUN0zD56pu0pU8hvm63ydJG9l18qRxKZaTeV+uV
   HZvU6hGjR3uGqdV6misMofyGqWDtfL71w7jENISPS3AYSRRzTx2AU4WED
   VBeuX4FmASxYKTdZLg5naS7/EPRSro2xyIXDlmQscT3rhLspG1y0YxJb1
   di4opip4mDR4nwnDaRBTyV7KYJefL8Q9MEdgFGJxBjSMJX+OuvuS1B2Ph
   znJJhfi5DCLAg3Mn+2XWN66DcsbyOYUBMySgN2/TiQ/6UHOdId4WrqgTE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15218076"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="15218076"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 18:32:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10757919"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2024 18:32:31 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riQ29-0005wD-0y;
	Fri, 08 Mar 2024 02:32:29 +0000
Date: Fri, 8 Mar 2024 10:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 9/13]
 include/linux/fsnotify_backend.h:490:23: error: no member named
 's_fsnotify_info' in 'struct super_block'
Message-ID: <202403081034.ZJ6rbGwb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   7e45fb51e82f697e956a67fe60939867f4437635
commit: 8c7adb172311fa05c785dc2d15dd2f76dfa5e3a6 [9/13] fsnotify: lazy attach fsnotify_sb_info state to sb
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240308/202403081034.ZJ6rbGwb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081034.ZJ6rbGwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081034.ZJ6rbGwb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:409:10: note: expanded from macro '__native_word'
     409 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:442:22: note: expanded from macro 'compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:430:23: note: expanded from macro '_compiletime_assert'
     430 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:422:9: note: expanded from macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:409:39: note: expanded from macro '__native_word'
     409 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:442:22: note: expanded from macro 'compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:430:23: note: expanded from macro '_compiletime_assert'
     430 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:422:9: note: expanded from macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:410:10: note: expanded from macro '__native_word'
     410 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:442:22: note: expanded from macro 'compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:430:23: note: expanded from macro '_compiletime_assert'
     430 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:422:9: note: expanded from macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:410:38: note: expanded from macro '__native_word'
     410 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:442:22: note: expanded from macro 'compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:430:23: note: expanded from macro '_compiletime_assert'
     430 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:422:9: note: expanded from macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:442:22: note: expanded from macro 'compiletime_assert'
     442 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:430:23: note: expanded from macro '_compiletime_assert'
     430 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:422:9: note: expanded from macro '__compiletime_assert'
     422 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:398:13: note: expanded from macro '__unqual_scalar_typeof'
     398 |                 _Generic((x),                                           \
         |                           ^
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:405:15: note: expanded from macro '__unqual_scalar_typeof'
     405 |                          default: (x)))
         |                                    ^
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:23: error: no member named 's_fsnotify_info' in 'struct super_block'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                          ~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   In file included from fs/open.c:12:
   In file included from include/linux/fsnotify.h:15:
>> include/linux/fsnotify_backend.h:490:9: error: returning 'void' from a function with incompatible result type 'struct fsnotify_sb_info *'
     490 |         return READ_ONCE(sb->s_fsnotify_info);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
      48 | ({                                                                      \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   9 errors generated.


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
