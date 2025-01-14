Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25362204590
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736883819; cv=none; b=ilkoBDmLD7aBK+pqJw0JaXpphImKUZvrYOO+lSwTb6gshG9hQMw4v5HnwTTBQkW/GQYNj93T1uIe8lnDGv3kS+Xw2tZUsdL1Uh1cfyazUksJvtx+JzCs3ncYPd8/U4IgqUyn2jce2Rw5uWmGUxlxMVYwe6YgW4J+B+JhyhzgLWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736883819; c=relaxed/simple;
	bh=uIUwG3CrFkBTVFpejmHgHbVEEsIfyRZQW1auvriNR3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaHXl+ZTzqx+85XBDXP3A2aOYttYhbFgDCcJonZou3LZzNpEZkiTQxV0aqj7eAu/WrtSLTlrO2JwHqJRVbelje1mr037QgSfH8ERMEFvdj8EWA1kn01W2zL0+wEYCRYFUuDjeaaYFV3IDV1ks+s3GbtBUJJrBWQDqn7B9mccBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lhi4JzGi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lhi4JzGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736883816; x=1768419816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uIUwG3CrFkBTVFpejmHgHbVEEsIfyRZQW1auvriNR3w=;
  b=Lhi4JzGiURS38YR34ECfx6A5g0IcfTmcFcjdZ5jYFOVDVKYkY/DVTv8E
   HTrzqGW8cOPQIq7lWgLLGxjkAzWvPHwrJyo1dgA0+BcSIz1mpM2A3QtQg
   myRkyG8nNc4UtxgI2OAuNChVN3fxv0CILxFVru+ng+hhbQ3/2loeHAMRn
   xNdrvowIe0+xRzAXduI2/p9CV6vI0W1MbWesYnUWKVb6V6I0vHDtHmizW
   TZQ0AJOve1UtA1SmkMQvTbhVmWt6YMdlILRt9zU3IKwJ3Vu5ryQPeSK2h
   YFjIUtRobEaYb8wLmMz/uQZXUAczU/gtqY9In5vwW3gh1q/2oeLM4MQNR
   A==;
X-CSE-ConnectionGUID: CDvA+r2CSBO3sEqkNCIWiQ==
X-CSE-MsgGUID: eTt4zUAHT4i4br//fCx9kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="24801872"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; 
   d="scan'208";a="24801872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 11:43:35 -0800
X-CSE-ConnectionGUID: sja9soYQT4eDpSenusGOyQ==
X-CSE-MsgGUID: lTE7NKRWQPaCoIor1CALyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105396506"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2025 11:43:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXmp1-000OxL-1W;
	Tue, 14 Jan 2025 19:43:31 +0000
Date: Wed, 15 Jan 2025 03:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] f2fs: add a sysfs entry to request donate
 file-backed pages
Message-ID: <202501150319.8pSlgSSX-lkp@intel.com>
References: <20250113183933.1268282-2-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113183933.1268282-2-jaegeuk@kernel.org>

