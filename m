Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42612E40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Mar 2024 04:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710909485; cv=none; b=d1wQy6LDtYBL3poRqmjNSJzl7AR7ox59acH9bdlxHtirGgCCGbPdGnl1OCE1jIB5M5DiPKf2hRRhcVpqS/YaRJqsUgNLua+M3xNwMDwCSHGNDnJbCQq3A3i0iiEdUt3CEmodTP06Ao/u58U4i4gvkB6KSIq2WGrmsauFKXBxK3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710909485; c=relaxed/simple;
	bh=d/ZfEtKWY4RfqtHmrA7z0EhNkjWiMaak+QKen4XDmmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t6Hh8vB6EcRG2Auyzh40yuecYfpha/8x7pMOMfY2b9x4P1tObqZ8ETv6dkZxM26+x4P+VWjEf9GqoXmAwMKrBz3H67Bz6b3pc39N0WvSPj8M0uC8QLuqk49HqM5n5hrICVQdjuztvDO+dMi++85yiB1rH87QkuI0Wi+c+O7eaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFoY2A3+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFoY2A3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710909482; x=1742445482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d/ZfEtKWY4RfqtHmrA7z0EhNkjWiMaak+QKen4XDmmY=;
  b=DFoY2A3+Xuiu2uHgb2KCToXECzEoRJ6hpu+tkCqX7wnhgi+yJGJd/S/l
   RSzek9sNAR2NwKVsDRF/xd5V7oibwTQXMADkAFk7og502ktb7DA1FVEm/
   00qkR7b0lZAn8qXGT0aejn8OiIkBLUBLhsYzgxIKN0nzeqaPch7ENMs11
   Hn89AjkTMBqKN520TOpTMteNANBjJs5YCzYokVzrjDEtoVNAj0Rc6JShG
   zPDLvaXe0QRUw+qJkvcog65tvvrxE4Qt8J/kO7CkAOMdTQu2E2iOD4RaM
   hCnqC2CVqz8y92idIxmaYMl1yyoAPfjRLwUOFrS0c7R9Sh8/btHIsu4W3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5935092"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5935092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 21:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="14012527"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Mar 2024 21:37:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmni8-000ILH-1L;
	Wed, 20 Mar 2024 04:37:56 +0000
Date: Wed, 20 Mar 2024 12:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 50/65] include/linux/unroll.h:82:37: error:
 pasting ""Unsupported unroll count: "" and "32" does not give a valid
 preprocessing token
Message-ID: <202403201241.0UWHOtmg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   3ec29f243914b957e581e1b00106eef6308d5680
commit: 7292c0205ebac9ec5f4d2ef3076e39971beed8bd [50/65] unroll: add generic loop unroll helpers
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20240320/202403201241.0UWHOtmg-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403201241.0UWHOtmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403201241.0UWHOtmg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/r4kcache.h:16,
                    from arch/mips/mm/c-r4k.c:33:
   arch/mips/include/asm/r4kcache.h: In function 'blast_dcache16':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:89,
                    from <command-line>:
>> arch/mips/include/asm/r4kcache.h:214:38: error: expected ')' before numeric constant
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                                      ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_dcache16_page':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:30: error: expected ')' before numeric constant
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                              ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_dcache16_page_indexed':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:38: error: expected ')' before numeric constant
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                                      ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:245:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     245 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_icache16':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:214:38: error: expected ')' before numeric constant
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                                      ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_icache16_page':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:30: error: expected ')' before numeric constant
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                              ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_icache16_page_indexed':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:38: error: expected ')' before numeric constant
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                                      ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:246:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     246 | __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_scache16':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> arch/mips/include/asm/r4kcache.h:214:38: error: expected ')' before numeric constant
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                                      ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_scache16_page':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:30: error: expected ')' before numeric constant
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                              ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:224:17: note: in expansion of macro 'cache_unroll'
     224 |                 cache_unroll(32, kernel_cache, hitop, start, lsize);    \
         |                 ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_scache16_page_indexed':