Hi Jaegeuk,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev]
[also build test ERROR on linus/master v6.13-rc7 next-20250114]
[cannot apply to jaegeuk-f2fs/dev-test]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaegeuk-Kim/f2fs-add-a-sysfs-entry-to-request-donate-file-backed-pages/20250114-025051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev
patch link:    https://lore.kernel.org/r/20250113183933.1268282-2-jaegeuk%40kernel.org
patch subject: [PATCH 2/2] f2fs: add a sysfs entry to request donate file-backed pages
config: i386-buildonly-randconfig-004-20250114 (https://download.01.org/0day-ci/archive/20250115/202501150319.8pSlgSSX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150319.8pSlgSSX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150319.8pSlgSSX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/proc_fs.h:10,
                    from fs/f2fs/sysfs.c:10:
   fs/f2fs/sysfs.c: In function '__sbi_store':
>> fs/f2fs/sysfs.c:815:48: error: 'struct f2fs_sb_info' has no member named 'ndirty_inode'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                                ^~
   include/linux/minmax.h:99:49: note: in definition of macro '__careful_cmp_once'
      99 |         __auto_type ux = (x); __auto_type uy = (y);     \
         |                                                 ^
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
   In file included from fs/f2fs/sysfs.c:9:
>> include/linux/compiler.h:189:45: error: '__UNIQUE_ID_y_948' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_947'?
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
   include/linux/compiler.h:189:45: note: each undeclared identifier is reported only once for each function it appears in
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:56:27: note: in expansion of macro 'is_signed_type'
      56 | #define __sign_use(x,ux) (is_signed_type(typeof(ux))? \
         |                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> fs/f2fs/sysfs.c:815:48: error: 'struct f2fs_sb_info' has no member named 'ndirty_inode'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                                ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> fs/f2fs/sysfs.c:815:48: error: 'struct f2fs_sb_info' has no member named 'ndirty_inode'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                                ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> fs/f2fs/sysfs.c:815:48: error: 'struct f2fs_sb_info' has no member named 'ndirty_inode'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                                ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> fs/f2fs/sysfs.c:815:48: error: 'struct f2fs_sb_info' has no member named 'ndirty_inode'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                                ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> fs/f2fs/sysfs.c:815:48: error: 'struct f2fs_sb_info' has no member named 'ndirty_inode'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                                ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
>> fs/f2fs/sysfs.c:815:48: error: 'struct f2fs_sb_info' has no member named 'ndirty_inode'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                                ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   include/linux/compiler_types.h:522:17: note: in expansion of macro 'if'
     522 |                 if (!(condition))                                       \
         |                 ^~
   include/linux/compiler_types.h:530:9: note: in expansion of macro '__compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:542:9: note: in expansion of macro '_compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/sysfs.c:815:38: note: in expansion of macro 'min'
     815 |                 sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
         |                                      ^~~
..


vim +815 fs/f2fs/sysfs.c

   676	
   677		if (!strcmp(a->attr.name, "atgc_candidate_ratio")) {
   678			if (t > 100)
   679				return -EINVAL;
   680			sbi->am.candidate_ratio = t;
   681			return count;
   682		}
   683	
   684		if (!strcmp(a->attr.name, "atgc_age_weight")) {
   685			if (t > 100)
   686				return -EINVAL;
   687			sbi->am.age_weight = t;
   688			return count;
   689		}
   690	
   691		if (!strcmp(a->attr.name, "gc_segment_mode")) {
   692			if (t < MAX_GC_MODE)
   693				sbi->gc_segment_mode = t;
   694			else
   695				return -EINVAL;
   696			return count;
   697		}
   698	
   699		if (!strcmp(a->attr.name, "gc_pin_file_threshold")) {
   700			if (t > MAX_GC_FAILED_PINNED_FILES)
   701				return -EINVAL;
   702			sbi->gc_pin_file_threshold = t;
   703			return count;
   704		}
   705	
   706		if (!strcmp(a->attr.name, "gc_reclaimed_segments")) {
   707			if (t != 0)
   708				return -EINVAL;
   709			sbi->gc_reclaimed_segs[sbi->gc_segment_mode] = 0;
   710			return count;
   711		}
   712	
   713		if (!strcmp(a->attr.name, "seq_file_ra_mul")) {
   714			if (t >= MIN_RA_MUL && t <= MAX_RA_MUL)
   715				sbi->seq_file_ra_mul = t;
   716			else
   717				return -EINVAL;
   718			return count;
   719		}
   720	
   721		if (!strcmp(a->attr.name, "max_fragment_chunk")) {
   722			if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
   723				sbi->max_fragment_chunk = t;
   724			else
   725				return -EINVAL;
   726			return count;
   727		}
   728	
   729		if (!strcmp(a->attr.name, "max_fragment_hole")) {
   730			if (t >= MIN_FRAGMENT_SIZE && t <= MAX_FRAGMENT_SIZE)
   731				sbi->max_fragment_hole = t;
   732			else
   733				return -EINVAL;
   734			return count;
   735		}
   736	
   737		if (!strcmp(a->attr.name, "peak_atomic_write")) {
   738			if (t != 0)
   739				return -EINVAL;
   740			sbi->peak_atomic_write = 0;
   741			return count;
   742		}
   743	
   744		if (!strcmp(a->attr.name, "committed_atomic_block")) {
   745			if (t != 0)
   746				return -EINVAL;
   747			sbi->committed_atomic_block = 0;
   748			return count;
   749		}
   750	
   751		if (!strcmp(a->attr.name, "revoked_atomic_block")) {
   752			if (t != 0)
   753				return -EINVAL;
   754			sbi->revoked_atomic_block = 0;
   755			return count;
   756		}
   757	
   758		if (!strcmp(a->attr.name, "readdir_ra")) {
   759			sbi->readdir_ra = !!t;
   760			return count;
   761		}
   762	
   763		if (!strcmp(a->attr.name, "hot_data_age_threshold")) {
   764			if (t == 0 || t >= sbi->warm_data_age_threshold)
   765				return -EINVAL;
   766			if (t == *ui)
   767				return count;
   768			*ui = (unsigned int)t;
   769			return count;
   770		}
   771	
   772		if (!strcmp(a->attr.name, "warm_data_age_threshold")) {
   773			if (t <= sbi->hot_data_age_threshold)
   774				return -EINVAL;
   775			if (t == *ui)
   776				return count;
   777			*ui = (unsigned int)t;
   778			return count;
   779		}
   780	
   781		if (!strcmp(a->attr.name, "last_age_weight")) {
   782			if (t > 100)
   783				return -EINVAL;
   784			if (t == *ui)
   785				return count;
   786			*ui = (unsigned int)t;
   787			return count;
   788		}
   789	
   790		if (!strcmp(a->attr.name, "max_read_extent_count")) {
   791			if (t > UINT_MAX)
   792				return -EINVAL;
   793			*ui = (unsigned int)t;
   794			return count;
   795		}
   796	
   797		if (!strcmp(a->attr.name, "ipu_policy")) {
   798			if (t >= BIT(F2FS_IPU_MAX))
   799				return -EINVAL;
   800			/* allow F2FS_IPU_NOCACHE only for IPU in the pinned file */
   801			if (f2fs_lfs_mode(sbi) && (t & ~BIT(F2FS_IPU_NOCACHE)))
   802				return -EINVAL;
   803			SM_I(sbi)->ipu_policy = (unsigned int)t;
   804			return count;
   805		}
   806	
   807		if (!strcmp(a->attr.name, "dir_level")) {
   808			if (t > MAX_DIR_HASH_DEPTH)
   809				return -EINVAL;
   810			sbi->dir_level = t;
   811			return count;
   812		}
   813	
   814		if (!strcmp(a->attr.name, "donate_caches")) {
 > 815			sbi->donate_caches = min(t, sbi->ndirty_inode[DONATE_INODE]);
   816			f2fs_donate_caches(sbi);
   817			return count;
   818		}
   819	
   820		*ui = (unsigned int)t;
   821	
   822		return count;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