>> include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:38: error: expected ')' before numeric constant
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                                      ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:151:70: error: expected ',' or ';' before ')' token
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                      ^
   include/linux/compiler_types.h:439:25: note: in expansion of macro '__compiletime_error'
     439 |                         __compiletime_error(msg);                       \
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:241:25: note: in expansion of macro 'cache_unroll'
     241 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:247:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     247 | __BUILD_BLAST_CACHE(s, scache, Index_Writeback_Inv_SD, Hit_Writeback_Inv_SD, 16, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h: In function 'blast_dcache32':
   include/linux/unroll.h:82:37: error: pasting ""Unsupported unroll count: "" and "32" does not give a valid preprocessing token
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                         ^~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:248:1: note: in expansion of macro '__BUILD_BLAST_CACHE'
     248 | __BUILD_BLAST_CACHE(d, dcache, Index_Writeback_Inv_D, Hit_Writeback_Inv_D, 32, )
         | ^~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:38: error: expected ')' before numeric constant
     214 |                         cache_unroll(32, kernel_cache, indexop,         \
         |                                      ^~
   include/linux/compiler_attributes.h:151:66: note: in definition of macro '__compiletime_error'
     151 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                                  ^~~
   include/linux/compiler_types.h:448:9: note: in expansion of macro '__compiletime_assert'
     448 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/unroll.h:82:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      82 |                 BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
         |                 ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:197:9: note: in expansion of macro 'unrolled_call'
     197 |         unrolled_call(times, _cache_op, insn, op,                       \
         |         ^~~~~~~~~~~~~
   arch/mips/include/asm/r4kcache.h:214:25: note: in expansion of macro 'cache_unroll'
..


vim +82 include/linux/unroll.h

    16	
    17	#define unrolled							    \
    18		__pick_unrolled(clang loop unroll(enable), /* nothing */)
    19	#define unrolled_count(n)						    \
    20		__pick_unrolled(clang loop unroll_count(n), GCC unroll n)
    21	#define unrolled_full							    \
    22		__pick_unrolled(clang loop unroll(full), GCC unroll 65534)
    23	#define unrolled_none							    \
    24		__pick_unrolled(clang loop unroll(disable), GCC unroll 1)
    25	
    26	/**
    27	 * unrolled_call - explicitly unroll a loop, for use in cases where doing so
    28	 * is performance critical
    29	 * @times: number of times to call @fn
    30	 * @fn: function to call repeatedly
    31	 *
    32	 * Ideally we'd rely upon the compiler to provide this but there's no commonly
    33	 * available means to do so. For example GCC's `#pragma GCC unroll`
    34	 * functionality would be ideal but is only available from GCC 8 onwards.
    35	 * Using `-funroll-loops` is an option but GCC tends to make poor choices when
    36	 * compiling string functions. `-funroll-all-loops` leads to massive code
    37	 * bloat, even if only applied to the string functions.
    38	 */
    39	#define unrolled_call(times, fn, ...) do {				    \
    40		static_assert(__builtin_constant_p(times));			    \
    41										    \
    42		switch (times) {						    \
    43		case 32: fn(__VA_ARGS__); fallthrough;				    \
    44		case 31: fn(__VA_ARGS__); fallthrough;				    \
    45		case 30: fn(__VA_ARGS__); fallthrough;				    \
    46		case 29: fn(__VA_ARGS__); fallthrough;				    \
    47		case 28: fn(__VA_ARGS__); fallthrough;				    \
    48		case 27: fn(__VA_ARGS__); fallthrough;				    \
    49		case 26: fn(__VA_ARGS__); fallthrough;				    \
    50		case 25: fn(__VA_ARGS__); fallthrough;				    \
    51		case 24: fn(__VA_ARGS__); fallthrough;				    \
    52		case 23: fn(__VA_ARGS__); fallthrough;				    \
    53		case 22: fn(__VA_ARGS__); fallthrough;				    \
    54		case 21: fn(__VA_ARGS__); fallthrough;				    \
    55		case 20: fn(__VA_ARGS__); fallthrough;				    \
    56		case 19: fn(__VA_ARGS__); fallthrough;				    \
    57		case 18: fn(__VA_ARGS__); fallthrough;				    \
    58		case 17: fn(__VA_ARGS__); fallthrough;				    \
    59		case 16: fn(__VA_ARGS__); fallthrough;				    \
    60		case 15: fn(__VA_ARGS__); fallthrough;				    \
    61		case 14: fn(__VA_ARGS__); fallthrough;				    \
    62		case 13: fn(__VA_ARGS__); fallthrough;				    \
    63		case 12: fn(__VA_ARGS__); fallthrough;				    \
    64		case 11: fn(__VA_ARGS__); fallthrough;				    \
    65		case 10: fn(__VA_ARGS__); fallthrough;				    \
    66		case 9: fn(__VA_ARGS__); fallthrough;				    \
    67		case 8: fn(__VA_ARGS__); fallthrough;				    \
    68		case 7: fn(__VA_ARGS__); fallthrough;				    \
    69		case 6: fn(__VA_ARGS__); fallthrough;				    \
    70		case 5: fn(__VA_ARGS__); fallthrough;				    \
    71		case 4: fn(__VA_ARGS__); fallthrough;				    \
    72		case 3: fn(__VA_ARGS__); fallthrough;				    \
    73		case 2: fn(__VA_ARGS__); fallthrough;				    \
    74		case 1: fn(__VA_ARGS__); fallthrough;				    \
    75		case 0:								    \
    76			break;							    \
    77		default:							    \
    78			/*							    \
    79			 * Either the iteration count is unreasonable or we need    \
    80			 * to add more cases above.				    \
    81			 */							    \
  > 82			BUILD_BUG_ON_MSG(1, "Unsupported unroll count: " ##times);  \
    83			break;							    \
    84		}								    \
    85	} while (0)
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
